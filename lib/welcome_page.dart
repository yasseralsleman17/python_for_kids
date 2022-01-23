import 'package:flutter/material.dart';
import 'package:python_for_kids/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

import 'home_page.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  String userName = "";
  String password = "";
  AudioCache _audioCache;

  _read() async {




    final prefs = await SharedPreferences.getInstance();
    final keyPassword = 'password';
    final keyName = 'name';

    final valueName = prefs.get(keyName);
    final valuePassword = prefs.get(keyPassword);

    setState(() {
      userName = valueName.toString();
      password = valuePassword.toString();
      userName  !="null"?
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ):
      print("valueName : $valueName");
      print("valuePassword : $valuePassword");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioCache = AudioCache(
      prefix: 'assets/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
    _audioCache.play('start.m4a');
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
                image: AssetImage('assets/im_01.jpg'),
                fit: BoxFit.fill
            ),),
          child:
          Container(
            width: MediaQuery.of(context).size.width,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.3,
                ),


                Text("مرحبا بك في نيّر يا صديقي",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),),

                SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black),
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width *0.5,
                    child: Center(
                      child: Text("سجل دخولك",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black),
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width *0.5,
                    child: Center(
                      child: Text("أنشئ حسابك الآن",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
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
}
