import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:escapingplan/Modal/Rrequestmodel.dart';
import 'package:escapingplan/Modal/detailmodel.dart';
import 'package:escapingplan/Provider/travelprovider.dart';
import 'package:escapingplan/screen/mytrips1.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/load.dart';
import 'package:escapingplan/widget/sharedpreferance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class packagedetail extends StatefulWidget {
  final dynamic iid;

   packagedetail({Key? key,required this.iid}) : super(key: key);

  @override
  State<packagedetail> createState() => _packagedetailState();
}

class _packagedetailState extends State<packagedetail> {
  TextEditingController _title = TextEditingController();
  TextEditingController _disc = TextEditingController();
  ScrollController _scrollController =  ScrollController();
  final _formKey = GlobalKey<FormState>();
  int? _current = 0;
  int? selectindex=-1;
  int? selectindex1=0;
  int? group = 0;
  bool? select= false;
  bool? day =false;
  DetailModel? detailmodal;
  bool isLoading =false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
    isLoading=false;
    print(widget.iid);
    detailap();
    getdata();
  }
  getdata()async{
    userData =await  SaveDataLocal.getDataFromLocal();
    setState(() {
      userData;
    });

  }
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
          // appBar: AppBar(
          //   iconTheme: IconThemeData(color: Colors.black),
          //   elevation: 0.0,
          //   backgroundColor: Colors.transparent,
          //   automaticallyImplyLeading: true,
          // ),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      child: CarouselSlider(
                        carouselController: _controller,
                        items:(detailmodal?.gallery  ?? [])?.map((item) {
                          return Container(
                            height: 40.h,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: CachedNetworkImage(
                                  imageUrl: item ?? '',
                                  placeholder: (context, url) =>  Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/profile_pic_placeholder.png'),
                                  fit: BoxFit.cover,
                                ),),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                          height: 40.h,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          // aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 500),
                          viewportFraction: 1,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5.h,
                      left: 3.w,
                      right: 90.w,
                      child: Container(
                        child: IconButton(
                            onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>mytrips1()));
                            },
                            icon:Icon(Icons.arrow_back_ios,color: Colors.white,)
                        ),
                      ),
                    ),
                    Positioned(
                      top: 32.h,
                      left: 40.w,
                      child: Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: _current!,
                          count: 3,
                          effect: ScrollingDotsEffect(
                              spacing: 8.0,
                              radius: 3.0,
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                              paintStyle: PaintingStyle.stroke,
                              strokeWidth: 1.5,
                              dotColor: Colors.white,
                              activeDotColor: Colors.red),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: Container(
                        height:MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical:0.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)
                            ),
                        child:SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 3.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex:4,
                                    child: Text(
                                     (detailmodal?.aboutTheTour?[0].title).toString(),
                                      style: TextStyle(
                                        color: Color(0xffb4776e6),
                                          fontSize: 20.sp,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                        onPressed: (){
                                          dialog();
                                        },
                                        icon:Icon(Icons.edit,color: Color(0xffb4776e6),)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.5.h,),
                                  Container(
                                    // padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 12.sp,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(width:5.w),
                                        Container(
                                          // margin: EdgeInsets.symmetric(
                                          //     horizontal: 5.w, vertical:0.0),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w, vertical:2.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5.0),
                                              border: Border.all(color: Color(0xffb4776e6),)
                                          ),
                                          child: Text(
                                            (detailmodal?.tourInformation?[0].duration).toString(),
                                            style: TextStyle(
                                              color: Color(0xffb4776e6),
                                              fontSize: 10.sp,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                              SizedBox(height: 2.h,),
                              Container(
                            // padding:EdgeInsets.symmetric(
                            //         horizontal: 5.w, vertical:0.0),
                                child: Text(
                                  "About the Tour",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 5.w, vertical:0.0),
                                child: Text(
                                  (detailmodal?.aboutTheTour?[0].description).toString(),
                                  style: textstyle,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 5.w, vertical:0.0),
                                child: Text(
                                  "Tour Information",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 5.w, vertical:0.0),
                                child: Row(
                                  children: [
                                    Text("Duration : ",style: textstyle1,),
                                    Text( (detailmodal?.tourInformation?[0].duration).toString(),style: textstyle,)
                                  ],
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 5.w, vertical:2.0),
                                child: Row(
                                  children: [
                                    Text("Start Point : ",style: textstyle1,),
                                    Text( (detailmodal?.tourInformation?[0].startPoint).toString(),style: textstyle,)
                                  ],
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 5.w, vertical:2.0),
                                child: Row(
                                  children: [
                                    Text("End Point : ",style: textstyle1,),
                                    Text( (detailmodal?.tourInformation?[0].endPoint).toString(),style: textstyle,)
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              Container(
                                // padding:EdgeInsets.symmetric(
                                //     horizontal: 5.w, vertical:0.0),
                                child: Text(
                                  "Included",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Container(
                                width:MediaQuery.of(context).size.width,
                                height: 10.h,
                                color: Colors.grey.shade200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(width: 20.w,
                                      // color: (group == 0),
                                      decoration: BoxDecoration(
                                          // borderRadius:BorderRadius.circular(10.0),
                                        border:(group == 0) ?Border( bottom: BorderSide(width: 2.0,color: Color(0xffb4776e6))):
                                        Border( bottom: BorderSide(width: 0.0,color:Colors.transparent ,))
                                      ),
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                                group=0;
                                              });
                                            },
                                            icon: Transform.rotate(
                                                angle: 0 * pi/180,
                                                child: Icon((detailmodal?.travelDetail?[0].travelOption == "flight")?Icons.flight :(detailmodal?.travelDetail?[0].travelOption == "train")?Icons.train:(detailmodal?.travelDetail?[0].travelOption == "boat")?Icons.houseboat
                                                    :Icons.block,color: Color(0xffb4776e6),size: 3.h,)),
                                          ),
                                          Text("Transfer",style: textstyle3,)
                                        ],
                                      ),
                                    ),

                                    Container(width: 20.w,
                                      decoration: BoxDecoration(
                                        // borderRadius:BorderRadius.circular(10.0),
                                          border:(group ==  1) ?Border( bottom: BorderSide(width: 2.0,color: Color(0xffb4776e6))):
                                          Border( bottom: BorderSide(width: 0.0,color:Colors.transparent ,))
                                      ),
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                                group=1;
                                              });
                                            },
                                            icon: Icon(Icons.time_to_leave,color: Color(0xffb4776e6),size: 3.h,), ),
                                          Text("Transport",style: textstyle3,)
                                        ],
                                      ),
                                    ),
                                    // VerticalDivider(
                                    //   color: Colors.grey.shade400,
                                    //   thickness: 1,
                                    // ),
                                    Container(width: 20.w,
                                      decoration: BoxDecoration(
                                        // borderRadius:BorderRadius.circular(10.0),
                                          border:(group == 2) ?Border( bottom: BorderSide(width: 2.0,color: Color(0xffb4776e6))):
                                          Border( bottom: BorderSide(width: 0.0,color:Colors.transparent ,))
                                       ),
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              setState(() {
                                                group=2;
                                              });
                                            },
                                            icon: Icon(Icons.hotel,color: Color(0xffb4776e6),size: 3.h,), ),
                                          Text("Hotel",style: textstyle3,)
                                        ],
                                      ),
                                    ),
                                    // VerticalDivider(
                                    //   color: Colors.grey.shade400,
                                    //   thickness: 1,
                                    // ),
                                    Container(width: 20.w,
                                      decoration: BoxDecoration(
                                        // borderRadius:BorderRadius.circular(10.0),
                                          border:(group == 3) ?Border( bottom: BorderSide(width: 2.0,color: Color(0xffb4776e6))):
                                          Border( bottom: BorderSide(width: 0.0,color:Colors.transparent ,))
                                      ),
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  group=3;
                                                });
                                              },
                                              icon:Icon(Icons.calendar_month_outlined,color: Color(0xffb4776e6),size: 3.h,) ),
                                          Text("Itinerary",style: textstyle3,)
                                        ],
                                      ),
                                    ),
                                    // VerticalDivider(
                                    //   color: Colors.grey.shade400,
                                    //   thickness: 1,
                                    // ),
                                    Container(width: 20.w,
                                      decoration: BoxDecoration(

                                        // borderRadius:BorderRadius.circular(10.0),
                                          border:(group == 4) ?Border( bottom: BorderSide(width: 2.0,color: Color(0xffb4776e6))):
                                          Border( bottom: BorderSide(width: 0.0,color:Colors.transparent ,))
                                      ),
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  group=4;
                                                });
                                              },
                                              icon:Icon(Icons.info_rounded,color: Color(0xffb4776e6),size: 3.h,) ),
                                          Text("Other",style: textstyle3,)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3.h,),
                             Container(
                               child:  (group==0)?(detailmodal?.travelDetail?[0].travelOption == "")?Text("No Transfer data available."):
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   // Padding(
                                   //   padding:EdgeInsets.symmetric(horizontal: 5.w),
                                   //   child: Text("Transfer",style: textstyle1,),
                                   // ),
                                   // SizedBox(height: 2.h,),
                                   Container(
                                     margin:EdgeInsets.symmetric(horizontal: 2.w),
                                     padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10.0),
                                       boxShadow: <BoxShadow>[
                                         BoxShadow(
                                           color: Colors.grey.shade600,
                                           offset: Offset(1.0, 1.0),
                                           blurRadius: 3.0,
                                         ),
                                       ],
                                     ),
                                     child: Row(
                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         // Image.asset("assets/travel/plane.png",height: 12.w,width: 12.w,fit: BoxFit.cover,color: Colors.black,),
                                         // SizedBox(width: 2.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].departureTime).toString(),style: textstyle1,),
                                             Text((detailmodal?.travelDetail?[0].departureFromDate).toString(),style: textstyle,),
                                             Text((detailmodal?.tourInformation?[0].startPoint).toString(),style: textstyle,),
                                           ],
                                         ),
                                         SizedBox(width: 2.w,),
                                         Expanded(
                                           child:  Divider(
                                               thickness: 1.0,
                                               color: Color(0xffb4776e6)
                                             // height: 30,
                                           ),
                                         ),
                                         Container(
                                           height: 6.w,
                                           width: 6.w,
                                           margin: EdgeInsets.symmetric(horizontal: 2.0),
                                           decoration: BoxDecoration(
                                             color: Color(0xffb4776e6),
                                             borderRadius: BorderRadius.circular(5.0),
                                           ),
                                           child:Icon((detailmodal?.travelDetail?[0].travelOption == "flight")?Icons.flight :(detailmodal?.travelDetail?[0].travelOption == "train")?Icons.train:(detailmodal?.travelDetail?[0].travelOption == "boat")?Icons.houseboat
                                            :Icons.block,color: Colors.white,size: 3.h,)),

                                         Expanded(
                                           child:  Divider(
                                               thickness: 1.0,color: Color(0xffb4776e6)
                                             // height: 50,
                                           ),
                                         ),
                                         SizedBox(width: 2.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].dropTime).toString(),style: textstyle1,),
                                             Text((detailmodal?.travelDetail?[0].departureToDate).toString(),style: textstyle,),
                                             Text((detailmodal?.tourInformation?[0].startPoint).toString(),style: textstyle),
                                           ],
                                         )
                                       ],
                                     ),
                                   ),

                                   SizedBox(height: 3.h,),
                                   Container(
                                     margin:EdgeInsets.symmetric(horizontal: 2.w),
                                     padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10.0),
                                       boxShadow: <BoxShadow>[
                                         BoxShadow(
                                           color: Colors.grey.shade600,
                                           offset: Offset(1.0, 1.0),
                                           blurRadius: 3.0,
                                         ),
                                       ],
                                     ),
                                     child: Row(
                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         // Image.asset("assets/travel/plane.png",height: 12.w,width: 12.w,fit: BoxFit.cover,color: Colors.black,),
                                         // SizedBox(width: 2.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].returnDepartureTime).toString(),style: textstyle1,),
                                             Text((detailmodal?.travelDetail?[0].returnFromDate).toString(),style: textstyle,),
                                             Text((detailmodal?.tourInformation?[0].returnStartPoint).toString().toString(),style: textstyle,),
                                           ],
                                         ),
                                         SizedBox(width: 2.w,),
                                         Expanded(
                                           child:  Divider(
                                             thickness: 1.0,
                                             color: Color(0xffb4776e6),
                                             // height: 30,
                                           ),
                                         ),
                                         Column(
                                           children: [
                                             Container(
                                               height: 6.w,
                                               width: 6.w,
                                               margin: EdgeInsets.symmetric(horizontal: 2.0),
                                               decoration: BoxDecoration(
                                                 color: Color(0xffb4776e6),
                                                 borderRadius: BorderRadius.circular(5.0),
                                               ),
                                               child: Icon((detailmodal?.travelDetail?[0].travelOption == "flight")?Icons.flight :(detailmodal?.travelDetail?[0].travelOption == "train")?Icons.train:(detailmodal?.travelDetail?[0].travelOption == "boat")?Icons.houseboat
                                                   :Icons.block,color: Colors.white,size: 3.h,)
                                             ),
                                             // Row(
                                             //   children: [
                                             //     Icon(Icons.watch_later_outlined,color: Colors.grey.shade400,),
                                             //     Text("2 Hour",style: textstyle,)
                                             //   ],
                                             // )
                                           ],
                                         ),
                                         Expanded(
                                           child:  Divider(
                                               thickness: 1.0,
                                               color: Color(0xffb4776e6)
                                             // height: 50,
                                           ),
                                         ),
                                         SizedBox(width: 2.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].returnDropTime).toString(),style: textstyle1,),
                                             Text((detailmodal?.travelDetail?[0].returnToDate).toString(),style: textstyle,),
                                             Text((detailmodal?.tourInformation?[0].returnEndPoint).toString(),style: textstyle),
                                           ],
                                         )
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 3.h,),
                                 ],
                               ):(group==1 )?
                               (detailmodal?.transport?[0].transfer== "" && detailmodal?.transport?[0].returnTransfer== "")?
                               Text("No transport data available"):
                               Column(
                                 children: [
                                   Container(
                                     margin:EdgeInsets.symmetric(horizontal: 2.w),
                                     padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10.0),
                                       boxShadow: <BoxShadow>[
                                         BoxShadow(
                                           color: Colors.grey.shade600,
                                           offset: Offset(1.0, 1.0),
                                           blurRadius: 3.0,
                                         ),
                                       ],
                                     ),
                                     child: Row(
                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         // Image.asset("assets/travel/car.png",height: 12.w,width: 12.w,fit: BoxFit.cover,color: Colors.black,),
                                         // SizedBox(width: 3.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].pickupTime).toString(),style: textstyle1,),
                                             // Text("Fri ,28 Feb",style: textstyle,),
                                             // Text("Xyz road",style: textstyle,),
                                           ],
                                         ),
                                         SizedBox(width: 2.w,),
                                         Expanded(
                                           child:  Divider(
                                             color: Color(0xffb4776e6),
                                             thickness: 1.0,
                                             // height: 30,
                                           ),
                                         ),
                                         Container(
                                           height: 6.w,
                                           width: 7.w,
                                           margin: EdgeInsets.symmetric(horizontal: 2.0),
                                           padding: EdgeInsets.symmetric(horizontal: 2.0),
                                           decoration: BoxDecoration(
                                             color: Color(0xffb4776e6),
                                             borderRadius: BorderRadius.circular(5.0),
                                           ),
                                           child:Image.asset("assets/travel/car.png",fit: BoxFit.cover,color: Colors.white,),
                                         ),
                                         Expanded(
                                           child:  Divider(
                                             color: Color(0xffb4776e6),
                                             thickness: 1.0,
                                             // height: 50,
                                           ),
                                         ),

                                         SizedBox(width: 2.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].dropTime).toString(),style: textstyle1,),
                                             // Text("Tue ,03 Mar",style: textstyle,),
                                             // Text("Kochi",style: textstyle),
                                           ],
                                         )
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 3.h,),
                                   Container(
                                     margin:EdgeInsets.symmetric(horizontal: 2.w),
                                     padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10.0),
                                       boxShadow: <BoxShadow>[
                                         BoxShadow(
                                           color: Colors.grey.shade600,
                                           offset: Offset(1.0, 1.0),
                                           blurRadius: 3.0,
                                         ),
                                       ],
                                     ),
                                     child: Row(
                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         // Image.asset("assets/travel/car.png",height: 12.w,width: 12.w,fit: BoxFit.cover,color: Colors.black,),
                                         // SizedBox(width: 3.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].returnPickupTime).toString(),style: textstyle1,),
                                             // Text("Fri ,28 Feb",style: textstyle,),
                                             // Text("Xyz road",style: textstyle,),
                                           ],
                                         ),
                                         SizedBox(width: 2.w,),
                                         Expanded(
                                           child:  Divider(
                                             color: Color(0xffb4776e6),
                                             thickness: 1.0,
                                             // height: 30,
                                           ),
                                         ),
                                         Container(
                                           height: 6.w,
                                           width: 7.w,
                                           margin: EdgeInsets.symmetric(horizontal: 2.0),
                                           padding: EdgeInsets.symmetric(horizontal: 2.0),
                                           decoration: BoxDecoration(
                                             color: Color(0xffb4776e6),
                                             borderRadius: BorderRadius.circular(5.0),
                                           ),
                                           child:Transform.rotate(
                                               angle:0* pi/180,
                                               child: Image.asset("assets/car.png",fit: BoxFit.cover,color: Colors.white,)),
                                         ),
                                         Expanded(
                                           child:  Divider(
                                             color: Color(0xffb4776e6),
                                             thickness: 1.0,
                                             // height: 50,
                                           ),
                                         ),

                                         SizedBox(width: 2.w,),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text((detailmodal?.travelDetail?[0].returnDropTime).toString(),style: textstyle1,),
                                             // Text("Tue ,03 Mar",style: textstyle,),
                                             // Text("Kochi",style: textstyle),
                                           ],
                                         )
                                       ],
                                     ),
                                   ),
                                   SizedBox(height: 3.h,),
                                 ],
                               ):
                               (group == 2)?(detailmodal?.hotel?.length == 0)?Text("No accomodation data available."):
                               Container(
                                 height: 40.h,
                                 width: MediaQuery.of(context).size.width,
                                 child: ListView.builder(
                                   scrollDirection: Axis.vertical,
                                     itemCount:detailmodal?.hotel?.length,
                                     itemBuilder: (context,index){
                                   return  Container(
                                     margin:EdgeInsets.symmetric(horizontal: 2.w),
                                     padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10.0),
                                       boxShadow: <BoxShadow>[
                                         BoxShadow(
                                           color: Colors.grey.withOpacity(0.5),
                                           spreadRadius: 3,
                                           blurRadius: 2,
                                           offset: Offset(0, 3), // changes position of shadow
                                         ),
                                       ],
                                     ),
                                     child: Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Expanded(
                                           flex: 2,
                                           child: ClipRRect(
                                             borderRadius:BorderRadius.circular(10.0),
                                             child: Image.network((detailmodal?.hotel?[index].hotelImage).toString()
                                               ,height: 20.h,width: 30.w,fit: BoxFit.cover,),
                                           ),
                                         ),
                                         SizedBox(width: 3.w,),
                                         Expanded(
                                           flex:4,
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text((detailmodal?.hotel?[index].hotelName).toString(),  maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily:"Poppins",color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.sp),),
                                               SizedBox(height: 1.h,),
                                               Row(
                                                 children: [
                                                   Icon(Icons.holiday_village,color: Colors.grey.shade700,),
                                                   SizedBox(width: 2.w,),
                                                   Expanded(
                                                     child: Text((detailmodal?.hotel?[index].hotelType).toString(),maxLines: 3,
                                                       overflow: TextOverflow.ellipsis,
                                                       style: textstyle,),
                                                   ),
                                                 ],
                                               ),
                                               SizedBox(height: 1.h,),
                                               Row(
                                                 children: [
                                                   Icon(Icons.location_on_outlined,color: Colors.grey.shade700),SizedBox(width: 2.w,),
                                                   Text((detailmodal?.hotel?[index].location).toString(),style: textstyle),
                                                 ],
                                               ),
                                               SizedBox(height: 1.h,),
                                               Row(
                                                 children: [
                                                   Icon(Icons.date_range,color: Colors.grey.shade700),
                                                   SizedBox(width: 2.w,),
                                                   Text((detailmodal?.hotel?[index].noOfNight) .toString() +  "Nights",style: textstyle),
                                                 ],
                                               )
                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   );
                                 }),
                               ):(group == 3)?
                               (detailmodal?.itinerary?.length == 0)?Text("Daywise  no itinerary Available"):  ListView.builder(
                                     padding: EdgeInsets.all(0.0),
                                       scrollDirection: Axis.vertical,
                                       physics: BouncingScrollPhysics(),
                                       shrinkWrap: true,
                                       itemCount: detailmodal?.itinerary?.length,
                                       itemBuilder:(context,index){
                                         return Column(
                                           children: [
                                             GestureDetector(
                                               onTap: (){
                                                 setState(() {
                                                   selectindex1 = index;
                                                 });
                                               },
                                               child: Container(
                                                   width: MediaQuery.of(context).size.width,
                                                   height:6.h,
                                                   margin: EdgeInsets.symmetric(horizontal: 2.w),
                                                   padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                                   decoration: BoxDecoration(
                                                     color: Colors.white,
                                                     borderRadius: BorderRadius.circular(10.0),
                                                     boxShadow: <BoxShadow>[
                                                       BoxShadow(
                                                         color: Colors.grey.shade600,
                                                         offset: Offset(1.0, 1.0),
                                                         blurRadius: 1.0,
                                                       ),
                                                     ],
                                                   ),
                                                   child:Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                       children:[
                                                         Row(
                                                           children: [
                                                             Icon(Icons.calendar_month_outlined,size: 3.h,color: Color(0xffb4776e6),),
                                                             SizedBox(width: 3.w,),
                                                             Text("Day "+((index + 1).toString()) +  "  [" + (detailmodal?.itinerary?[index].date).toString() + "]",
                                                                 style:textstyle1),
                                                           ],
                                                         ),
                                                         (selectindex1 == index)?Transform.rotate(
                                                             angle: -90*pi/180,
                                                             child: Icon(Icons.arrow_back_ios_new_outlined,size: 2.h,)):
                                                         Transform.rotate(
                                                             angle: 90*pi/180,
                                                             child: Icon(Icons.arrow_back_ios_new_outlined,size: 2.h,)),
                                                       ]
                                                   )
                                               ),
                                             ),
                                             SizedBox(height: 1.h,),
                                             (selectindex1 == index) ? Container(
                                               color: Colors.white,
                                               padding: EdgeInsets.symmetric(horizontal: 5.w,vertical :1.5.h),
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Text( detailmodal?.itinerary?[index].daysTitle ?? ""
                                                   ,textAlign: TextAlign.left,maxLines: 4,style: TextStyle(fontSize: 14.sp,fontFamily: "Poppins",fontWeight: FontWeight.bold)),
                                                   SizedBox(height: 1.h,),
                                                   Row(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                     children: [
                                                       Expanded(
                                                         flex:1,
                                                         child: Container(
                                                           margin: EdgeInsets.all(5.0),
                                                           height: 7.0,
                                                           width: 7.0,
                                                           decoration: BoxDecoration(
                                                               shape: BoxShape.circle,
                                                               color: Colors.black
                                                           ),
                                                         ),
                                                       ),
                                                       Expanded(
                                                         flex:9,
                                                         child: Text( (detailmodal?.itinerary?[index].dayDescription != "")?(detailmodal?.itinerary?[index].dayDescription ).toString():"No Description available.",textAlign: TextAlign.left,maxLines: 4,style: textstyle),
                                                       ),
                                                     ],
                                                   ),

                                                 ],
                                               ),
                                             ):Container(),
                                           ],
                                         );
                                       } ) :
                               ( detailmodal?.otherInformation?.description?[0] == "") ?Text("No other Information available."):   ListView.builder(
                                 padding: EdgeInsets.all(0.0),
                                   scrollDirection: Axis.vertical,
                                   physics: BouncingScrollPhysics(),
                                   shrinkWrap: true,
                                   itemCount: detailmodal?.otherInformation?.description?.length,
                                   itemBuilder:(context,index){
                                     return Column(
                                       children: [
                                         GestureDetector(
                                           onTap: (){
                                             setState(() {
                                             selectindex = index;
                                             });
                                           },
                                           child: Container(
                                               width: MediaQuery.of(context).size.width,
                                               height:6.h,
                                               margin: EdgeInsets.symmetric(horizontal: 2.w),
                                               padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                               decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 borderRadius: BorderRadius.circular(10.0),
                                                 boxShadow: <BoxShadow>[
                                                   BoxShadow(
                                                     color: Colors.grey.shade600,
                                                     offset: Offset(1.0, 1.0),
                                                     blurRadius: 3.0,
                                                   ),
                                                 ],
                                               ),
                                               child:Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   children:[
                                                     Row(
                                                       children: [
                                                         // Icon(detail[index].icon,color: Color(0xffb4776e6),),
                                                         SizedBox(width: 3.w,),
                                                         Text((detailmodal?.otherInformation?.title?[index]).toString(),overflow: TextOverflow.ellipsis,maxLines: 2,style:textstyle1),
                                                       ],
                                                     ),
                                                     (selectindex == index)?Transform.rotate(
                                                         angle: -90*pi/180,
                                                         child: Icon(Icons.arrow_back_ios_new_outlined,size: 2.h,)):
                                                     Transform.rotate(
                                                         angle: 90*pi/180,
                                                         child: Icon(Icons.arrow_back_ios_new_outlined,size: 2.h,)),
                                                   ]
                                               )
                                           ),
                                         ),
                                         SizedBox(height: 1.h,),
                                         (selectindex == index) ? Container(
                                           color: Colors.white,
                                           padding: EdgeInsets.symmetric(horizontal: 5.w,vertical:1.5.h),
                                           child: Column(
                                             children: [
                                               Row(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 children: [
                                                   Expanded(
                                                     flex:1,
                                                     child: Container(
                                                       margin: EdgeInsets.all(5.0),
                                                       height: 7.0,
                                                       width: 7.0,
                                                       decoration: BoxDecoration(
                                                           shape: BoxShape.circle,
                                                           color: Colors.black
                                                       ),
                                                     ),
                                                   ),
                                                   Expanded(
                                                     flex:9,
                                                     child: Text( (detailmodal?.otherInformation?.description?[index]).toString(),textAlign: TextAlign.left,maxLines: 4,style: textstyle),
                                                   ),
                                                 ],
                                               ),
                                               SizedBox(height: 1.h,),

                                             ],
                                           ),
                                         ):Container(),
                                         SizedBox(height: 1.h,),
                                       ],
                                     );

                                   } ),
                             )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          )),
      isLoading:isLoading,
    );
  }
  TextStyle textstyle= TextStyle(
      fontSize: 11.sp,
      color: Colors.grey.shade700,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins"
  );
  TextStyle textstyle1= TextStyle(
      fontSize: 12.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins"
  );

  TextStyle textstyle3= TextStyle(
      fontSize: 10.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins"
  );
  dialog(){
     showDialog(
      context: context,
    builder: (BuildContext context) {
       return Padding(
         padding:  EdgeInsets.symmetric(horizontal: 0.w,vertical: 0.h),
         child: AlertDialog(
           titlePadding: EdgeInsets.only(bottom:1.h),
           // insetPadding: EdgeInsets.zero,
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Container(
            padding: EdgeInsets.only(left: 3.w,right: 0.w),
            decoration: BoxDecoration(
              color: Color(0xffb4776e6),
                borderRadius: BorderRadius.only(topRight:Radius.circular(10.0),topLeft: Radius.circular(10.0))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Request For Change",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                    icon: Icon(Icons.close,color: Colors.white,))
              ],
            ),
          ),
          contentPadding:EdgeInsets.symmetric(horizontal:5.w,vertical:1.h),
          content:  Container(
            height: 43.h,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 2.h,),
                  TextFormField(
                    controller: _title,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Your Subject';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.subject,color: Colors.grey,),
                      filled: true,
                      hintText: "Subject",
                      hintStyle: textstyle,
                      fillColor: Colors.grey.shade100,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  TextFormField(
                    maxLines: 5,
                    controller: _disc,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Your Description';
                      }return null;
                    },
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                      filled: true,
                      hintText: "Description",
                      hintStyle: textstyle,
                      fillColor: Colors.grey.shade100,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Center(
                    child: GestureDetector(
                      child:  Container(
                          alignment: Alignment.center,
                          height: 6.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              color: Color(0xffb4776e6),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text("Submit",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.w600,fontSize: 12.sp))),
                      onTap: () {
                        Navigator.of(context).pop();
                        requestap();

                      }
                    ),
                  ),
                ],
              ),
            ),
          ),

      ),
       );
    },
    );
  }
  requestap(){
    if(_formKey.currentState!.validate()){
      final Map<String, String> data = {};
      data['user_id'] = (userData?.data?.uId).toString();
      data['itinerary_id'] = widget.iid;
      data['action'] = 'request_change';
      data['comment'] = _disc.text.trim().toString();
      data['subject'] = _title.text.trim().toString();

      checkInternet().then((internet) async {
        if (internet) {
          travelprovider().requestapi(data).then((Response response) async {
            RequestModel
            requestmodel = RequestModel.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && requestmodel?.status == 1) {
              setState(() {
                // isLoading = false;
              });
              buildErrorDialog(context, "", (requestmodel?.message).toString());
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>packagedetail(iid: widget.iid)));
              _title.text="";
              _disc.text="";

              if (kDebugMode) {}
            } else {
              buildErrorDialog(context, "", (requestmodel?.message).toString());
            }
          });
        } else {
          setState(() {
            isLoading = false;
          });
          buildErrorDialog(context, 'Error', "Internate Required");
        }
      });
    }
  }
  detailap(){
    print(widget.iid);
    final Map<String, String> data = {};
    data['itinerary_id'] = widget.iid;
    data['action'] = 'detail_page';
    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().detailapi(data).then((Response response) async {
          detailmodal = DetailModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && detailmodal?.status == 1) {
            setState(() {
              isLoading = false;
            });
            if (kDebugMode) {}
          } else {
            setState(() {
              isLoading = false;
            });
            // buildErrorDialog(context, "", "Invalid login");
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

}