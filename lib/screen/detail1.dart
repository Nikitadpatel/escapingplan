// import 'package:escaoingsolo/screen/packegedetail.dart';
// import 'package:escaoingsolo/widget/drawer.dart';
// import 'package:escaoingsolo/widget/drawer2.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class detail1 extends StatefulWidget {
//   const detail1({Key? key}) : super(key: key);
//   @override
//   State<detail1> createState() => _detail1State();
// }
//
// class Sachen {
//   String image;
//   String name;
//   Sachen(this.image, this.name);
// }
//
// class _detail1State extends State<detail1> with SingleTickerProviderStateMixin {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   TabController? _tabController;
//   final CarouselController _controller = CarouselController();
//   int? index1 = 0;
//   List<bool> data = [true, false, false];
//   int? _current = 0;
//   List<String> _list = ["Sights", "Tours", "Adventures"];
//   // List<Sachen> sights= [
//   //  Sachen("assets/sights/image1.jpg", "Maldives Package"),
//   //  Sachen("assets/sights/image2.jpg", "Exotic Himachal"),
//   //  Sachen("assets/sights/image3.jpg", "Pondichery"),
//   //  Sachen("assets/sights/image4.jpg", "Amazing Goa"),
//   //  Sachen("assets/sights/image5.jpg", "Mahabaleshwar Getway"),
//   //   ];
//   List<Sachen> sights = [
//     Sachen("assets/sights/image1.jpg", "Maldives Package"),
//     Sachen("assets/sights/image2.jpg", "Exotic Himachal"),
//     Sachen("assets/sights/image3.jpg", "Pondichery"),
//     Sachen("assets/sights/image4.jpg", "Amazing Goa"),
//     Sachen("assets/sights/image5.jpg", "Mahabaleshwar Getway"),
//   ];
//   List<String> sights1 = [
//     "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
//     "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
//     "https://images.unsplash.com/photo-1551291420-91160f3d4961?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
//   ];
//   List<String> tours = [
//     "assets/tours/tour1.jpg",
//     "assets/tours/tour2.jpg",
//     "assets/tours/tour3.jpg",
//   ];
//   List<Sachen> adventure = [
//     Sachen("assets/adventure/adv1.jpg", "Adventure Trip"),
//     Sachen("assets/adventure/adv2.jpg", "Goa Trip"),
//     Sachen("assets/adventure/adv3.jpg", "Himachal Trip")
//   ];
//   @override
//   void initState() {
//     setState(() {
//       index1 = 0;
//     });
//
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           key: _scaffoldKey,
//           backgroundColor: Colors.white,
//           drawer: drawer2(context),
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: 25.h,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           color: Color(0xff1a54ac),
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.zero,
//                               topRight: Radius.zero,
//                               bottomLeft: Radius.zero,
//                               bottomRight: Radius.circular(100.0))),
//                     ),
//                     Positioned(
//                       top: 1.h,
//                       left: 0.w,
//                       right: 3.w,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 //drawer1(context);
//                                 _scaffoldKey.currentState?.openDrawer();
//                               },
//                               icon: Icon(
//                                 Icons.menu_rounded,
//                                 color: Colors.white,
//                               )),
//                           Image.asset(
//                             "assets/man1.png",
//                             height: 10.w,
//                             width: 10.w,
//                           )
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top: 10.h,
//                       left: 0.w,
//                       right: 0.w,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 3.w),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Find Your Dream \n Destination",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 22.sp,
//                                   fontFamily: "Poppins"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       height: 25.h,
//                       width: MediaQuery.of(context).size.width,
//                       child: CarouselSlider(
//                         items: sights1.map((item) {
//                           return GestureDetector(
//                             onTap: () {
//                               // Navigator.of(context).push(MaterialPageRoute(
//                                   // builder: (context) => packagedetail()));
//                             },
//                             child: Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       Container(
//                                         height: 25.h,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         child: Image.network(
//                                           item,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                         options: CarouselOptions(
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               _current = index;
//                             });
//                           },
//                           height: 25.h,
//                           enlargeCenterPage: false,
//                           autoPlay: true,
//                           aspectRatio: 16 / 9,
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration:
//                               Duration(milliseconds: 500),
//                           viewportFraction: 1,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 22.h,
//                       left: 40.w,
//                       child: Center(
//                         child: AnimatedSmoothIndicator(
//                           activeIndex: _current!,
//                           count: sights1.length,
//                           effect: ScrollingDotsEffect(
//                             spacing: 8.0,
//                             radius: 3.0,
//                             dotWidth: 8.0,
//                             dotHeight: 8.0,
//                             paintStyle: PaintingStyle.stroke,
//                             strokeWidth: 1.5,
//                             dotColor: Colors.white,
//                             activeDotColor: Colors.red,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 // SizedBox(height: 3.h,),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 3.w),
//                   child: Text(
//                     "Upcoming",
//                     style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.sp,
//                         fontFamily: "Poppins"),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 CarouselSlider(
//                   items: adventure.map((item) {
//                     return GestureDetector(
//                       onTap: () {
//                         // Navigator.of(context).push(MaterialPageRoute(
//                         //     builder: (context) => packagedetail()));
//                       },
//                       child: Container(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Stack(
//                               children: [
//                                 Container(
//                                   height: 30.h,
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 0.5.w),
//                                   width: MediaQuery.of(context).size.width,
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                       child: Image.asset(
//                                         item.image,
//                                         fit: BoxFit.cover,
//                                       )),
//                                 ),
//                                 Positioned(
//                                   top: 2.h,
//                                   left: 65.w,
//                                   right: 1.w,
//                                   child: Container(
//                                     height: 10.w,
//                                     width: 10.w,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                     child: IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.favorite_outline,
//                                           color: Colors.blue,
//                                         )),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 22.h,
//                                   left: 0.w,
//                                   child: Container(
//                                       height: 5.h,
//                                       width: 80.w,
//                                       decoration: BoxDecoration(
//                                         color: Colors.black26,
//                                       ),
//                                       child: Center(
//                                           child: Text(
//                                         item.name,
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 12.sp,
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.bold),
//                                       ))),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   options: CarouselOptions(
//                     // onPageChanged: (index, reason) {
//                     //   setState(() {
//                     //     _current = index;
//                     //   });
//                     // },
//                     height: 35.h,
//                     enlargeCenterPage: false,
//                     autoPlay: false,
//                     aspectRatio: 16 / 9,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enableInfiniteScroll: true,
//                     autoPlayAnimationDuration: Duration(milliseconds: 500),
//                     viewportFraction: 0.8,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 3.w),
//                   child: Text(
//                     "Recently Visited",
//                     style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.sp,
//                         fontFamily: "Poppins"),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 CarouselSlider(
//                   items: sights.map((item) {
//                     return GestureDetector(
//                       onTap: () {
//                         // Navigator.of(context).push(MaterialPageRoute(
//                         //     builder: (context) => packagedetail()));
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(0.5.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Stack(
//                               children: [
//                                 Container(
//                                   height: 30.h,
//                                   padding: EdgeInsets.all(0.5.w),
//                                   width: MediaQuery.of(context).size.width,
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                       child: Image.asset(
//                                         item.image,
//                                         fit: BoxFit.cover,
//                                       )),
//                                 ),
//                                 Positioned(
//                                   top: 2.h,
//                                   left: 65.w,
//                                   right: 1.w,
//                                   child: Container(
//                                     height: 10.w,
//                                     width: 10.w,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                     child: IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(
//                                           Icons.favorite_outline,
//                                           color: Colors.blue,
//                                         )),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 22.h,
//                                   left: 0.w,
//                                   child: Container(
//                                       height: 5.h,
//                                       width: 80.w,
//                                       decoration: BoxDecoration(
//                                         color: Colors.black26,
//                                       ),
//                                       child: Center(
//                                           child: Text(
//                                         item.name,
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 12.sp,
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.bold),
//                                       ))),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   options: CarouselOptions(
//                     // onPageChanged: (index, reason) {
//                     //   setState(() {
//                     //     _current = index;
//                     //   });
//                     // },
//                     height: 35.h,
//                     enlargeCenterPage: false,
//                     autoPlay: false,
//                     aspectRatio: 16 / 9,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enableInfiniteScroll: true,
//                     autoPlayAnimationDuration: Duration(milliseconds: 500),
//                     viewportFraction: 0.8,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
