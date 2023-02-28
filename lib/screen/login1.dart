// import 'dart:convert';
//
// import 'package:escaoingsolo/Modal/loginmodel.dart';
// import 'package:escaoingsolo/Provider/authprovider.dart';
// import 'package:escaoingsolo/screen/detail.dart';
// import 'package:escaoingsolo/screen/detail1.dart';
// import 'package:escaoingsolo/screen/forgetpass.dart';
// import 'package:escaoingsolo/screen/mytrips1.dart';
// import 'package:escaoingsolo/screen/mytrips2.dart';
// import 'package:escaoingsolo/widget/buildErrorDialog.dart';
// import 'package:escaoingsolo/widget/button.dart';
// import 'package:escaoingsolo/widget/const.dart';
// import 'package:escaoingsolo/widget/drawer.dart';
// import 'package:escaoingsolo/widget/drawer2.dart';
// import 'package:escaoingsolo/widget/textfield.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sizer/sizer.dart';
//
// class login extends StatefulWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   TextEditingController _email = TextEditingController();
//   TextEditingController _password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Stack(children: [
//         Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Image.asset(
//             "assets/home_bg.png",
//             height: double.infinity,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           extendBodyBehindAppBar: true,
//           key: _scaffoldState,
//           drawer: drawer1(context),
//           appBar: AppBar(
//             iconTheme: IconThemeData(color: Colors.black),
//             elevation: 0,
//             automaticallyImplyLeading: true,
//             backgroundColor: Colors.transparent,
//           ),
//           body: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.login_sharp,
//                           size: 25.sp,
//                           color: Colors.black,
//                         ),
//                         SizedBox(
//                           width: 10.0,
//                         ),
//                         Container(
//                           alignment: Alignment.center,
//                           // padding: EdgeInsets.symmetric(horizontal: 30.w),
//                           child: Text(
//                             "LOGIN",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 28.sp,
//                                 fontFamily: "Poppins"),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 2.h),
//                     Container(
//                         alignment: Alignment.center,
//                         width: MediaQuery.of(context).size.width,
//                         padding: EdgeInsets.symmetric(horizontal: 3.w),
//                         child: textfields(
//                           obsecure: false,
//                           hei: 0,
//                           line: 1,
//                           mycontroller: _email,
//                           text: "Enter your Email",
//                           type: TextInputType.emailAddress,
//                           icon: Icon(Icons.email_outlined),
//                           hint: "Email",
//                         )),
//                     SizedBox(height: 2.h),
//                     Container(
//                         alignment: Alignment.center,
//                         width: MediaQuery.of(context).size.width,
//                         padding: EdgeInsets.symmetric(horizontal: 3.w),
//                         child: textfields(
//                           obsecure:,
//                           hei: 0,
//                           line: 1,
//                           mycontroller: _password,
//                           text: "Enter your Password",
//                           type: TextInputType.text,
//                           icon: Icon(Icons.lock),
//                           hint: "Password",
//                         )),
//                     SizedBox(height: 2.h),
//                     Padding(
//                      padding: EdgeInsets.only(left:50.w ,right: 3.w),
//                       child: TextButton(onPressed: (){
//                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>forgetpass()));
//                       }, child: Text("Forget Password?",style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           decoration: TextDecoration.underline,
//                           color: Colors.black,
//                           fontSize: 14.sp,
//                           fontFamily: "Poppins"),)),
//                     ),
//                     SizedBox(height: 4.h),
//                     Padding(
//                       padding: EdgeInsets.all(3.w),
//                       child: Container(
//                         width: 150.0,
//                         decoration: new BoxDecoration(
//                             borderRadius: BorderRadius.circular(80.0),
//                             color: Color(0xffb4776e6)
//                             // gradient: new LinearGradient(colors: [
//                             //   Color(0xFF0018F9),
//                             //   Color(0xFF0D47A1),
//                             //   Color(0xFF1565C0),
//                             //   //  Color(0xFF1976D2),
//                             //   // Color(0xFF42A5F5),
//                             // ])
//                         ),
//                         height: 50.0,
//                         child: TextButton(
//                           style: ButtonStyle(
//                             alignment: Alignment.center,
//                             // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
//                             padding: MaterialStateProperty.all(
//                               EdgeInsets.symmetric(vertical: 1.h),
//                             ),
//                             shape:
//                                 MaterialStateProperty.all<RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.sp),
//                             )),
//                           ),
//                           onPressed: () {
//                             loginap();
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => mytrips1()));
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Sign In",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14.sp,
//                                     fontFamily: "Poppins",
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 width: 5.0,
//                               ),
//                               Icon(
//                                 Icons.login,
//                                 color: Colors.white,
//                               )
//                               // const Icon(
//                               //   Icons.navigate_next,
//                               //   color: Colors.white,
//                               // )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // SizedBox(height: 20.h,),
//                   ]),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
//   loginap(){
//     if (_formKey.currentState!.validate()) {
//       final Map<String, String> data = {
//       };
//
//       data['email'] = _email.text.trim().toString();
//       data['password'] = _password.text.trim().toString();
//       data['action'] = 'login';
//
//       checkInternet().then((internet) async {
//         if (internet) {
//           authprovider().loginapi(data).then((Response response) async {
//             userData = UserModal.fromJson(json.decode(response.body));
//             if (response.statusCode == 200 && userData?.status == 1) {
//               setState(() {
//                 // isLoading = false;
//               });
//               // await SaveDataLocal.saveLogInData(userData!);
//               print(userData?.message);
//               SharedPreferences pref = await SharedPreferences.getInstance();
//               pref.setString("id", (userData?.data?.uId).toString());
//               // await SaveDataLocal.getDataFromLocal(userData!);
//               if (kDebugMode) {
//               }
//               buildErrorDialog(context, "","Login Successfully");
//
//
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>newpage()));
//             }
//             else{
//               buildErrorDialog(context, "","Invalid login");
//             }
//           });
//
//         } else {
//           setState(() {
//             // isLoading = false;
//           });
//           buildErrorDialog(context, 'Error',"Internate Required");
//         }
//       });
//     }
//   }
//   }
//
