import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:python_for_kids/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db_helper.dart';
import 'home_page.dart';
import 'user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  String userName = "", password = "", phone = "", email = "";
int level,points,characterid,id;

  _saveLoginInfo(int id,
      String name, String password, String phone, String email, int level, int points,int characterid) async {
    final prefs = await SharedPreferences.getInstance();

    final keyID = 'ID';
    final keyName = 'name';
    final keyPassword = 'password';
    final keyPhone = 'phone';
    final keyEmail = 'email';
    final keyLevel = 'level';
    final keypoints = 'points';
    final keycharacterid = 'characterid';

    final valueID = id;
    final valueName = name;
    final valuePassword = password;
    final valuePhone = phone;
    final valueEmail = email;
    final valueLevel = level;
    final valuePoints = points;
    final valueCharacterid = characterid;

    prefs.setInt(keyID, valueID);
    prefs.setString(keyName, valueName);
    prefs.setString(keyPassword, valuePassword);
    prefs.setString(keyPhone, valuePhone);
    prefs.setString(keyEmail, valueEmail);
    prefs.setInt(keyLevel, valueLevel);
    prefs.setInt(keypoints, valuePoints);
    prefs.setInt(keycharacterid, valueCharacterid);
  }

  void btnLogin() {
    if (_nameController.text.isEmpty || _passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "الرجاء ملئ الحقول بالقيم المناسبة",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      checkUser(_nameController.text);
    }
  }

  void checkUser(String name) async {
    try {
      List userList =
          await DatabaseHelper.instance.searchUser(name.toString().trim());

      print(userList);
      if (userList.length > 0) {
        userName = userList[0][UserModel.NAME];
        password = userList[0][UserModel.PASSWORD];
        phone = userList[0][UserModel.PHONE];
        email = userList[0][UserModel.EMAIL];
        level = userList[0][UserModel.LEVEL];
        points = userList[0][UserModel.POINTS];
        characterid = userList[0][UserModel.CHARACTERID];
        id = userList[0][UserModel.ID];

        if (_nameController.text == userName &&
            _passwordController.text == password) {
          Fluttertoast.showToast(
              msg: "تم تسجيل الدخول بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          _nameController.clear();
          _passwordController.clear();

          _saveLoginInfo(id,userName, password,phone,email,level,points,characterid);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Fluttertoast.showToast(
              msg: "اليانات المدخلة غير صحيحة",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: "الحساب المدخل غير موجود",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/im_02.jpg'),
                fit: BoxFit.fill
            ),),
          child:
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    " تسجيل الدخول",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "   اسم المستخدم   ",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black),
                          color: Colors.grey[300],
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          textDirection: TextDirection.rtl,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            border: InputBorder.none,
                            filled: false,
                            hintText: "    اسم المستخدم",
                            hintStyle: TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.all(0),
                            labelStyle: TextStyle(fontSize: 18),
                            // suffixIcon: icon,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "كلمة المرور   ",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.black),
                          color: Colors.grey[300],
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          textDirection: TextDirection.rtl,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            filled: false,
                            hintText: "    كلمة المرور",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            labelStyle: TextStyle(fontSize: 18),
                            // suffixIcon: icon,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.blue),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          "ليس لديك حساب؟   ",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: btnLogin,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black),
                        color: Colors.blue,
                      ),
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text(
                          " دخول",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}
