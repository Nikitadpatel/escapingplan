import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class newpage4 extends StatefulWidget {
  const newpage4({Key? key}) : super(key: key);

  @override
  State<newpage4> createState() => _newpage4State();
}

class _newpage4State extends State<newpage4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/adventure/my1.jpg",width: MediaQuery.of(context).size.width,height: 40.h,fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                    top: 5.h,
                    left: 3.w,
                    right: 80.w,
                    child:Container(
                      height: 12.w,
                      width: 12.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black.withOpacity(0.2),width: 5.0)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Center(child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                      ),
                    ) ),
                Positioned(
                    top: 5.h,
                    left: 80.w,
                    right: 5.w,
                    child:Container(
                      height: 12.w,
                      width: 12.w,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black.withOpacity(0.2),width: 5.0)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Center(child: Icon(Icons.favorite_outline,color: Colors.black,)),
                      ),
                    ) ),
                Positioned(
                  top: 35.h,
                  left: 0.0,
                  right: 0.0,
                  // bottom: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)
                        )
                    ),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Waduk \n"
                            " Wonorejo",style: TextStyle(decoration: TextDecoration.none,color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                        SizedBox(height: 2.h,),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: TextStyle(decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade700, fontSize: 11.sp,fontFamily: "Poppins"),
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],

            ),
          ),
    );
  }
}
