


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class newpage extends StatefulWidget {
  const newpage({Key? key}) : super(key: key);

  @override
  State<newpage> createState() => _newpageState();
}
class Sachen {
  String? image;
  String? name;

  Sachen(this.image, this.name);
}
class _newpageState extends State<newpage>with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int? index1 = 0;
  int? selectindex=0;
  int? _current =0;
  List<Sachen> sights= [
    Sachen("assets/sights/image1.jpg", "Maldives Package"),
    Sachen("assets/sights/image2.jpg", "Exotic Himachal"),
    Sachen("assets/sights/image3.jpg", "Pondichery"),
    Sachen("assets/sights/image4.jpg", "Amazing Goa"),
    Sachen("assets/sights/image5.jpg", "Mahabaleshwar Getway"),
  ];

  List<String> tours= [
    "assets/tours/tour1.jpg",
    "assets/tours/tour2.jpg",
    "assets/tours/tour3.jpg",
  ];
  List<String> place= [
    "  All  ",
    "Upcoming",
    "Recently Visited",
      ];
  List<Sachen> event= [
    Sachen("assets/upcoming.png","Upcoming"),
    Sachen("assets/checked.png","Recently Visited")
  ];
  List<Sachen> adventure= [
    Sachen("assets/adventure/image1.jpg","Adventure Trip") ,
    Sachen("assets/adventure/image2.jpg","Goa Trip"),
    Sachen("assets/adventure/image3.jpg","Himachal Trip"),
    Sachen("assets/adventure/tour1.jpg","Himachal Trip")
  ];
  @override
  void initState() {
    setState(() {
      index1 = 0;
      selectindex = 0;
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Color(0xff95cdd1),
              // Color(0xffd8e7ed),
              Color(0xffd4e4e8),
              Color(0xffffffff),
            ],
          ),
        ),
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor:Colors.transparent,
            // drawer: drawer2(context),
            body:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          //drawer1(context);
                          _scaffoldKey.currentState?.openDrawer();
                        }, icon: Icon(Icons.menu,color:Color(0xff103d4c),)),
                        Row(
                          children: [
                            Text("Hi , Raj !",style: TextStyle(color:Color(0xff103d4c),fontWeight: FontWeight.bold,fontSize: 12.sp,fontFamily: "Poppins"),),
                            SizedBox(width: 2.w),
                            CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                                  fit: BoxFit.cover,
                                  width:90,
                                  height: 90,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal:3.w),
                    child: Text("Discover new places",style: TextStyle(color:Color(0xff103d4c),fontWeight: FontWeight.w600,fontSize: 22.sp,fontFamily: "Poppins"),),
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    height: 5.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 3.w),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: place.length,
                        itemBuilder:(context,index){
                        return GestureDetector(
                          onTap: (){
                          setState(() {
                            selectindex = index;
                          });
                          },
                          child: Container(
                            height: 5.h,
                            margin: EdgeInsets.only(right: 3.w),
                            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            color: (selectindex != index) ? Colors.white :Color(0xff103d4c)
                            ),
                            child: Center(
                              child: Text(place[index],style: TextStyle(
                                fontFamily: "Poppins",fontWeight:
                                  FontWeight.bold,
                                color:(selectindex != index) ? Colors.grey.shade600 :Colors.white
                              ),),
                            ),
                          ),
                        );
                        } ),
                  ),
                  SizedBox(height: 5.h,),
                  (selectindex == 0)?Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height:60.h,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 3.w),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: adventure.length,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>packagedetail1()));
                                  },
                                  child: Container(
                                    //  height: 50.0,
                                    width: 80.w,
                                    margin:EdgeInsets.symmetric(horizontal:1.w,vertical:0.h ) ,
                                    decoration:BoxDecoration(
                                        color: (index % 2 == 0 )? Color(0xffDEF2B0) :Color(0xffb1d0e5),

                                        borderRadius:(index%2 == 0)? BorderRadius.only(topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(100.0)) : BorderRadius.only(topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),bottomRight: Radius.circular(100.0),
                                            bottomLeft: Radius.circular(20.0))

                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 45.h,
                                              width:80.w,
                                              padding:EdgeInsets.symmetric(horizontal:2.w,vertical:1.h ),
                                              child:
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                                                    topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0),
                                                    bottomLeft: Radius.circular(100.0)
                                                ),
                                                child: Image.asset(adventure[index].image!,height: 25.h,
                                                  width: 50.w,fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:3.h,
                                              left:61.w,
                                              right:2.w,
                                              child: Container(
                                                height:10.w,
                                                width:10.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // color:Color(0xff829bbc)
                                                  color: Colors.white.withOpacity(0.1),
                                                ),
                                                child: IconButton(
                                                    onPressed: (){},
                                                    icon: Icon(Icons.favorite,color: Colors.white,)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h,),
                                        Center(
                                          child: Text(adventure[index].name!,style: TextStyle(color:Color(0xff103d4c) ,fontSize: 20.sp,fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_outlined,color:Colors.grey.shade600),
                                              Text("India",style: TextStyle(color:Colors.grey.shade600 ,fontSize: 12.sp,fontFamily: "Poppins",
                                                  fontWeight: FontWeight.normal),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
                  ):(selectindex == 1)?Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height:60.h,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 3.w),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: sights.length,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>packagedetail()));
                                  },
                                  child: Container(
                                    //  height: 50.0,
                                    width: 80.w,
                                    margin:EdgeInsets.symmetric(horizontal:1.w,vertical:0.h ) ,
                                    decoration:BoxDecoration(
                                        color: (index % 2 == 0 )? Color(0xffDEF2B0) :Color(0xffb1d0e5),

                                        borderRadius:(index%2 == 0)? BorderRadius.only(topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(100.0)) : BorderRadius.only(topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),bottomRight: Radius.circular(100.0),
                                            bottomLeft: Radius.circular(20.0))

                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 45.h,
                                              width:80.w,
                                              padding:EdgeInsets.symmetric(horizontal:2.w,vertical:1.h ),
                                              child:
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                                                    topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0),
                                                    bottomLeft: Radius.circular(100.0)
                                                ),
                                                child: Image.asset(sights[index].image!,height: 25.h,
                                                  width: 50.w,fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:3.h,
                                              left:61.w,
                                              right:2.w,
                                              child: Container(
                                                height:10.w,
                                                width:10.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // color:Color(0xff829bbc)
                                                  color: Colors.white.withOpacity(0.1),
                                                ),
                                                child: IconButton(
                                                    onPressed: (){},
                                                    icon: Icon(Icons.favorite,color: Colors.white,)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h,),
                                        Center(
                                          child: Text(sights[index].name!,style: TextStyle(color:Color(0xff103d4c) ,fontSize: 20.sp,fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_outlined,color:Colors.grey.shade600),
                                              Text("India",style: TextStyle(color:Colors.grey.shade600 ,fontSize: 12.sp,fontFamily: "Poppins",
                                                  fontWeight: FontWeight.normal),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
                  ):Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                            height:60.h,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(left: 3.w),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: adventure.length,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>packagedetail()));
                                  },
                                  child: Container(
                                    //  height: 50.0,
                                    width: 80.w,
                                    margin:EdgeInsets.symmetric(horizontal:1.w,vertical:0.h ) ,
                                    decoration:BoxDecoration(
                                        color: (index % 2 == 0 )? Color(0xffDEF2B0) :Color(0xffb1d0e5),

                                        borderRadius:(index%2 == 0)? BorderRadius.only(topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(100.0)) : BorderRadius.only(topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),bottomRight: Radius.circular(100.0),
                                            bottomLeft: Radius.circular(20.0))

                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 45.h,
                                              width:80.w,
                                              padding:EdgeInsets.symmetric(horizontal:2.w,vertical:1.h ),
                                              child:
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                                                    topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0),
                                                    bottomLeft: Radius.circular(100.0)
                                                ),
                                                child: Image.asset(adventure[index].image!,height: 25.h,
                                                  width: 50.w,fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top:3.h,
                                              left:61.w,
                                              right:2.w,
                                              child: Container(
                                                height:10.w,
                                                width:10.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // color:Color(0xff829bbc)
                                                  color: Colors.white.withOpacity(0.1),
                                                ),
                                                child: IconButton(
                                                    onPressed: (){},
                                                    icon: Icon(Icons.favorite,color: Colors.white,)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h,),
                                        Center(
                                          child: Text(adventure[index].name!,style: TextStyle(color:Color(0xff103d4c) ,fontSize: 20.sp,fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Center(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_outlined,color:Colors.grey.shade600),
                                              Text("India",style: TextStyle(color:Colors.grey.shade600 ,fontSize: 12.sp,fontFamily: "Poppins",
                                                  fontWeight: FontWeight.normal),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
