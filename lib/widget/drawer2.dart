//
// import 'package:escaoingsolo/screen/MessagePage.dart';
// import 'package:escaoingsolo/screen/detail.dart';
// import 'package:escaoingsolo/screen/detail1.dart';
// import 'package:escaoingsolo/screen/login.dart';
//
// import 'package:escaoingsolo/screen/login1.dart';
// import 'package:escaoingsolo/screen/login2.dart';
//
// import 'package:escaoingsolo/screen/mytrips2.dart';
// import 'package:escaoingsolo/screen/mytrips1.dart';
// import 'package:escaoingsolo/screen/packegedetail.dart';
// import 'package:escaoingsolo/screen/packagedeatil2.dart';
// import 'package:escaoingsolo/screen/profile.dart';
// import 'package:escaoingsolo/screen/profile2.dart';
// import 'package:escaoingsolo/screen/profile2static.dart';
// import 'package:escaoingsolo/screen/profilestatic.dart';
// import 'package:escaoingsolo/screen/splashscreen1.dart';
// import 'package:escaoingsolo/screen/splashscreen2.dart';
// import 'package:escaoingsolo/widget/sharedpreferance.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// class drawer2 extends StatefulWidget {
//   final BuildContext context;
//   const drawer2(this.context, {Key? key}) : super(key: key);
//   @override
//   State<drawer2> createState() => _drawer2State();
// }
//
// class _drawer2State extends State<drawer2> {
//   bool str = false;
//   List<bool> data = [false, false, false, false, false, false, false];
//   @override
//   void initState() {
//     str = false;
//     data = [false, false, false, false, false, false, false];
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double widthDrawer = MediaQuery.of(context).size.width * 0.75;
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text(
//               'Oflutter.com',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.bold),
//             ),
//             accountEmail: Text('example@gmail.com',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: "Poppins",
//                     fontWeight: FontWeight.bold)),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 child: Image.network(
//                   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
//                   fit: BoxFit.cover,
//                   width: 90,
//                   height: 90,
//                 ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                       'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: 0.0,
//             leading: Icon(
//               Icons.travel_explore,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Splash Screen1',
//               style: textStyle,
//             ),
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => splashscreen2()));
//               // Navigator.of(context).pop();
//             },
//           ),
//           Divider(
//             color: Colors.grey,
//           ),
//           // ListTile(
//           //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//           //   horizontalTitleGap: 0.0,
//           //   leading: Icon(
//           //     Icons.travel_explore,
//           //     color: Colors.black,
//           //   ),
//           //   title: Text(
//           //     'Splash Screen2',
//           //     style: textStyle,
//           //   ),
//           //   onTap: () {
//           //     Navigator.of(context)
//           //         .push(MaterialPageRoute(builder: (context) => splashscreen2()));
//           //     // Navigator.of(context).pop();
//           //   },
//           // ),
//           // Divider(
//           //   color: Colors.grey,
//           // ),
//           ListTile(
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: 0.0,
//             leading: Icon(
//               Icons.travel_explore,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Login Screen1',
//               style: textStyle,
//             ),
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => login1()));
//               // Navigator.of(context).pop();
//               },
//           ),  Divider(
//             color: Colors.grey,
//           ),
//           // ListTile(
//           //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//           //   horizontalTitleGap: 0.0,
//           //   leading: Icon(
//           //     Icons.travel_explore,
//           //     color: Colors.black,
//           //   ),
//           //   title: Text(
//           //     'Login Screen2',
//           //     style: textStyle,
//           //   ),
//           //   onTap: () {
//           //     Navigator.of(context)
//           //         .push(MaterialPageRoute(builder: (context) => login2()));
//           //     // Navigator.of(context).pop();
//           //     },
//           // ),  Divider(
//           //   color: Colors.grey,
//           // ),
//           ListTile(
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: 0.0,
//             leading: Icon(
//               Icons.travel_explore,
//               color: Colors.black,
//             ),
//             title: Text(
//               'My trips1',
//               style: textStyle,
//             ),
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => mytrips1()));
//               // Navigator.of(context).pop();
//               },
//           ),
//           Divider(
//             color: Colors.grey,
//           ),
//           // ListTile(
//           //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//           //   horizontalTitleGap: 0.0,
//           //   leading: Icon(
//           //     Icons.travel_explore,
//           //     color: Colors.black,
//           //   ),
//           //   title: Text(
//           //     'My trips2',
//           //     style: textStyle,
//           //   ),
//           //   onTap: () {
//           //     Navigator.of(context)
//           //         .push(MaterialPageRoute(builder: (context) => newpage()));
//           //     // Navigator.of(context).pop();
//           //     },
//           // ),
//           // Divider(
//           //   color: Colors.grey,
//           // ),
//           // ListTile(
//           //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//           //   horizontalTitleGap: 0.0,
//           //   leading: Icon(
//           //     Icons.travel_explore,
//           //     color: Colors.black,
//           //   ),
//           //   title: Text(
//           //     ' Details1',
//           //     style: textStyle,
//           //   ),
//           //   onTap: () {
//           //     Navigator.of(context)
//           //         .push(MaterialPageRoute(builder: (context) => packagedetail1()));
//           //     // Navigator.of(context).pop();
//           //     },
//           // ),
//           // Divider(
//           //   color: Colors.grey,
//           // ),
//           ListTile(
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: 0.0,
//             leading: Icon(
//               Icons.travel_explore,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Detail 2',
//               style: textStyle,
//             ),
//             onTap: () {
//               // Navigator.of(context)
//               //     .push(MaterialPageRoute(builder: (context) => packagedetail()));
//               // Navigator.of(context).pop();
//             },
//           ),
//           Divider(
//             color: Colors.grey,
//           ),
//           // ListTile(
//           //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//           //   horizontalTitleGap: 0.0,
//           //   leading: Icon(
//           //     Icons.person,
//           //     color: Colors.black,
//           //   ),
//           //   title: Text(
//           //     'Profile1',
//           //     style: textStyle,
//           //   ),
//           //   onTap: () {
//           //     Navigator.of(context)
//           //         .push(MaterialPageRoute(builder: (context) => profilestatic()));
//           //   },
//           // ),
//           // Divider(
//           //   color: Colors.grey,
//           // ),
//           ListTile(
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: 0.0,
//             leading: Icon(
//               Icons.person,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Profile2',
//               style: textStyle,
//             ),
//             onTap: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => profile2()));
//               // Navigator.of(context).pop();
//               },
//           ),
//           Divider(
//             color: Colors.grey,
//           ),
//           ListTile(
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: 0.0,
//             leading: Icon(
//               Icons.chat,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Chat',
//               style: textStyle,
//             ),
//             onTap: () {
//               Navigator.of(context).pop();
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => MessagePage()));
//
//
//               },
//           ),
//           Divider(
//             color: Colors.grey,
//           ),
//           ListTile(
//             visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//             horizontalTitleGap: 0.0,
//             leading: Icon(
//               Icons.logout,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Logout',
//               style: textStyle,
//             ),
//             onTap: () async{
//               await SaveDataLocal.clearUserData();
//               Navigator.of(context).pop();
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => login1()));
//               },
//           ),
//           Divider(
//             color: Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }
//
//   TextStyle textStyle = TextStyle(
//       color: Colors.black,
//       fontSize: 12.sp,
//       fontFamily: "Poppins",
//       fontWeight: FontWeight.w600);
// }
