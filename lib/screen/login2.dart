
import 'package:escapingplan/screen/mytrips2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class login2 extends StatefulWidget {
  const login2({Key? key}) : super(key: key);

  @override
  State<login2> createState() => _login2State();
}

class _login2State extends State<login2> {
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffb4776e6),
      // drawer: drawer2(context),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          Container(
            alignment:Alignment.center,
            child: Image.asset("assets/ecorp.png",height: 20.h,width: 20.h,fit: BoxFit.cover,color: Colors.black,),
          ),
          Text(
           'ESCAPING SOLO',
           style: TextStyle(
             letterSpacing: 5,
             fontSize: 22.sp,
             fontWeight: FontWeight.bold,
             color: Colors.black,
           ),
              ),
          SizedBox(height: 3.h,),
          Container(
            height: 40.h,
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white
          ),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height: 2.h),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
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
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                            filled: true,
                            hintText: "Email",
                            fillColor: Colors.grey.shade100,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          ),
                        )),
                    SizedBox(height: 2.h),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: TextFormField(
                          controller: _pass,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Your Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                            filled: true,
                            hintText: "Password",
                            fillColor: Colors.grey.shade100,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          ),
                        )),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.all(3.w),
                      child: Container(
                        width: 150.0,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            color: Color(0xffb4776e6)
                            // gradient: new LinearGradient(colors: [
                            //   Color(0xFF0018F9),
                            //   Color(0xFF0D47A1),
                            //   Color(0xFF1565C0),
                            //   //  Color(0xFF1976D2),
                            //   // Color(0xFF42A5F5),
                            // ])
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => newpage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.login,
                                color: Colors.white,
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
          )
        ],
      ),
    );
  }
}
