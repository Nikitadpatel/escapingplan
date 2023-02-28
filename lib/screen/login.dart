import 'dart:convert';
import 'package:escapingplan/Modal/loginmodel.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:escapingplan/screen/forgetpass.dart';
import 'package:escapingplan/screen/mytrips1.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/sharedpreferance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool visible = true;
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "assets/splash2.jpg",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        key: _scaffoldState,
        // drawer: drawer1(context),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.login_sharp,
                        size: 25.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        // padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontFamily: "Poppins"),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      validator: (value) {
                        String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                            "\\@" +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                            "(" +
                            "\\." +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                            ")+";
                        //Convert string p to a RegEx
                        RegExp regExp = RegExp(p);
                        if (value!.isEmpty) {
                          return 'Please enter Your Email';
                        } else {
                          //If email address matches pattern
                          if (regExp.hasMatch(value)) {
                            return null;
                          } else {
                            //If it doesn't match
                            return 'Email is not valid';
                          }
                        }
                      },
                      decoration: inputDecoration(
                        icon: Icon(null),
                        hint: "Email",
                        click: () {},
                        icon1: Icon(Icons.email),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: TextFormField(
                      obscureText: visible,
                      keyboardType: TextInputType.text,
                      controller: _password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your Password';
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                        hint: "Password",
                        icon1: Icon(Icons.lock),
                        click: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                        icon: visible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.only(left: 49.w, right: 3.w),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => forgetpass()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: "Poppins"),
                        )),
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700,
                            offset: Offset(0, 20),
                            blurRadius: 20,
                            spreadRadius: -5,
                          ),
                        ],
                        // border: Border.all(color: Colors.white,width: 1.0)
                      ),
                      height: 50.0,
                      child: TextButton(
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 1.h),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          )),
                        ),
                        onPressed: () {
                          login();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.grey.shade700,
                            )
                            // const Icon(
                            //   Icons.navigate_next,
                            //   color: Colors.white,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20.h,),
                ]),
          ),
        ),
      ),
    ]);
  }

  InputDecoration inputDecoration(
      {required Icon icon1,
      required VoidCallback click,
      required String hint,
      required Icon icon,
     }) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(2.0),
        hintStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12.sp),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        prefixIcon: icon1,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(2.0),
          child: IconTheme(
            data: IconThemeData(color: Colors.grey),
            child: IconButton(
              onPressed: click,
              icon: icon,
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white);
  }

  login() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};

      data['email'] = _email.text.trim().toString();
      data['password'] = _password.text.trim().toString();
      data['action'] = 'login';

      checkInternet().then((internet) async {
        if (internet) {
          authprovider().loginapi(data).then((Response response) async {
            userData = UserModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && userData?.status == 1) {
              setState(() {
                // isLoading = false;
              });
              await SaveDataLocal.saveLogInData(userData!);
              print(userData?.data?.clientid);



              if (kDebugMode) {}
              // buildErrorDialog(context, "", "Login Successfully");

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => mytrips1()));
            } else {
              buildErrorDialog(context, "", "Invalid login");
            }
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, 'Error', "Internate Required");
        }
      });
    }
  }
}
