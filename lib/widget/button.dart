import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class button extends StatelessWidget {
  VoidCallback? callback;
 final  String text;
 final double width;
 button({Key? key,  required this. width,required this.text,required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: new LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 136, 34),
                Color.fromARGB(255, 255, 177, 41)
              ]
          )
      ),
      height: 50.0,
      child: TextButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 1.h),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 20.sp),
              )),
        ),
        onPressed:  callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color:Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold
              ),
            ),
            // const Icon(
            //   Icons.navigate_next,
            //   color: Colors.white,
            // )
          ],
        ),
      ),
    );
  }
}
