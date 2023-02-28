import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

class splashscreen extends StatefulWidget {
   splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => login())));
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
                    image: AssetImage("assets/home_bg.png"), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 45.h, left: 10.w, right: 10.w),
                child: Text(
                  "ESCAPING SOLO",
                  style: TextStyle(
                      letterSpacing: 2.sp,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 80.h,
              left: 10.w,
              right: 10.w,
              child: GestureDetector(
                onTap: (){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login1()));
                },
                child: Container(
                  height: 50.0,
                  width: 50.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    // border: Border.all(color: Colors.white,width: 1.0)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Sign In",style:TextStyle(color: Colors.grey.shade700,fontSize: 14.sp,fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"
                      ) ,),
                      SizedBox(width:2.w),
                      Icon(Icons.login,size: 15.sp,color: Colors.grey.shade700),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
