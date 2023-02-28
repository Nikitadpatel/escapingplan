//
//
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
//
//
// class detail extends StatefulWidget {
//   const detail({Key? key}) : super(key: key);
//
//   @override
//   State<detail> createState() => _detailState();
// }
// class Sachen {
//   String? image;
//   String? name;
//
//   Sachen(this.image, this.name);
// }
// class _detailState extends State<detail>with SingleTickerProviderStateMixin {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   // final CarouselController _controller = CarouselController();
//   int? index1 = 0;
//   int? selectindex=0;
//   int? _current =0;
//     List<Sachen> sights= [
//     Sachen("assets/sights/image1.jpg", "Maldives Package"),
//     Sachen("assets/sights/image2.jpg", "Exotic Himachal"),
//     Sachen("assets/sights/image3.jpg", "Pondichery"),
//     Sachen("assets/sights/image4.jpg", "Amazing Goa"),
//     Sachen("assets/sights/image5.jpg", "Mahabaleshwar Getway"),
//      ];
//   List<String> sights1= [
//  "https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
//  "https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
//   "https://images.unsplash.com/photo-1551291420-91160f3d4961?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
//   ];
//   List<String> tours= [
//     "assets/tours/tour1.jpg",
//     "assets/tours/tour2.jpg",
//    "assets/tours/tour3.jpg",
//   ];
//   List<Sachen> event= [
//    Sachen("assets/upcoming.png","Upcoming"),
//     Sachen("assets/checked.png","Recently Visited")
//   ];
//   List<Sachen> adventure= [
//     Sachen("assets/adventure/adv1.jpg","Adventure Trip") ,
//     Sachen("assets/adventure/adv2.jpg","Goa Trip"),
//     Sachen("assets/adventure/adv3.jpg","Himachal Trip")
//   ];
// @override
//   void initState() {
//  setState(() {
//    index1 = 0;
//    selectindex = 0;
//  });
//
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         backgroundColor:Colors.white,
//        drawer: drawer2(context),
//         body:SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//            Padding(
//              padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  IconButton(onPressed: (){
//                    //drawer1(context);
//                    _scaffoldKey.currentState?.openDrawer();
//                  }, icon: Icon(Icons.menu_rounded,color: Colors.black,)),
//                   Row(
//                     children: [
//                       Text("Hi , Raj !",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12.sp,fontFamily: "Poppins"),),
//                       SizedBox(width: 2.w),
//                       Image.asset("assets/man1.png",height: 10.w,width: 10.w,),
//                     ],
//                   )
//                ],
//              ),
//            ),
//            Padding(
//              padding:  EdgeInsets.symmetric(horizontal:3.w),
//              child: Text("Where do \n you want to go?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22.sp,fontFamily: "Poppins"),),
//            ),
//               SizedBox(height: 3.h,),
//               Stack(
//                 children: [
//                   Container(
//                     height:25.h,
//                     width: MediaQuery.of(context).size.width,
//                     child: CarouselSlider(
//                       carouselController: _controller,
//                       items: sights1 .map((item) {
//                         return GestureDetector(
//                           onTap: (){
//                             // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>packagedetail1()));
//                           },
//                           child:
//                           Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Stack(
//                                   children: [
//                                     Container(
//                                       height: 25.h,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: Image.network(item,
//                                         fit: BoxFit.cover,),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                       options: CarouselOptions(
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _current = index;
//                           });
//                         },
//                         height: 30.h,
//                         enlargeCenterPage: true,
//                         autoPlay: true,
//                         aspectRatio: 16 / 9,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration: Duration(milliseconds: 500),
//                         viewportFraction:1,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top:22.h,
//                     left: 40.w,
//                     child: Center(
//                       child: AnimatedSmoothIndicator(
//                         activeIndex: _current!,
//                         count: sights1.length,
//                         effect:  ScrollingDotsEffect(
//                             spacing:  8.0,
//                             radius:  3.0,
//                             dotWidth:  8.0,
//                             dotHeight:  8.0,
//                             paintStyle:  PaintingStyle.stroke,
//                             strokeWidth:  1.5,
//                             dotColor:  Colors.white,
//                             activeDotColor:  Colors.red,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: 5.h,),
//               Container(
//                 height: 50.0,
//                 width: MediaQuery.of(context).size.width,
//                 child: ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: event.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                        setState(() {
//                          selectindex = index;
//                          });
//                       },
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 3.w),
//                         padding: EdgeInsets.only(left: 5.w, right: 5.w),
//                         decoration: BoxDecoration(
//                           color: index != selectindex
//                               ? Colors.grey.withOpacity(0.1)
//                               :Colors. blue.withOpacity(0.2),
//                           borderRadius: const BorderRadius.all(
//                               Radius.circular(30)),
//                         ),
//                         child: Center(
//                           child: Row(
//                             children: [
//                                Image.asset(event[index].image!,fit: BoxFit.cover,height: 5.w,width: 5.w,color: index != selectindex
//                                    ? Colors.grey
//                                    :  Color(0xff1a54ac),),
//                                SizedBox(width: 2.w,),
//                               Text(event[index].name! ,
//                                 textAlign: TextAlign.start,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: index != selectindex
//                                       ? Colors.grey
//                                       :  Color(0xff1a54ac),
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 12.sp,
//                                   fontFamily: "poppins",
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 5.h,),
//               Container(
//                 height: 50.h,
//                 width: MediaQuery.of(context).size.width,
//               child:
//                 (selectindex==0)?
//                  Column(
//                       children: [
//                        Container(
//                           height:30.h,
//                           width: MediaQuery.of(context).size.width,
//                           padding: EdgeInsets.symmetric(horizontal: 3.w),
//                           child: ListView.builder(
//                            physics: const BouncingScrollPhysics(),
//                             shrinkWrap: true,
//                             padding: EdgeInsets.zero,
//                             scrollDirection: Axis.horizontal,
//                           itemCount: adventure.length,
//                             itemBuilder: (context,index){
//                                 return GestureDetector(
//                                           onTap: (){
//                                             // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>packagedetail()));
//                                           },
//                                           child: Container(
//                                               //  height: 50.0,
//                                                 width: 50.w,
//                                                 margin:EdgeInsets.symmetric(horizontal:1.w,vertical:0.h ) ,
//                                                 decoration:BoxDecoration(
//                                                       border:Border.all(
//                                                         color: Colors.grey.shade300
//                                                       ),
//                                                     borderRadius: BorderRadius.circular(20.0),
//                                                 ),
//                                             child: Column(
//                                               children: [
//                                                 Stack(
//                                                   children: [
//                                                     Container(
//                                                       height: 25.h,
//                                                       width: 50.w,
//                                                       padding:EdgeInsets.symmetric(horizontal:2.w,vertical:1.h ),
//                                                       child:
//                                                     ClipRRect(
//                                                       borderRadius: BorderRadius.circular(20.0),
//                                                       child: Image.asset(adventure[index].image!,height: 25.h,
//                                                           width: 50.w,fit: BoxFit.cover,
//                                                           ),
//                                                     ),
//                                                     ),
//                                                     Positioned(
//                                                       top:2.h,
//                                                       left:31.w,
//                                                       right:2.w,
//                                                       child: Container(
//                                                         height:10.w,
//                                                         width:10.w,
//                                                         decoration: BoxDecoration(
//                                                           shape: BoxShape.circle,
//                                                           color: Colors.white,
//                                                         ),
//                                                         child: IconButton(
//                                                             onPressed: (){},
//                                                             icon: Icon(Icons.favorite_outline,color: Colors.blue,)
//                                                         ),
//                                                       ),
//                                                     ),
//
//                                                   ],
//                                                 ),
//                                            Center(
//                                              child: Text(adventure[index].name!,style: TextStyle(color: Colors.black,fontSize: 12.sp,fontFamily: "Poppins",
//                                              fontWeight: FontWeight.bold),
//                                              overflow: TextOverflow.ellipsis,
//                                              maxLines: 2,
//                                                 textAlign: TextAlign.center,
//                                              ),
//                                            ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                             },
//                           ),
//                         )
//                       ],
//                     ):
//                      Column(
//                       children: [
//                        Container(
//                           height:32.h,
//                           width: MediaQuery.of(context).size.width,
//                           padding: EdgeInsets.symmetric(horizontal: 3.w),
//                           child: ListView.builder(
//                            physics: const BouncingScrollPhysics(),
//                             shrinkWrap: true,
//                             padding: EdgeInsets.zero,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: sights.length,
//                             itemBuilder: (context,index){
//                                 return GestureDetector(
//                                           onTap: (){
//                                             // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>packagedetail()));
//                                           },
//                                           child: Container(
//                                               //  height: 50.0,
//                                                 width: 50.w,
//                                                 margin:EdgeInsets.symmetric(horizontal:1.w,vertical:0.h ) ,
//                                                 decoration:BoxDecoration(
//                                                       border:Border.all(
//                                                         color: Colors.grey.shade300
//                                                       ),
//                                                     borderRadius: BorderRadius.circular(20.0),
//                                                 ),
//                                             child: Column(
//                                               children: [
//                                                 Stack(
//                                                   children: [
//                                                     Container(
//                                                       height: 25.h,
//                                                       width: 50.w,
//                                                       padding:EdgeInsets.symmetric(horizontal:2.w,vertical:1.h ),
//                                                       child:
//                                                     ClipRRect(
//                                                       borderRadius: BorderRadius.circular(20.0),
//                                                       child: Image.asset(sights[index].image!,height: 25.h,
//                                                           width: 50.w,fit: BoxFit.cover,
//                                                           ),
//                                                     ),
//                                                     ),
//                                                     Positioned(
//                                                       top:2.h,
//                                                       left:31.w,
//                                                       right:2.w,
//                                                       child: Container(
//                                                         height:10.w,
//                                                         width:10.w,
//                                                         decoration: BoxDecoration(
//                                                           shape: BoxShape.circle,
//                                                           color: Colors.white,
//                                                         ),
//                                                         child: IconButton(
//                                                             onPressed: (){},
//                                                             icon: Icon(Icons.favorite_outline,color: Colors.blue,)
//                                                         ),
//                                                       ),
//                                                     ),
//
//                                                   ],
//                                                 ),
//                                            Center(
//                                              child: Text(sights[index].name!,style: TextStyle(color: Colors.black,fontSize: 12.sp,fontFamily: "Poppins",
//                                              fontWeight: FontWeight.bold),
//                                              overflow: TextOverflow.ellipsis,
//                                              textAlign: TextAlign.center,
//                                              maxLines: 2,
//                                              ),
//                                            ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                             },
//                           ),
//                         )
//                       ],
//                     )
//                 )
//             ],
//           ),
//         )
//       ),
//     );
//   }
// }
