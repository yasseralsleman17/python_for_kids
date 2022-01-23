import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db_helper.dart';
import 'home_page.dart';

class Characterdesign extends StatefulWidget {
  const Characterdesign({Key key}) : super(key: key);

  @override
  _CharacterdesignState createState() => _CharacterdesignState();
}

class _CharacterdesignState extends State<Characterdesign> {
  int characterid, id;

  _read() async {
    final prefs = await SharedPreferences.getInstance();

    final keycharacterid = 'characterid';
    final keyId = 'ID';

    final valueCharacterid = prefs.getInt(keycharacterid);
    final valueID = prefs.getInt(keyId);

    setState(() {
      id = valueID;
      characterid = valueCharacterid;
    });
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
        child:
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/im_02.jpg'),
                  fit: BoxFit.fill
              ),),

          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text("تصميم الشخصية",
                              style: TextStyle(color: Colors.blue, fontSize: 30))
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
                height: MediaQuery.of(context).size.height * 0.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              characterid = 1;
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.30,
                                child: Image.asset(
                                  "assets/ch1.PNG",
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                ),
                              ),
                              characterid == 1
                                  ? Container()
                                  : Container(
                                decoration: new BoxDecoration(
                                  color: Color(0x8fffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border:
                                  Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width *
                                    0.45,
                                height: MediaQuery.of(context).size.height *
                                    0.30,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              characterid = 2;
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.30,
                                child: Image.asset(
                                  "assets/ch2.PNG",
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                ),
                              ),
                              characterid == 2
                                  ? Container()
                                  : Container(
                                decoration: new BoxDecoration(
                                  color: Color(0x86ffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border:
                                  Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width *
                                    0.45,
                                height: MediaQuery.of(context).size.height *
                                    0.30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 5,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              characterid = 3;
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.30,
                                child: Image.asset(
                                  "assets/ch3.PNG",
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                ),
                              ),
                              characterid == 3
                                  ? Container()
                                  : Container(
                                decoration: new BoxDecoration(
                                  color: Color(0x86ffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border:
                                  Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width *
                                    0.45,
                                height: MediaQuery.of(context).size.height *
                                    0.30,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              characterid = 4;
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: new BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.30,
                                child: Image.asset(
                                  "assets/ch4.PNG",
                                  height:
                                  MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                ),
                              ),
                              characterid == 4
                                  ? Container()
                                  : Container(
                                decoration: new BoxDecoration(
                                  color: Color(0x86ffffff),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border:
                                  Border.all(color: Color(0xff636363)),
                                ),
                                width: MediaQuery.of(context).size.width *
                                    0.45,
                                height: MediaQuery.of(context).size.height *
                                    0.30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  btnsave();

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
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Text(
                      "حفظ",
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




    );
  }

  Future<void> btnsave() async {
    final prefs = await SharedPreferences.getInstance();

    final keycharacterid = 'characterid';

    final valueCharacterid = characterid;

    prefs.setInt(keycharacterid, valueCharacterid);

    int result =
        await DatabaseHelper.instance.updateCharecterId(characterid, id);
  }
}
