import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:python_for_kids/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'characterdesign.dart';
import 'db_helper.dart';
import 'home_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();


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
                    height: 20,
                  ),
                  Text(
                    "الصفحة الشخصية",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Characterdesign();
                          },
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/im_d.PNG",
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width ,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "   اسم المستخدم   ",
                        style: TextStyle(
                            color: Colors.black,
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
                            color: Colors.black,
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
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        " رقم الجوال   ",
                        style: TextStyle(
                            color: Colors.black,
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
                          controller: _phoneNumberController,
                          textDirection: TextDirection.rtl,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            filled: false,
                            hintText: "    رقم الجوال",
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
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        " البريد الالكتروني   ",
                        style: TextStyle(
                            color: Colors.black,
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
                          controller: _emailController,
                          textDirection: TextDirection.rtl,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            border: InputBorder.none,
                            hintTextDirection: TextDirection.rtl,
                            filled: false,
                            hintText: "    البريد الالكتروني ",
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
                  TextButton(
                    onPressed: (){btnUpdate();},
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
                          " تثبيت",
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


  void btnUpdate() async {
    if (_nameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _emailController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "الرجاء ملئ الحقول بالقيم المناسبة",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      UserModel userModel = UserModel(
          id: null,
          name: _nameController.text,
          password: _passwordController.text,
          phone: _phoneNumberController.text,
          email: _emailController.text,
      );

      int result = await DatabaseHelper.instance.update(userModel);

      print("result of add :$result");

      if (result > 0) {
        _saveLoginInfo(_nameController.text, _passwordController.text,
            _phoneNumberController.text, _emailController.text);
        _nameController.clear();
        _passwordController.clear();
        _phoneNumberController.clear();
        _emailController.clear();
        Fluttertoast.showToast(
            msg: "تم تعديل بيانات الحساب  بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        Fluttertoast.showToast(
            msg: "حدث خطأ",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }


  _saveLoginInfo(
      String name, String password, String phone, String email) async {
    final prefs = await SharedPreferences.getInstance();

    final keyName = 'name';
    final keyPassword = 'password';
    final keyPhone = 'phone';
    final keyEmail = 'email';

    final valueName = name;
    final valuePassword = password;
    final valuePhone = phone;
    final valueEmail = email;

    prefs.setString(keyName, valueName);
    prefs.setString(keyPassword, valuePassword);
    prefs.setString(keyPhone, valuePhone);
    prefs.setString(keyEmail, valueEmail);
  }


}




