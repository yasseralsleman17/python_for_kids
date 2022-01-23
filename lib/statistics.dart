import 'package:flutter/material.dart';
import 'package:python_for_kids/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db_helper.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int characterid = 1;
  List userList ;

  final List<String> dataList = [
    "Date",
    "points",
  ];
  int level, points, id;
  @override
  void initState() {
    super.initState();
    _read();

  }

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
    get();
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
                                style: TextStyle(color: Colors.blue, fontSize: 20)),
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
                          Text("الاحصائيات",
                              style: TextStyle(color: Colors.blue, fontSize: 30))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                            color: Color(0x79afadad),
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(color: Color(0xff636363)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              if(   dataList!=null)
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: GridView.builder(
                                    physics: ScrollPhysics(),
                                    itemCount: dataList.length,
                                    itemBuilder: (context, index) =>
                                        Card(
                                          child: Container(
                                            decoration: new BoxDecoration(
                                              border: Border.all(color: Color(0xff000000)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  dataList[index],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 4,
                                      crossAxisCount: 2,
                                    ),
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
            ],
          ),
        ),
      ),

    );
  }

  get() async {
    userList =
    await DatabaseHelper.instance.getpointsrecord(id);
 //   userList.sort((a,b)=>b[UserModel.POINTS].compareTo(a[UserModel.POINTS]));

    for(int i =0 ;i<userList.length;i++)
     {
       dataList.add(userList[i]["date"]);
       dataList.add(userList[i]["points"].toString());

     }
    setState(() {

});

  }
}