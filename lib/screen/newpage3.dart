import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class newpage3 extends StatefulWidget {
  const newpage3({Key? key}) : super(key: key);

  @override
  State<newpage3> createState() => _newpage3State();
}

class _newpage3State extends State<newpage3> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(height: 3.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.w),
                child: Text("Planner",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 16.sp),),
              ),
              Container(
                height: 15.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff96DED1),
                      Color(0xffffffff)
                    ]
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/compass.png",height: 5.w,
                        width: 5.w,color: Color(0xff355E3B)),
                        SizedBox(width: 3.w,),
                        Text("Map Exploration",style: TextStyle(color: Color(0xff355E3B),fontSize: 14.sp,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                      ],
                    ),
                    Text("Explore the area map & find route",style: TextStyle(color: Colors.grey.shade700,fontSize: 10.sp,fontWeight: FontWeight.normal,fontFamily: "Poppins"),)
                  ],
                ),
              ),
              Container(
                height: 15.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffC3B1E1),
                        Color(0xffffffff)
                      ]
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/globe.png",height: 5.w,
                            width: 5.w,color: Color(0xff483248)),
                        SizedBox(width: 3.w,),
                        Text("Jungle Cruise",style: TextStyle(color: Color(0xff483248),fontSize: 14.sp,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                      ],
                    ),
                    Text("Explore the area map & find route",style: TextStyle(color: Colors.grey.shade700,fontSize: 10.sp,fontWeight: FontWeight.normal,fontFamily: "Poppins"),)
                  ],
                ),
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 1.0,
                dashPattern: [10, 10],

                radius: Radius.circular(20),
                padding: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    height: 15.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/add.png",height: 5.w,
                          width: 5.w,color: Colors.grey.shade400,),
                        SizedBox(width: 3.w,),
                        Text("Add Items",style: TextStyle(color: Colors.grey.shade700,fontSize: 10.sp,fontWeight: FontWeight.normal,fontFamily: "Poppins"),)
                      ],
                    ),
                  ),
                ),
              ),
              Text("Suggestion",style: TextStyle(),)

            ],
          ),
        ),
      ),
    );
  }
}
