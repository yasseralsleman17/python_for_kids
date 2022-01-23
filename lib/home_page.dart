import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:python_for_kids/profile.dart';
import 'package:python_for_kids/selectlevel.dart';
import 'package:python_for_kids/statistics.dart';
import 'package:python_for_kids/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "", password = "", phone = "", email = "";
  int level = 1, points, characterid;

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final keyName = 'name';
    final keyPassword = 'password';
    final keyPhone = 'phone';
    final keyEmail = 'email';
    final keyLevel = 'level';
    final keypoints = 'points';
    final keycharacterid = 'characterid';

    final valueName = prefs.get(keyName);
    final valuePassword = prefs.get(keyPassword);
    final valuePhone = prefs.get(keyPhone);
    final valueEmail = prefs.get(keyEmail);
    final valueLevel = prefs.getInt(keyLevel);
    final valuePoints = prefs.getInt(keypoints);
    final valueCharacterid = prefs.getInt(keycharacterid);

    setState(() {
      userName = valueName.toString();
      password = valuePassword.toString();
      phone = valuePhone.toString();
      email = valueEmail.toString();
      level = valueLevel;
      points = valuePoints;
      characterid = valueCharacterid;
      print(valueLevel);
    });
  }

  _logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  void initState() {
    super.initState();
    _read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/im_02.jpg'), fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (characterid == 1)
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Image.asset(
                          "assets/ch1.PNG",
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                    if (characterid == 2)
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Image.asset(
                          "assets/ch2.PNG",
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                    if (characterid == 3)
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Image.asset(
                          "assets/ch3.PNG",
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                    if (characterid == 4)
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Image.asset(
                          "assets/ch4.PNG",
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                    if (characterid == 5)
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Image.asset(
                          "assets/ch5.png",
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                    if (characterid == 6)
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Image.asset(
                          "assets/ch6.png",
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Statistics();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      ":الاحصائيات",
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(
                                " مرحباً في نيّر",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 35),
                              ),
                              Text("لنبدأ رحلة التعلم الممتعة",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text(points.toString() + ":النقاط",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 15))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Container(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (level >= 5)
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Selectlevel(
                                            level: 3,
                                          );
                                        },
                                      ),
                                    );
                                },
                                child: Container(
                                  decoration: new BoxDecoration(
                                    color: Color(0x66d4d3d3),
                                    borderRadius: BorderRadius.circular(15.0),
                                    border:
                                        Border.all(color: Color(0xff636363)),
                                  ),
                                  width: 100,
                                  height: 100,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " 3 ",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: level >= 5
                                              ? Color(0xff000000)
                                              : Color(0xffb3b1b1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (level >= 3)
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Selectlevel(level: 2);
                                        },
                                      ),
                                    );
                                },
                                child: Container(
                                  decoration: new BoxDecoration(
                                    color: Color(0x66d4d3d3),
                                    borderRadius: BorderRadius.circular(15.0),
                                    border:
                                        Border.all(color: Color(0xff636363)),
                                  ),
                                  width: 100,
                                  height: 100,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " 2 ",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: level >= 3
                                              ? Color(0xff000000)
                                              : Color(0xffb3b1b1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Selectlevel(
                                          level: 1,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: new BoxDecoration(
                                    color: Color(0x66d4d3d3),
                                    borderRadius: BorderRadius.circular(15.0),
                                    border:
                                        Border.all(color: Color(0xff636363)),
                                  ),
                                  width: 100,
                                  height: 100,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        " 1 ",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff000000),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _logout();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomePage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            " تسجيل الخروج ",
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Profile();
                                },
                              ),
                            );
                          },
                          child: Text("الصفحة الشخصية",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
