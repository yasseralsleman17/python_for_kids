import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

import 'db_helper.dart';
import 'home_page.dart';

class GameLeve1 extends StatefulWidget {
 final int level;

  const GameLeve1({Key key,this.level}) : super(key: key);

  @override
  _GameLeve1State createState() => _GameLeve1State();
}

class _GameLeve1State extends State<GameLeve1> {
  int opencard = 0;
  int showedcard = 0;
  List<String> checkCard = ["", "", ""];
  List<int> choossedCard = [0, 0, 0];

  int count = 0;

  Map lessontitle;
  Map lessonbody;
  List<String> printnum = [
    "print1",
    "print2",
    "print3",
    "print4",
    "print5",
    "print6"
  ];

  List<bool> allcard = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> allresultcard = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  String icon = "assets/im_05.jpg";

  int level, points, id;
  int seed = 0;
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
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
    _read();
    seed=widget.level;
    if (widget.level == 1) {
      lessontitle = {
        "print1": "حروف و أرقام numbers & letters",
        "print2": "الدوال function ",
        "print3": "طباعة print",
        "print4": "أقواس()",
        "print5": '"علامتي التنصيص"',
        "print6": "التنفيذ run"
      };

      lessonbody = {
        "print1": "حروف و أرقام numbers & letters"   +"\n"+  "تشمل الأحرف و الأرقام لوحة المفاتيح كاملة بما في ذلك الرموز ",
        "print2": "الدوال function "                +"\n"+  "هي أوامر نعطيها للحاسوب لكي ينفذها",
        "print3": "طباعة print"                     +"\n"+  "تمكننا دالة الطباعة من عرض ما نريد على شاشة الحاسوب ",
        "print4": "أقواس()"                         +"\n"+  "تكتب الأوامر للدوال داخل الاقواس التي توضع بعدها مباشرة كدالة الطباعة print()",
        "print5": '"علامتي التنصيص"'                  +"\n"+  "إذا أردنا التعامل مع الحروف أو الجمل لابد أن نضعها بين علامة التنصيص ",
        "print6": "التنفيذ run"                     +"\n"+  "run هو الزر الذي ينفذ الأوامر المعطاة للحاسوب"
      };
    }

    if (widget.level == 3) {
      lessontitle = {
        "print1": "الجمع +",
        "print2": "الطرح -",
        "print3": "الضرب *",
        "print4": "القسمة /",
        "print5": "باقي القسمة %",
        "print6": "الأس ^"
      };

      lessonbody = {

        "print1": "الجمع"         +"\n"+  "يمكن جمع اي رقمين من خلال كتابة رمز الجمع + بينهما",
        "print2": "الطرح -"       +"\n"+  "يمكن طرح اي رقمين من خلال كتابة رمز الطرح - بينهما",
        "print3": "الضرب *"       +"\n"+  "يمكن ضرب اي رقمين من خلال كتابة رمز الضرب * بينهما",
        "print4": "القسمة /"       +"\n"+  "يمكن قسمة اي رقمين من خلال كتابة رمز القسمة / بينهما",
        "print5": "باقي القسمة %"  +"\n"+  "يمكن الحصول على باقي قسمة رقمين من خلال كتابة رمز الباقي %بينهما",
        "print6": "الأس ^"         +"\n"+  "يمكن إيجاد القوة لعدد من خلال كتابة الرقم ^ القوة"

        };
    }

    if (widget.level == 5) {
      lessontitle = {
        "print1": "المتغير",
        "print2": "الكلمات المحجوزة",
        "print3": "نوع المتغير",
        "print4": "نوع int",
        "print5": "نوع float ",
        "print6": "نوع string"
      };

      lessonbody = {

        "print1": "المتغير"          +"\n"+  "هو مساحة التي نحتاجها في الذاكرة لكي نخزن فيها قيمة متغيرة",
        "print2": "الكلمات المحجوزة"  +"\n"+  "هي الكلمات الخاصة لكتابة الكود بلغة وتستعمل لتحديد دوال او العمليات الجاهزة ",
        "print3": "نوع المتغير"      +"\n"+  "عند إنشاء متغير نقوم بتحديد نوع معين من البيانات لتخزن فيه, صيغته (نوع المتغير ثم اسمه)",
        "print4": "نوع int"         +"\n"+  "هي كلمة محجوزة تستعمل لإنشاء متغير من نوع عدد صحيح ",
        "print5": "نوع float "      +"\n"+  "هي كلمة محجوزة تستعمل لإنشاء متغير من نوع عدد عشري",
        "print6": "نوع string"      +"\n"+  "هي كلمة محجوزة تستعمل لإنشاء متغير من نوع سلسلة نصية"

      };

    }
    printnum = printnum.toList()
      ..shuffle(Random(seed));
  }

  double size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size
        .width * 0.27;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(
                () {
              count = 0;
              opencard = 0;
              showedcard = 0;
              checkCard = ["", "", ""];
              choossedCard = [0, 0, 0];

              allcard = [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false
              ];
              allresultcard = [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false
              ];

              seed++;
              printnum = printnum.toList()
                ..shuffle(Random(seed));

              print(printnum);
            },
          );
        },
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/im_02.jpg'), fit: BoxFit.fill),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          //  card 1 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[4]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[4] = true;
                                    if (!allresultcard[4]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 4;
                                      checkCard[showedcard] = printnum[2];
                                      checkResult(printnum[2]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[4]
                                  ? lessontitlewidget(printnum[2])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),
                          //  card 2 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[2]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[2] = true;
                                    if (!allresultcard[2]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 2;
                                      checkCard[showedcard] = printnum[1];
                                      checkResult(printnum[1]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[2]
                                  ? lessontitlewidget(printnum[1])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 3 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[5]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[5] = true;
                                    if (!allresultcard[5]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 5;
                                      checkCard[showedcard] = printnum[3];
                                      checkResult(printnum[3]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[5]
                                  ? lessontitlewidget(printnum[3])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 10 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[10]) {
                                setState(() {
                                  opencard++;
                                  allcard[10] = true;
                                  if (!allresultcard[10]) {
                                    showedcard++;
                                    choossedCard[showedcard] = 10;
                                    checkCard[showedcard] = printnum[4];
                                    checkResult(printnum[4]);
                                  }
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[10]
                                  ? lessontitlewidget(printnum[4])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),
                        ]..shuffle(Random(seed)),
                      ),
                      Container(
                        width: 25,
                      ),
                      Column(
                        children: [
                          //  card 4 //

                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[1]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[1] = true;
                                    if (!allresultcard[1]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 1;
                                      checkCard[showedcard] = printnum[0];
                                      checkResult(printnum[0]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),
                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[1]
                                  ? lessontitlewidget(printnum[0])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 5 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[12]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[12] = true;
                                    if (!allresultcard[12]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 12;
                                      checkCard[showedcard] = printnum[4];
                                      checkResult(printnum[4]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[12]
                                  ? lessontitlewidget(printnum[4])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 6 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[6]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[6] = true;
                                    if (!allresultcard[6]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 6;
                                      checkCard[showedcard] = printnum[2];
                                      checkResult(printnum[2]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[6]
                                  ? lessontitlewidget(printnum[2])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 11 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[9]) {
                                setState(() {
                                  opencard++;
                                  allcard[9] = true;
                                  if (!allresultcard[9]) {
                                    showedcard++;
                                    choossedCard[showedcard] = 9;
                                    checkCard[showedcard] = printnum[5];
                                    checkResult(printnum[5]);
                                  }
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[9]
                                  ? lessontitlewidget(printnum[5])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),
                        ]..shuffle(Random(seed)),
                      ),
                      Container(
                        width: 25,
                      ),
                      Column(
                        children: [
                          //  card 7 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[7]) {
                                setState(() {
                                  opencard++;
                                  allcard[7] = true;
                                  if (!allresultcard[7]) {
                                    showedcard++;
                                    choossedCard[showedcard] = 7;
                                    checkCard[showedcard] = printnum[1];
                                    checkResult(printnum[1]);
                                  }
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[7]
                                  ? lessontitlewidget(printnum[1])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 8 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[8]) {
                                setState(() {
                                  opencard++;
                                  allcard[8] = true;
                                  if (!allresultcard[8]) {
                                    showedcard++;
                                    choossedCard[showedcard] = 8;
                                    checkCard[showedcard] = printnum[3];
                                    checkResult(printnum[3]);
                                  }
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[8]
                                  ? lessontitlewidget(printnum[3])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 9 //

                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[11]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[11] = true;
                                    if (!allresultcard[11]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 11;
                                      checkCard[showedcard] = printnum[5];
                                      checkResult(printnum[5]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[11]
                                  ? lessontitlewidget(printnum[5])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                          //  card 12 //
                          GestureDetector(
                            onTap: () {
                              if (opencard < 2 && !allcard[3]) {
                                setState(
                                      () {
                                    opencard++;
                                    allcard[3] = true;
                                    if (!allresultcard[3]) {
                                      showedcard++;
                                      choossedCard[showedcard] = 3;
                                      checkCard[showedcard] = printnum[0];
                                      checkResult(printnum[0]);
                                    }
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8,top: 8),

                              decoration: new BoxDecoration(
                                color: Color(0x66d4d3d3),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0xff636363),
                                ),
                              ),
                              width: size,
                              height: size,
                              child: allcard[3]
                                  ? lessontitlewidget(printnum[0])
                                  : Image.asset(
                                icon,
                                height: size,
                                width: size,
                              ),
                            ),
                          ),

                        ]..shuffle(Random(seed)),
                      ),
                    ],
                  ),
                ),
                if (count == 6)
                  TextButton(
                    onPressed: () async {
                      _audioCache.play('win.m4a');
                      await Future.delayed(Duration(milliseconds: 1000));

                      savelevel();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
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
        ),
      ),
    );
  }

  Future<void> checkResult(String str) async {
    if (showedcard == 2) {
      if (checkCard[1] == checkCard[2]) {
        setState(
              () {
              showcared(str);


            count++;
            allresultcard[choossedCard[1]] = true;
            allresultcard[choossedCard[2]] = true;
            opencard = 0;
            showedcard = 0;
            checkCard = ["", "", ""];
          },
        );
      } else {
        await Future.delayed(Duration(milliseconds: 1500));
        setState(
              () {
            allcard[choossedCard[1]] = false;
            allcard[choossedCard[2]] = false;
            opencard = 0;
            showedcard = 0;
            checkCard = ["", "", ""];
          },
        );
      }
    } else {
      return;
    }
  }

  Future<void> savelevel() async {



    final prefs = await SharedPreferences.getInstance();

    final keyLevel = 'level';
    final keypoints = 'points';
    int valueLevel;
    if (level == 1)
      valueLevel = 2;
    else  if (level == 3)
      valueLevel = 4;
    else  if (level == 5)
      valueLevel = 6;
    else
      valueLevel = level;

    final valuePoints = points + 10;

    prefs.setInt(keyLevel, valueLevel);
    prefs.setInt(keypoints, valuePoints);
    DateTime dateTime = DateTime.now();
    String date = dateTime.year.toString() +
        "/" +
        dateTime.month.toString() +
        "/" +
        dateTime.day.toString();

    int result = await DatabaseHelper.instance
        .updatelevel(valueLevel, valuePoints, id, date);
  }

  void showcared( String str) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.3,
            color: Color(0x9a8888ba),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                lessonbody[str],
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color(0xbf020202), fontSize: 15),
            ),
            ],
          ),
        ),);
      },
    );
  }

  Widget lessontitlewidget(String str) {
    return Container(
      width: size,
      height: size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lessontitle[str].toString(),
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff00709c),
            ),
          ),
        ],
      ),
    );
  }
}
