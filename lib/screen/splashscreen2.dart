import 'dart:async';
import 'package:escapingplan/screen/login.dart';
import 'package:escapingplan/screen/mytrips1.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/sharedpreferance.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class splashscreen2 extends StatefulWidget {
  const splashscreen2({Key? key}) : super(key: key);
  @override
  State<splashscreen2> createState() => _splashscreen2State();
}

class _splashscreen2State extends State<splashscreen2> {
  void initState() {
    super.initState();
    getdata();
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => login())));
  }

  getdata() async {
    userData = await SaveDataLocal.getDataFromLocal();
    setState(() {
      userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/escape.jpg"), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, left: 10.w, right: 10.w),
                child: Text(
                  "ESCAPING PLAN",
                  style: TextStyle(
                      letterSpacing: 2.sp,
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 58.h,
              left: 25.w,
              right: 25.w,
              child: GestureDetector(
                onTap: () async {
                  (userData == null)
                      ? Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => login1()))
                      : Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => mytrips1()));
                },
                child: Container(
                    height: 50.0,
                    width: 50.w,
                    alignment: Alignment.center,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(width: 2.w),
                        Icon(Icons.login,
                            size: 15.sp, color: Colors.grey.shade700),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
