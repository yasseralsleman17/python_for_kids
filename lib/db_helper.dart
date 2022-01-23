import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:python_for_kids/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class DatabaseHelper {
  List productName = [];

  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database _database;

  DatabaseHelper._init();

  static String tableName = 'User';
  static String tablePoints = 'UserPoints';

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('pythonforkids.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE $tableName ( 
  ${UserModel.ID} INTEGER PRIMARY KEY AUTOINCREMENT,  
  ${UserModel.NAME} TEXT NOT NULL, 
  ${UserModel.PASSWORD} TEXT NOT NULL,
  ${UserModel.PHONE} TEXT NOT NULL,
  ${UserModel.EMAIL} TEXT NOT NULL ,
  ${UserModel.LEVEL} INTEGER NOT NULL ,
  ${UserModel.POINTS} INTEGER NOT NULL,
  ${UserModel.CHARACTERID} INTEGER NOT NULL
  )
''');

    await db.execute('''
CREATE TABLE $tablePoints ( 
  ${"id"} INTEGER PRIMARY KEY AUTOINCREMENT,  
  ${"user_id"} INTEGER NOT NULL, 
  ${"date"} TEXT NOT NULL ,
  ${"points"} INTEGER NOT NULL
  )
''');
  }



  Future<int> addUser(UserModel user) async {
    DateTime dateTime = DateTime.now();
    String date =dateTime.year.toString()+"/"+dateTime.month.toString()+"/"+dateTime.day.toString();

    final db = await instance.database;
    final id = await db.insert(tableName, user.toJson());

    final maps = await db.query(
      tableName,
      columns: UserModel.values,
      where: '${UserModel.NAME} = ?',
      whereArgs: [user.name],
    );

    await db.insert(tablePoints,  {
      "id": null,
      "user_id": maps[0]["id"],
      "date": date,
      "points": 0,
    });
    return id;
  }





  Future<UserModel> getUser(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: UserModel.values,
      where: '${UserModel.ID} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List> searchUser(String userName) async {
    final db = await instance.database;

    final maps = await db.query(
      tableName,
      columns: UserModel.values,
      where: '${UserModel.NAME} = ?',
      whereArgs: [userName],
    );

    return maps.toList();
  }

  Future<int> update(UserModel userModel) async {
    final db = await instance.database;

    final userList = await db.query(
      tableName,
      columns: UserModel.values,
      where: '${UserModel.PASSWORD} = ? and ${UserModel.EMAIL} = ?',
      whereArgs: [userModel.password, userModel.email],
    );

    print(userList);
    if (userList.length > 0) {
      int id = await db.rawUpdate('''
    UPDATE $tableName 
    SET ${UserModel.NAME} = ?, 
  ${UserModel.PASSWORD} = ?,
  ${UserModel.PHONE} = ?,
  ${UserModel.EMAIL} = ?
    WHERE ${UserModel.ID} = ?
    ''', [
        userModel.name,
        userModel.password,
        userModel.phone,
        userModel.email,
        userList[0][UserModel.ID]
      ]);

      return id;
    } else {
      Fluttertoast.showToast(
          msg: "الرجاء التأكد من الايميل وكلمة السر",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

      return 0;
    }
  }

  Future<int> updateCharecterId(int charecterid, int userid) async {
    final db = await instance.database;

    int id = await db.rawUpdate('''
    UPDATE $tableName 
    SET ${UserModel.CHARACTERID} = ?
    WHERE ${UserModel.ID} = ?
    ''', [charecterid, userid]);

    return id;
  }

  Future<int> updatelevel(int level, int points, int userid,String date) async {
    final db = await instance.database;

    int id = await db.rawUpdate('''
    UPDATE $tableName 
    SET ${UserModel.LEVEL} = ? ,
     ${UserModel.POINTS} = ?
    WHERE ${UserModel.ID} = ?
    ''', [level, points, userid]);


    final maps = await db.query(
      tablePoints,
      columns:  [
        "id",
        "user_id",
        "date",
        "points",
      ],
      where: 'user_id = ?',
      whereArgs: [userid],
    );

 if  (maps[maps.length-1]["date"]==date)
   {
     int p =maps[maps.length-1]["points"] ;
     p=p+10;
     await db.rawUpdate('''
    UPDATE $tablePoints 
    SET points = ?
    WHERE id = ?
    ''', [  p , (maps[maps.length-1]["id"])]);

   }
 else{

   await db.insert(tablePoints,  {
     "id": null,
     "user_id": userid,
     "date": date,
     "points":10 ,
   });


 }



    return id;
  }

  Future<List> getpointsrecord(int userid) async {
    final db = await instance.database;

    final maps = await db.query(tablePoints,columns:  [
      "id",
      "user_id",
      "date",
      "points",
    ],

      where: 'user_id = ?',
      whereArgs: [userid],
         );

    return maps.toList();
  }
}
