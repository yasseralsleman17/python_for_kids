import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

import 'db_helper.dart';
import 'home_page.dart';

class GameLevel2 extends StatefulWidget {
  final int level;

  GameLevel2({Key key, this.level}) : super(key: key);

  createState() => _GameLevel2State();
}

class _GameLevel2State extends State<GameLevel2> {
  final Map<String, bool> score = {};

  Map choices;
  String question;

  int level, points, id;
  AudioCache _audioCache;

  _read() async {

    final prefs = await SharedPreferences.getInstance();

    final keyLevel = 'level';
    final keypoints = 'points';
    final keyId = 'ID';

    final valueLevel = prefs.getInt(keyLevel);
    final valuePoints = prefs.getInt(keypoints);
    final valueID = prefs.getInt(keyId);

    setState(() {
      id = valueID;
      points = valuePoints;
      level = valueLevel;
    });
  }

  @override
  void initState() {
    _audioCache = AudioCache(
      prefix: 'assets/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );

    _read();
    if (widget.level == 2) {
      question = "^__^";

      choices = {
        "print(“مرحبًا بك”)": Color(0x22988888),
        'print(“ اصبحت تعلم الآن انك تستطيع طباعة كل ما تريد  من احرف وارقام ”)': Color(0x44988888),
        'print("هل نكمل الرحلة ؟ عد معي من ٣ الى ١")': Color(0x66988888),
        'print(٣)': Color(0x88988888),
        'print(٢)': Color(0xaa988888),
        'print(١)': Color(0xff988888)
      };
    }

    if (widget.level == 4) {
      question =
"اوجد جميع العمليات الحسابية للرقمين 2, 4 مرتبة كالتالي + >> - >> * >> / >> % >> ^";
      choices = {
        "4+2 = 6": Color(0x22686d55),
        "4-2 = 2": Color(0x44686d55),
        "4*2 = 8": Color(0x66686d55),
        "4/2 =2": Color(0x88686d55),
        "4%2 =0": Color(0xaa686d55),
        "4^2 =8": Color(0xff686d55),
      };
    }
    if (widget.level == 6) {
      question = "رتب الكود بحيث نعرف متغير A وقيمته 12 ثم متغير آخر B وقيمته 1.2 وأخيرا المتغير C و قيمته P";
      choices = {
        'int A': Color(0x225f5d00),
        'A= 12': Color(0x445f5d00),
        'float B': Color(0x665f5d00),
        'B=1.2 ': Color(0x885f5d00),
        'string C': Color(0xaa5f5d00),
        'C=”welcome”': Color(0xff5f5d00)
      };
    }
  }

  // Random seed to shuffle order of items.
  int seed = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(
            () {
              count=0;
              score.clear();
              seed++;
            },
          );
        },
      ),




      body: SafeArea(
        child:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/im_02.jpg'),
                fit: BoxFit.fill
            ),),

          child:

          SingleChildScrollView(
            child: Stack(
              children: [
                Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: new BoxDecoration(
                          color: Color(0x6682f5a9),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xff0a0a0a)),
                        ),
                        child: Text(
                          question,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff143b53),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: choices.keys.map((code) {
                          return Draggable<String>(
                            data: code,
                            child: score[code] == true
                                ? Container(
                              height: 1,
                            )
                                : Code(code: code),
                            feedback: Code(code: code),
                            childWhenDragging: Code(code: '?'),
                          );
                        }).toList()
                          ..shuffle(Random(seed)),
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          //  color: Color(0x3cf6c7c7),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Color(0xff636363)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: choices.keys
                              .map((code) => _buildDragTarget(code))
                              .toList(),
                        ),
                      ),
                      if ( count == 6)
                        TextButton(
                          onPressed: () async {
                            _audioCache.play('win.m4a');
                            await Future.delayed(Duration(milliseconds: 1000));

                            savelevel();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Colors.black),
                              color: Colors.blue,
                            ),
                            padding: EdgeInsets.all(5),
                            height: 50,
                            width: 200,
                            child: Center(
                              child: Text(
                                "المرحلة التالية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),





    );
  }

  Widget _buildDragTarget(code) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (score[code] == true) {
          return Container(
            //   color: Color(0xCDEED4D4),
            child: Text(code),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 13,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: new BoxDecoration(
              color: Color(0x66d4d3d3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border.all(color: Color(0xff636363)),
            ),
            margin: EdgeInsets.fromLTRB(25, 5, 25, 5),
            padding: EdgeInsets.all(5),
          );
        } else {
          return Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            color: choices[code],
            height: MediaQuery.of(context).size.height / 13,
            width: MediaQuery.of(context).size.width * 0.7,
          );
        }
      },
      onWillAccept: (data) => data == code,
      onAccept: (data) {
        setState(() {
          count++;
          score[code] = true;
        });
      },
      onLeave: (data) {},
    );
  }

  Future<void> savelevel() async {

    final prefs = await SharedPreferences.getInstance();

    final keyLevel = 'level';
    final keypoints = 'points';
    int valueLevel;
    if (level == widget.level)
      valueLevel = widget.level + 1;
    else
      valueLevel = level;

    final valuePoints = points + 10;

    prefs.setInt(keyLevel, valueLevel);
    prefs.setInt(keypoints, valuePoints);
    DateTime dateTime = DateTime.now();
    String date =dateTime.year.toString()+"/"+dateTime.month.toString()+"/"+dateTime.day.toString();

    int result =
        await DatabaseHelper.instance.updatelevel(valueLevel, valuePoints, id,date);
  }
}

class Code extends StatelessWidget {
  Code({Key key, this.code}) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: Color(0x66d4d3d3),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Color(0xff636363)),
        ),
        margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
        alignment: Alignment.center,
        child: Text(
          code,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );
  }
}
