// import 'dart:convert';
// import 'dart:math';
//
// import 'package:escaoingsolo/Modal/detailmodel.dart';
// import 'package:escaoingsolo/Provider/travelprovider.dart';
// import 'package:escaoingsolo/widget/buildErrorDialog.dart';
// import 'package:escaoingsolo/widget/const.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:http/http.dart';
// import 'package:sizer/sizer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class packagedetail1 extends StatefulWidget {
//   const packagedetail1({Key? key}) : super(key: key);
//
//   @override
//   State<packagedetail1> createState() => _packagedetail1State();
// }
//
// class Sachen {
//   String? image;
//   String? name;
//   Sachen(this.image, this.name);
// }
// class Sachen1 {
//   String? image;
//   bool? name;
//   Sachen1(this.image, this.name);
// }
//
// class _packagedetail1State extends State<packagedetail1> {
//   ScrollController _scrollController =  ScrollController();
//   int? _current = 0;
//   int? selectindex=0;
//   Detailmodel? detailmodal;
//   List<String> plan = [
//     "Travel Detail",
//     "Accomodation Detail",
//     "Itineary Detail",
//     "Other Detail",
//
//   ];
//   List<String> adventure = [
//     "assets/adventure/adv1.jpg",
//     "assets/adventure/adv2.jpg",
//     "assets/adventure/adv3.jpg",
//   ];
//
// String day="0" ;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _scrollController = new ScrollController();
//     // detail();
//
//   }
//   CarouselController _controller = CarouselController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   iconTheme: IconThemeData(color: Colors.black),
//         //   elevation: 0.0,
//         //   backgroundColor: Colors.transparent,
//         //   automaticallyImplyLeading: false,
//         // ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   Container(
//                     // height: MediaQuery.of(context).size.height,
//                     // width: MediaQuery.of(context).size.width,
//                     child: CarouselSlider(
//                       carouselController: _controller,
//                       items: adventure.map((item) {
//                         return Container(
//                           height: 40.h,
//                           width: MediaQuery.of(context).size.width,
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(0.0),
//                               child: Image.asset(
//                                 item,height: 40.h,
//                                 width: MediaQuery.of(context).size.width,
//                                 fit: BoxFit.cover,
//                               )),
//                         );
//                       }).toList(),
//                       options: CarouselOptions(
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _current = index;
//                           });
//                         },
//                         height: 40.h,
//                         enlargeCenterPage: false,
//                         autoPlay: true,
//                         // aspectRatio: 16 / 9,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration: Duration(milliseconds: 500),
//                         viewportFraction: 1,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 5.h,
//                     left: 3.w,
//                     right: 90.w,
//                     child: Container(
//                       child: IconButton(
//                           onPressed: (){
//                             Navigator.of(context).pop();
//                           },
//                           icon:Icon(Icons.arrow_back_ios,color: Colors.white,)
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 32.h,
//                     left: 40.w,
//                     child: Center(
//                       child: AnimatedSmoothIndicator(
//                         activeIndex: _current!,
//                         count: adventure.length,
//                         effect: ScrollingDotsEffect(
//                             spacing: 8.0,
//                             radius: 3.0,
//                             dotWidth: 8.0,
//                             dotHeight: 8.0,
//                             paintStyle: PaintingStyle.stroke,
//                             strokeWidth: 1.5,
//                             dotColor: Colors.white,
//                             activeDotColor: Colors.red),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 35.h),
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)
//                         ),
//                       child: Container(
//                         height:MediaQuery.of(context).size.height,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)
//                             )
//                         ),
//                         child:SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: 2.h,),
//                               Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 3.w, right: 3.w, top: 1.h,bottom:0.5.h),
//                                     child: Text(
//                                      (detailmodal?.aboutTheTour?[0].title).toString(),
//                                       style: TextStyle(
//                                           color: Color(0xffb4776e6),
//                                           fontSize: 20.sp,
//                                           fontFamily: "Poppins",
//                                           fontWeight: FontWeight.w600,
//                                           height: 1.5),
//                                     ),
//                                   ),
//                                   Container(
//                                     child: IconButton(
//                                         onPressed: (){
//                                           dialog();
//                                         },
//                                         icon:Icon(Icons.edit,color: Color(0xffb4776e6),)
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 1.h,),
//                               Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 5.w),
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     RatingBar.builder(
//                                       initialRating: 3,
//                                       minRating: 1,
//                                       direction: Axis.horizontal,
//                                       allowHalfRating: true,
//                                       itemCount: 5,
//                                       itemSize: 12.sp,
//                                       itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
//                                       itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                       ),
//                                       onRatingUpdate: (rating) {
//                                         print(rating);
//                                       },
//                                     ),
//                                     SizedBox(width:5.w),
//                                     Container(
//                                       // margin: EdgeInsets.symmetric(
//                                       //     horizontal: 5.w, vertical:0.0),
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 3.w, vertical:2.0),
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.circular(5.0),
//                                           border: Border.all(color: Color(0xffb4776e6),)
//                                       ),
//                                       child: Text(
//                                         (detailmodal?.tourInformation?[0].duration).toString()+"N/" ,
//                                         style: TextStyle(
//                                           color: Color(0xffb4776e6),
//                                           fontSize: 10.sp,
//                                           fontFamily: "Poppins",
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 2.h,),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical:0, horizontal: 3.w),
//                                 child: Text(
//                                   (detailmodal?.aboutTheTour?[0].description).toString(),
//                                   style: TextStyle(
//                                       color: Colors.grey.shade600, fontSize: 11.sp,fontFamily: "Poppins"),
//                                   maxLines: 3,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                               SizedBox(height: 2.h,),
//                               Container(
//                                 height: 8.h,
//                                 width: MediaQuery.of(context).size.width,
//                                 padding: EdgeInsets.all(3.w),
//                                 child: ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     physics: BouncingScrollPhysics(),
//                                     shrinkWrap: true,
//                                     itemCount:plan.length,
//                                     itemBuilder: (context,index){
//                                       return GestureDetector(
//                                         onTap: (){
//                                           setState(() {
//                                             selectindex = index;
//                                           });
//
//                                         },
//                                         child: Container(
//                                           height: 7.h,
//                                           padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
//                                           margin: EdgeInsets.only(right: 3.w),
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(10.0),
//                                             color: (selectindex == index) ? Colors.red.shade100 : Colors.grey.shade100,
//                                           ),
//                                           child: Text(plan[index],style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w400,
//                                               fontSize: 12.sp,color: (selectindex != index) ? Colors.grey.shade700 :Colors.red.shade700
//                                           ),),
//                                         ),
//                                       );
//                                     }),
//                               ),
//                               SizedBox(height: 1.h,),
//                               Container(
//                                 child:  (selectindex == 2 )?  Column(
//                                   children: [
//                                     ListTile(
//                                       title:Text("Itinerary Details",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 14.sp),),
//                                       // subtitle: Text("Day wise itinerary of your Package",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.normal,fontSize: 10.sp),),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal:3.w,vertical: 1.h),
//                                       child: Table(
//                                         border: TableBorder.all(
//                                             color: Colors.grey.shade300
//                                         ),
//                                         columnWidths: {
//                                           0: FlexColumnWidth(2),
//                                           1: FlexColumnWidth(4),
//                                           // 2: FlexColumnWidth(4),
//                                         },
//                                         children: [
//                                           TableRow(
//                                               decoration: BoxDecoration(color: Colors.grey.shade100),
//                                               children: [
//                                                 Container(
//
//                                                   alignment:Alignment.topLeft,
//                                                   padding: EdgeInsets.all(3.w),
//                                                   // width: 30.w,
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Icon(Icons.date_range,size: 12.sp,color: Colors.black,),
//                                                           SizedBox(width: 2.w,),
//                                                           Text("Day 1",style: textstyle1),
//                                                         ],
//                                                       ),
//                                                       SizedBox(height: 5.0,),
//                                                       Text("Feb 27,2023",style:textstyle)
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     children: [
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Pellentesque in ipsum id orci porta dapibus. "
//                                                             "Nulla porttitor accumsan tincidunt. Donec rutrum "
//                                                             "congue leo eget malesuada.",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         isThreeLine: false,
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Check in to Broad Bean Resort & Spa, 5 Star",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Athirapally Excursion from Cochin to Munnar",textAlign: TextAlign.left,style:textstyle),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   width: 30.w,
//                                                   alignment:Alignment.topLeft,
//                                                   padding: EdgeInsets.all(3.w),
//                                                   // width: 30.w,
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Icon(Icons.date_range,size: 12.sp,color: Colors.black,),
//                                                           SizedBox(width: 2.w,),
//                                                           Text("Day 2",style:textstyle1,),
//                                                         ],
//                                                       ), SizedBox(height: 5.0,),
//                                                       Text("Feb 28,2023",style:textstyle)
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Pellentesque in ipsum id orci porta dapibus. "
//                                                             "Nulla porttitor accumsan tincidunt. Donec rutrum "
//                                                             "congue leo eget malesuada.",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( " Check in to Broad Bean Resort & Spa, 5 Star",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( " Athirapally Excursion from Cochin to Munnar",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               decoration: BoxDecoration(color: Colors.grey.shade100),
//                                               children: [
//                                                 Container(
//                                                   width: 30.w,
//                                                   alignment:Alignment.topLeft,
//                                                   padding: EdgeInsets.all(3.w),
//                                                   // width: 30.w,
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Icon(Icons.date_range,size: 12.sp,color:Colors.black),
//                                                           SizedBox(width: 2.w,),
//                                                           Text("Day 3",style: textstyle1),
//                                                         ],
//                                                       ),   SizedBox(height: 5.0,),
//                                                       Text("Mar 01,2023",style:textstyle,)
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Pellentesque in ipsum id orci porta dapibus. "
//                                                             "Nulla porttitor accumsan tincidunt. Donec rutrum "
//                                                             "congue leo eget malesuada.",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Check in to Broad Bean Resort & Spa, 5 Star",textAlign: TextAlign.left,style:textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( " Athirapally Excursion from Cochin to Munnar",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   width: 30.w,
//                                                   alignment:Alignment.topLeft,
//                                                   padding: EdgeInsets.all(3.w),
//                                                   // width: 30.w,
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Icon(Icons.date_range,size: 12.sp,color:Colors.black),
//                                                           SizedBox(width: 2.w,),
//                                                           Text("Day 4",style:textstyle1,),
//                                                         ],
//                                                       ),         SizedBox(height: 5.0,),
//                                                       Text("Mar 02,2023",style: textstyle),
//
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Pellentesque in ipsum id orci porta dapibus. "
//                                                             "Nulla porttitor accumsan tincidunt. Donec rutrum "
//                                                             "congue leo eget malesuada.",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Check in to Broad Bean Resort & Spa, 5 Star",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Athirapally Excursion from Cochin to Munnar",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               decoration: BoxDecoration(color: Colors.grey[100]),
//                                               children: [
//                                                 Container(
//                                                   width: 30.w,
//                                                   alignment:Alignment.topLeft,
//                                                   padding: EdgeInsets.all(3.w),
//                                                   // width: 30.w,
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Icon(Icons.date_range,size: 12.sp,color:Colors.black),
//                                                           SizedBox(width: 2.w,),
//                                                           Text("Day 5",style: textstyle1,),
//                                                         ],
//                                                       ),       SizedBox(height: 5.0,),
//                                                       Text("Mar 03,2023",style: textstyle)
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Pellentesque in ipsum id orci porta dapibus. "
//                                                             "Nulla porttitor accumsan tincidunt. Donec rutrum "
//                                                             "congue leo eget malesuada.",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( "Check in to Broad Bean Resort & Spa, 5 Star",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                       ListTile(
//                                                         // leading:Container(
//                                                         //   height: 5.0,
//                                                         //   width: 5.0,
//                                                         //   decoration: BoxDecoration(
//                                                         //       shape: BoxShape.circle,color: Colors.black
//                                                         //   ) ,
//                                                         // ),
//                                                         contentPadding:EdgeInsets.all(0),
//                                                         horizontalTitleGap: 0.0,
//                                                         minLeadingWidth: 20,
//                                                         visualDensity: VisualDensity(horizontal: 0, vertical:0),
//                                                         title: Text( " Athirapally Excursion from Cochin to Munnar",textAlign: TextAlign.left,style: textstyle),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ) : (selectindex == 0) ?
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 3.w),
//                                       child: Text("Travel Details",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 14.sp),),
//                                     ),
//                                     // Padding(
//                                     //   padding: EdgeInsets.symmetric(horizontal: 3.w),
//                                     //   child: Text("Travel Details of your Package",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.normal,fontSize: 10.sp),),
//                                     // ),
//                                     SizedBox(height: 2.h,),
//                                     Container(
//                                         height: 5.h,
//                                         padding: EdgeInsets.symmetric(horizontal: 3.w),
//                                         width: MediaQuery.of(context).size.width,
//                                         color: Colors.grey.shade100,
//                                         alignment: Alignment.centerLeft,
//                                         child: Text("Travel Option",style: textstyle1,)),
//                                     SizedBox(height: 1.h,),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 3.w),
//                                       child: Row(
//                                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Image.asset("assets/travel/plane.png",height: 12.w,width: 12.w,fit: BoxFit.cover,color: Colors.black,),
//                                           SizedBox(width: 2.w,),
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text("06:40 AM",style: textstyle1,),
//                                               Text("Fri ,28 Feb",style: textstyle,),
//                                               Text("Mumbai",style: textstyle,),
//                                             ],
//                                           ),
//                                           SizedBox(width: 2.w,),
//                                           Expanded(
//                                             child:  Divider(
//                                               thickness: 1.0,
//                                               color: Colors.grey.shade600,
//                                               // height: 30,
//                                             ),
//                                           ),
//                                           Transform.rotate(
//                                               angle: 90 * pi/180,
//                                               child: Icon(Icons.flight,  color: Color(0xffb4776e6))),
//                                           Expanded(
//                                             child:  Divider(
//                                               thickness: 1.0,
//                                               color: Colors.grey.shade600,
//                                               // height: 50,
//                                             ),
//                                           ),
//                                           SizedBox(width: 2.w,),
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text("08:40 AM",style: textstyle1,),
//                                               Text("Fri ,28 Feb",style: textstyle,),
//                                               Text("Kochi",style: textstyle),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(height: 1.h,), //
//                                     Container(
//                                         padding: EdgeInsets.symmetric(horizontal: 3.w),
//                                         height: 5.h,
//                                         width: MediaQuery.of(context).size.width,
//                                         color: Colors.grey.shade100,
//                                         alignment: Alignment.centerLeft,
//                                         child: Text("Transfer",style: textstyle1,)),
//                                     SizedBox(height: 1.h),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(horizontal: 3.w),
//                                       child: Row(
//                                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Image.asset("assets/travel/car.png",height: 12.w,width: 12.w,fit: BoxFit.cover,color: Colors.black,),
//                                           SizedBox(width: 3.w,),
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text("08:45 AM",style: textstyle1,),
//                                               Text("Fri ,28 Feb",style: textstyle,),
//                                               Text("Xyz road",style: textstyle,),
//                                             ],
//                                           ),
//                                           SizedBox(width: 2.w,),
//                                           Expanded(
//                                             child:  Divider(
//                                               color: Colors.grey.shade600,
//                                               thickness: 1.0,
//                                               // height: 30,
//                                             ),
//                                           ),
//                                           SizedBox(width:2.0),
//                                           Image.asset("assets/travel/car.png",height: 5.w,width: 7.w,fit: BoxFit.cover,  color: Color(0xffb4776e6),),
//                                           // Icon(Icons.time_to_leave,color:Colors.blue),
//                                           SizedBox(width:2.0),
//                                           Expanded(
//                                             child:  Divider(
//                                               color: Colors.grey.shade600,
//                                               thickness: 1.0,
//                                               // height: 50,
//                                             ),
//                                           ),
//
//                                           SizedBox(width: 2.w,),
//                                           Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Text("11:40 PM",style: textstyle1,),
//                                               Text("Tue ,03 Mar",style: textstyle,),
//                                               Text("Kochi",style: textstyle),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//
//                                     // Container(
//                                     //   padding: EdgeInsets.symmetric(horizontal:3.w,vertical: 1.h),
//                                     //   child: Table(
//                                     //     border: TableBorder.all(
//                                     //         color: Colors.grey.shade300
//                                     //     ),
//                                     //     columnWidths: {
//                                     //       0: FlexColumnWidth(4),
//                                     //       1: FlexColumnWidth(4),
//                                     //       // 2: FlexColumnWidth(4),
//                                     //     },
//                                     //     children: [
//                                     //       TableRow(
//                                     //           decoration: BoxDecoration(color: Colors.grey[100]),
//                                     //           children: [
//                                     //             Container(
//                                     //               alignment:Alignment.topLeft,
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               // width: 30.w,
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   Icon(Icons.mode_of_travel_outlined,color: Colors.black,size: 12.sp,),
//                                     //                   SizedBox(width: 2.w,),
//                                     //                   Text("Travel Option",style: textstyle1),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //             Container(
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   // Container(
//                                     //                   //   height: 5.0,
//                                     //                   //   width: 5.0,
//                                     //                   //   decoration: BoxDecoration(
//                                     //                   //       shape: BoxShape.circle,
//                                     //                   //       color: Colors.black
//                                     //                   //   ),
//                                     //                   // ),
//                                     //                   // SizedBox(width: 3.w,),
//                                     //                   Text("Flight",style: textstyle),
//                                     //                 ],
//                                     //               ),
//                                     //             )
//                                     //           ]
//                                     //       ),
//                                     //       TableRow(
//                                     //           decoration: BoxDecoration(color: Colors.white),
//                                     //           children: [
//                                     //             Container(
//                                     //
//                                     //               alignment:Alignment.topLeft,
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               // width: 30.w,
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   Icon(Icons.access_time),
//                                     //                   SizedBox(width: 2.w,),
//                                     //                   Text("Time",style:textstyle1),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //             Container(
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   // Container(
//                                     //                   //   height: 5.0,
//                                     //                   //   width: 5.0,
//                                     //                   //   decoration: BoxDecoration(
//                                     //                   //       shape: BoxShape.circle,
//                                     //                   //       color: Colors.black
//                                     //                   //   ),
//                                     //                   // ),
//                                     //                   // SizedBox(width: 3.w,),
//                                     //                   Text("10:30 AM",style: textstyle),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //           ]
//                                     //       ),
//                                     //       TableRow(
//                                     //           decoration: BoxDecoration(color: Colors.grey[100]),
//                                     //           children: [
//                                     //             Container(
//                                     //               alignment:Alignment.topLeft,
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               // width: 30.w,
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   Icon(Icons.car_rental),
//                                     //                   SizedBox(width: 2.w,),
//                                     //                   Text("Transfer",style:textstyle1),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //             Container(
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   // Container(
//                                     //                   //   height: 5.0,
//                                     //                   //   width: 5.0,
//                                     //                   //   decoration: BoxDecoration(
//                                     //                   //       shape: BoxShape.circle,
//                                     //                   //       color: Colors.black
//                                     //                   //   ),
//                                     //                   // ),
//                                     //                   // SizedBox(width: 3.w,),
//                                     //                   Text("Private Car",style: textstyle),
//                                     //                 ],
//                                     //               ),
//                                     //             )
//                                     //           ]
//                                     //       ),
//                                     //       TableRow(
//                                     //           decoration: BoxDecoration(color: Colors.white),
//                                     //           children: [
//                                     //             Container(
//                                     //
//                                     //               alignment:Alignment.topLeft,
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               // width: 30.w,
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   Icon(Icons.add_location_outlined),
//                                     //                   SizedBox(width: 2.w,),
//                                     //                   Text("Pickup Location",style:textstyle1),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //             Container(
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   // Container(
//                                     //                   //   height: 5.0,
//                                     //                   //   width: 5.0,
//                                     //                   //   decoration: BoxDecoration(
//                                     //                   //       shape: BoxShape.circle,
//                                     //                   //       color: Colors.black
//                                     //                   //   ),
//                                     //                   // ),
//                                     //                   // SizedBox(width: 3.w,),
//                                     //                   Text("ABC",style: textstyle),
//                                     //                 ],
//                                     //               ),
//                                     //             )
//                                     //           ]
//                                     //       ),
//                                     //       TableRow(
//                                     //           decoration: BoxDecoration(color: Colors.grey[100]),
//                                     //           children: [
//                                     //             Container(
//                                     //
//                                     //               alignment:Alignment.topLeft,
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               // width: 30.w,
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   Icon(Icons.pin_drop_rounded),
//                                     //                   SizedBox(width: 2.w,),
//                                     //                   Text("Drop Location",style: textstyle1),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //             Container(
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   // Container(
//                                     //                   //   height: 5.0,
//                                     //                   //   width: 5.0,
//                                     //                   //   decoration: BoxDecoration(
//                                     //                   //       shape: BoxShape.circle,
//                                     //                   //       color: Colors.black
//                                     //                   //   ),
//                                     //                   // ),
//                                     //                   // SizedBox(width: 3.w,),
//                                     //                   Text("XYZ",style: textstyle),
//                                     //                 ],
//                                     //               ),
//                                     //             )
//                                     //           ]
//                                     //       ),
//                                     //       TableRow(
//                                     //           decoration: BoxDecoration(color: Colors.white),
//                                     //           children: [
//                                     //             Container(
//                                     //
//                                     //               alignment:Alignment.topLeft,
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               // width: 30.w,
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   Icon(Icons.time_to_leave),SizedBox(width: 2.w,),
//                                     //                   Text("Pickup Time",style: textstyle1,),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //             Container(
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   // Container(
//                                     //                   //   height: 5.0,
//                                     //                   //   width: 5.0,
//                                     //                   //   decoration: BoxDecoration(
//                                     //                   //       shape: BoxShape.circle,
//                                     //                   //       color: Colors.black
//                                     //                   //   ),
//                                     //                   // ),
//                                     //                   // SizedBox(width: 3.w,),
//                                     //                   Text("10:40",style: textstyle),
//                                     //                 ],
//                                     //               ),
//                                     //             )
//                                     //           ]
//                                     //       ),
//                                     //       TableRow(
//                                     //           decoration: BoxDecoration(color: Colors.grey[100]),
//                                     //           children: [
//                                     //             Container(
//                                     //
//                                     //               alignment:Alignment.topLeft,
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               // width: 30.w,
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   Icon(Icons.time_to_leave),SizedBox(width: 2.w,),
//                                     //                   Text("Drop Time",style:textstyle1),
//                                     //                 ],
//                                     //               ),
//                                     //             ),
//                                     //             Container(
//                                     //               padding: EdgeInsets.all(3.w),
//                                     //               child: Row(
//                                     //                 children: [
//                                     //                   // Container(
//                                     //                   //   height: 5.0,
//                                     //                   //   width: 5.0,
//                                     //                   //   decoration: BoxDecoration(
//                                     //                   //       shape: BoxShape.circle,
//                                     //                   //       color: Colors.black
//                                     //                   //   ),
//                                     //                   // ),
//                                     //                   // SizedBox(width: 3.w,),
//                                     //                   Text("12:45",style: textstyle),
//                                     //                 ],
//                                     //               ),
//                                     //             )
//                                     //           ]
//                                     //       ),
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                   ],
//                                 ):(selectindex == 1) ?
//                                 Container(
//                                   height: 50.h,
//                                   width:MediaQuery.of(context).size.width,
//                                   child: Column(
//                                     children: [
//                                       // ListTile(
//                                       //   title:Text("Accomodation Details",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 14.sp),),
//                                       //   // subtitle: Text("Accomodation Details of your Package",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.normal,fontSize: 10.sp),),
//                                       // ),
//
//                                       ListView.builder(
//                                           itemCount:detailmodal?.hotel?.length,
//                                         itemBuilder:(context,index) {
//                                           return Container(
//                                             decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.circular(20.0),
//                                                 color: Colors.grey.shade100
//                                             ),
//                                             padding: EdgeInsets.all(3.w),
//                                             margin: EdgeInsets.all(3.w),
//                                             child: Row(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               children: [
//                                                 ClipRRect(
//                                                   borderRadius:BorderRadius.circular(10.0),
//                                                   child: Image.network((detailmodal?.hotel?[index].hotelImage).toString(),height: 20.h,width: 30.w,fit: BoxFit.cover,),
//                                                 ),
//                                                 SizedBox(width: 3.w,),
//                                                 Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text((detailmodal?.hotel?[index].hotelName).toString(),  maxLines: 2,
//                                                       overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily:"Poppins",color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.sp),),
//                                                     SizedBox(height: 1.h,),
//                                                     Row(
//                                                       children: [
//                                                         Icon(Icons.holiday_village,color: Colors.grey.shade700,),
//                                                         SizedBox(width: 2.w,),
//                                                         Text((detailmodal?.hotel?[index].hotelType).toString(),style: textstyle,),
//                                                       ],
//                                                     ),
//                                                     SizedBox(height: 1.h,),
//                                                     Row(
//                                                       children: [
//                                                         Icon(Icons.location_on_outlined,color: Colors.grey.shade700),SizedBox(width: 2.w,),
//                                                         Text((detailmodal?.hotel?[index].location).toString(),style: textstyle),
//                                                       ],
//                                                     ),
//                                                     SizedBox(height: 1.h,),
//                                                     Row(
//                                                       children: [
//                                                         Icon(Icons.date_range,color: Colors.grey.shade700),
//                                                         SizedBox(width: 2.w,),
//                                                         Text((detailmodal?.hotel?[index].noOfNight).toString(),style: textstyle),
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           );
//
//                                         }
//                                       ),
//                                       Container(
//                                         width: MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(20.0),
//                                             color: Colors.grey.shade100
//                                         ),
//                                         padding: EdgeInsets.all(3.w),
//                                         margin: EdgeInsets.all(3.w),
//                                         child: Row(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             ClipRRect(
//                                               borderRadius:BorderRadius.circular(10.0),
//                                               child: Image.network("https://r1imghtlak.mmtcdn.com/e7db9aacc63411e9811e0242ac110005.jpg?&downsize=900:675&crop=900:675;30,0&output-format=jpg",height: 20.h,width: 30.w,fit: BoxFit.cover,),
//                                             ),
//                                             SizedBox(width: 3.w,),
//                                             Container(
//                                               child: Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//
//                                                   Text("Broad Bean Resort & \n Spa", maxLines: 2,
//                                                     overflow: TextOverflow.visible,
//                                                     softWrap: false,
//                                                     style: TextStyle(fontFamily:"Poppins",color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.sp),),
//
//                                                   SizedBox(height: 1.h,),
//                                                   Row(
//                                                     children: [
//                                                       Icon(Icons.holiday_village,color: Colors.grey.shade700,),
//                                                       SizedBox(width: 2.w,),
//                                                       Text("Villa Type",style: textstyle),
//                                                     ],
//                                                   ),
//                                                   SizedBox(height: 1.h,),
//                                                   Row(
//                                                     children: [
//                                                       Icon(Icons.location_on_outlined,color: Colors.grey.shade700),SizedBox(width: 2.w,),
//                                                       Text("XYZ Road",style: textstyle),
//                                                     ],
//                                                   ),
//                                                   SizedBox(height: 1.h,),
//                                                   Row(
//                                                     children: [
//                                                       Icon(Icons.date_range,color: Colors.grey.shade700),
//                                                       SizedBox(width: 2.w,),
//                                                       Text("02,Mar - 03,Mar",style: textstyle),
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ):
//                                 Column(
//                                   children: [
//                                     ListTile(
//                                       title:Text("Other Details",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 14.sp),),
//                                       // subtitle: Text("Other Details of your Package",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.normal,fontSize: 10.sp),),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.all(3.w),
//                                       child: Table(
//                                         border: TableBorder.all(
//                                             color: Colors.grey.shade300
//                                         ),
//                                         columnWidths: {
//                                           0: FlexColumnWidth(3),
//                                           1: FlexColumnWidth(4),
//                                           // 2: FlexColumnWidth(4),
//                                         },
//                                         children: [
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child:Row(
//                                                     children: [
//                                                       Icon(Icons.person),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("Insurance detail",maxLines: 2,style: textstyle1)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("Insurance Detail of your package",  maxLines: 5,
//                                                           overflow: TextOverflow.ellipsis,style:textstyle),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(Icons.luggage),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("luggage allowance",maxLines: 2,style: textstyle1)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("luggage allowance of your Package",  maxLines: 2,
//                                                           overflow: TextOverflow.ellipsis,style: textstyle),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(Icons.health_and_safety),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("Health Requirement",maxLines: 2,style: textstyle1)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("your Health Requirement ",  maxLines: 2,
//                                                           overflow: TextOverflow.ellipsis,style: textstyle),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon( Icons.airline_seat_legroom_normal),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("seat Request",maxLines: 2,style:textstyle1)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("your special seat request",  maxLines: 2,
//                                                           overflow: TextOverflow.ellipsis,style: textstyle),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(Icons.food_bank),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("Special dietary requirement",maxLines: 2,style: textstyle1)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("your Special dietary requirements",  maxLines: 2,
//                                                           overflow: TextOverflow.ellipsis,style: textstyle),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon( Icons.cloud_circle),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("Weather",maxLines: 2,style: textstyle1)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("Weather update",  maxLines: 2,
//                                                           overflow: TextOverflow.ellipsis,style: textstyle),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(Icons.cancel_outlined),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("Cancellation charge",style: TextStyle(fontFamily:"Poppins",color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12.sp),)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("1000 Rs.",  maxLines: 2,
//                                                         overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily:"Poppins",color: Colors.grey.shade600,fontWeight: FontWeight.w400,fontSize: 10.sp),),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//                                           TableRow(
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(Icons.calendar_month_outlined),
//                                                       SizedBox(width:2.w),
//                                                       Expanded(child: Text("After Date Non Refundable",style: textstyle1)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding: EdgeInsets.all(2.w),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Text("15 Jan ,2023",  maxLines: 2,
//                                                           overflow: TextOverflow.ellipsis,style: textstyle),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]
//                                           ),
//
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//           ],
//         ));
//   }
//   TextStyle textstyle= TextStyle(
//     fontSize: 11.sp,
//     color: Colors.grey.shade700,
//     fontWeight: FontWeight.w400,
//     fontFamily: "Poppins"
//   );
//   TextStyle textstyle1= TextStyle(
//       fontSize: 12.sp,
//       color: Colors.black,
//       fontWeight: FontWeight.w600,
//       fontFamily: "Poppins"
//   );
//   dialog(){
//     TextEditingController _title = TextEditingController();
//     TextEditingController _disc = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
//           // elevation: 0.0,
//           backgroundColor: Colors.transparent,
//           child: Container(
//             margin: EdgeInsets.only(left: 0.0,right: 0.0),
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.only(top: 18.0,),
//                   // margin: EdgeInsets.only(top: 13.0,right: 8.0),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.rectangle,
//                       borderRadius: BorderRadius.circular(16.0),
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 0.0,
//                           offset: Offset(0.0, 0.0),
//                         ),
//                       ]),
//                   child:Container(
//                     padding:EdgeInsets.symmetric(horizontal: 5.w),
//                           height: 45.h,
//                           child: Column(
//                             children: [
//                               Text("Request For Change",style: TextStyle( color: Color(0xffb4776e6),fontFamily: "poppins",fontWeight: FontWeight.bold,fontSize: 14.sp),),
//                               SizedBox(height:2.h),
//                               TextFormField(
//                                 controller: _title,
//                                 keyboardType: TextInputType.text,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return 'Please enter Your Subject';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   // prefixIcon: Icon(Icons.subject,color: Colors.grey,),
//                                   filled: true,
//                                   hintText: "Subject",
//                                   hintStyle: textstyle,
//                                   fillColor: Colors.grey.shade100,
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.circular(10.0)
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.circular(10.0)
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 2.h,),
//                               TextFormField(
//                                 maxLines: 5,
//
//                                 controller: _disc,
//                                 keyboardType: TextInputType.text,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return 'Please enter Your Discription';
//                                   }return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   // prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
//                                   filled: true,
//                                   hintText: "Discription",
//                                   hintStyle: textstyle,
//                                   fillColor: Colors.grey.shade100,
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.circular(10.0)
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.circular(10.0)
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 2.h,),
//                               Center(
//                                 child: GestureDetector(
//                                   child:  Container(
//                                       alignment: Alignment.center,
//                                       height: 40.0,
//                                       width: 40.w,
//                                       decoration: BoxDecoration(
//                                           color: Color(0xffb4776e6),
//                                           borderRadius: BorderRadius.circular(10.0)
//                                       ),
//                                       child: Text("Submit",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 12.sp))),
//                                   onTap: (){
//                                     request();
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                 ),
//                 Positioned(
//                   // top: 0.h,
//                   // left: 75.w,
//                   right: 0.0,
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.of(context).pop();
//                     },
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: CircleAvatar(
//                         radius: 14.0,
//                         backgroundColor: Colors.white,
//                         child: Icon(Icons.close,color: Color(0xffb4776e6),),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//
//         );
//
//       },
//     );
//   }
//   request(){}
//   // detail(){
//   //   final Map<String, String> data = {
//   //   };
//   //   data['action'] = "detail_page";
//   //   data['itinerary_id'] = "3";
//   //   checkInternet().then((internet) async {
//   //     if (internet) {
//   //       travelprovider().detailapi(data).then((Response response) async {
//   //         detailmodal = DetailModal.fromJson(json.decode(response.body));
//   //         if (response.statusCode == 200 && detailmodal?.status == 1) {
//   //           setState(() {
//   //             // isLoading = false;
//   //           });
//   //           // await SaveDataLocal.saveLogInData(userData!);
//   //           print(detailmodal?.message);
//   //           // await SaveDataLocal.getDataFromLocal(userData!);
//   //           if (kDebugMode) {
//   //           }
//   //           buildErrorDialog(context, "","Login Successfully");
//   //
//   //
//   //           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
//   //         }
//   //         else{
//   //           buildErrorDialog(context, "","Invalid login");
//   //         }
//   //       });
//   //
//   //     } else {
//   //       setState(() {
//   //         // isLoading = false;
//   //       });
//   //       buildErrorDialog(context, 'Error',"Internate Required");
//   //     }
//   //   });
//   // }
// }
