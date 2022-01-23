import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game_leve1.dart';
import 'game_level2.dart';

class Selectlevel extends StatefulWidget {
  final int level;

  const Selectlevel({Key key, this.level}) : super(key: key);

  @override
  _SelectlevelState createState() => _SelectlevelState();
}

class _SelectlevelState extends State<Selectlevel> {
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
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 30),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text("رجوع",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 20)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(" المرحلة " + widget.level.toString(),
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 30))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (widget.level == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GameLeve1(level: 1);
                                        },
                                      ),
                                    );
                                  } else if (widget.level == 2) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GameLeve1(level: 3);
                                        },
                                      ),
                                    );
                                  } else if (widget.level == 3) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GameLeve1(level: 5);
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: Colors.black),
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.all(5),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Center(
                                    child: Text(
                                      "أتعلم",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (widget.level == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GameLevel2(level: 2);
                                        },
                                      ),
                                    );
                                  } else if (widget.level == 2) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GameLevel2(level: 4);
                                        },
                                      ),
                                    );
                                  } else if (widget.level == 3) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return GameLevel2(level: 6);
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: Colors.black),
                                    color: Colors.blue,
                                  ),
                                  padding: EdgeInsets.all(5),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Center(
                                    child: Text(
                                      "ألعب",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
