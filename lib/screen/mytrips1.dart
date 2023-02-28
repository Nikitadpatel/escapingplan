import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:escapingplan/Modal/Favouritemodal.dart';
import 'package:escapingplan/Modal/tripmodal.dart';
import 'package:escapingplan/Modal/viewmodel.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:escapingplan/Provider/travelprovider.dart';
import 'package:escapingplan/screen/packegedetail.dart';
import 'package:escapingplan/screen/profile2.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/drawer.dart';
import 'package:escapingplan/widget/load.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

class mytrips1 extends StatefulWidget {

  mytrips1({Key? key,}) : super(key: key);

  @override
  State<mytrips1> createState() => _mytrips1State();
}
class Sachen {
  String? image;
  String? name;
  Sachen(this.image, this.name);
}
class _mytrips1State extends State<mytrips1> {
  TripModel? tripmodel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> place= [
    "All",
    "Upcoming",
    "Recently completed",
  ];
  Favouritemodal? favouritemodel;
  ViewModel? viewmodel;
  List<Sachen> icons= [
    Sachen("assets/icons/icon2.png","KAYAKING"),
    Sachen("assets/icons/icon3.png","BALLOONING"),
    Sachen("assets/icons/icon1.png","HIKING"),
    Sachen("assets/icons/icon7.png","SNOOKERING"),
    Sachen("assets/icons/icon8.png","RAFTING"),
    Sachen("assets/icons/icon9.png","HILL CLIMBING"),
  ];
  int? selectindex=0;
  int? selectindex1=0;
  int? selectindex2=0;
  int? selectindex3=0;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading=true;
    trip();
    favouruteap();
    view();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
        scaffold: Scaffold(
        drawer: drawer1(context),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 0.w,vertical: 2.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profile2()));
                  },
                  child: Row(
                    children: [
                      Text("Hi , "+ (userData?.data?.username).toString() + "  !",style: TextStyle(color:Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 12.sp,fontFamily: "Poppins"),),
                      SizedBox(width: 2.w),
                      CircleAvatar(
                        child: ClipOval(
                          child:CachedNetworkImage(
                            imageUrl: viewmodel?.data?.profileImg ?? '',
                            imageBuilder: (context, imageProvider) => Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    ),
                              ),),
                            placeholder: (context, url) =>  Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Container(
                                  color: Colors.white,
                                ),
                            // Image.asset('assets/profile_pic_placeholder.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    body:Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:5.w),
            child: Text("Discover ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 24.sp,fontFamily: "Poppins"),),
          ),
          SizedBox(height: 3.h,),
          Container(
            height: 6.h,
            width: MediaQuery.of(context).size.width,
            padding:  EdgeInsets.symmetric(horizontal:5.w),
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
                      trip();

                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5.h,
                          margin: EdgeInsets.only(right: 3.w),

                          // padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.h),
                          child: Center(
                            child: Text(place[index],style: TextStyle(
                                fontFamily: "Poppins",fontWeight:
                            FontWeight.bold,
                                color:(selectindex != index) ? Colors.grey.shade600 :Color(0xffb4776e6),
                          ),
                        ),),),
                        (selectindex !=index)?Container():
                        Center(
                          child: Container(
                            height: 7.0,
                            width: 7.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                color: Color(0xffb4776e6)
                            )
                          ),
                        ),
                      ],
                    ),
                  );
                } ),
          ),
          SizedBox(height: 3.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:5.w),
            child:
            Text(
                ((tripmodel?.data?.length).toString() == "0") ? "No Trip available for " + (place[selectindex!].toString()):"")) ,
              // (selectindex == 0) ? (adventure.length.toString()) + "  All":(selectindex == 1) ? sights.length.toString() +"  Upcoming" :adventure.length.toString()+"  Recently visited",
          SizedBox(height: 2.h,),
          (tripmodel?.data?.length == 0)?Container():
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.h,
            child:ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount:tripmodel?.data?.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                      setState(() {
                        selectindex2 = index;

                        print("index"+index.toString());
                      });
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> packagedetail(
                        iid:(tripmodel?.data?[index].itineraryId).toString())));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 40.h,
                        width:80.w,
                        padding:EdgeInsets.symmetric(horizontal:3.w,vertical:1.h ),
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CachedNetworkImage(
                            imageUrl: tripmodel?.data?[index].galleryImage?[0] ?? '',
                            placeholder: (context, url) =>  Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            Container(
                              color:Colors.white
                            ),
                                // Image.asset('assets/profile_pic_placeholder.png'),
                            fit: BoxFit.cover,
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
                            color: Colors.white,
                          ),
                          child: IconButton(
                              onPressed: (){
                                setState(() {
                                  selectindex2 = index;
                                });
                                favouruteap();
                                trip();
                              },
                              icon: Icon(((tripmodel?.data?[index].favourite).toString() == "0") ?Icons.favorite_outline : Icons.favorite,color: Colors.blue,)
                          ),
                        ),
                      ),
                      Positioned(
                        top: 28.h,
                        left: 3.w,
                        // right: 10.w,
                        child: Container(
                          height: 8.h,
                          width:74.w,
                          color: Colors.black.withOpacity(0.3),
                          child: Text((tripmodel?.data?[index].title) ?? "",style: TextStyle(color:Colors.white,fontSize: 20.sp,fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),)
                    ],
                  )
                );
              },
            )

          ),
          SizedBox(height: 3.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Feeling Adventurous?",style: TextStyle(color:Colors.black ,fontSize: 18.sp,fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,),
                TextButton(
                    onPressed: (){},
                    child: Text("Show all",style: TextStyle(color: Color(0xffb4776e6) ,fontSize: 12.sp,fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),))
              ],
            ),
          ),
          SizedBox(height: 3.h,),
          Container(
            height: 11.h,
            width: MediaQuery.of(context).size.width,
            padding:  EdgeInsets.only(left:5.w),
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     begin: Alignment.bottomCenter,
                //     end: Alignment.topCenter,
                //     colors: [
                //       Colors.blue.shade50,
                //       Colors.white,
                //     ]
                // )
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: icons.length,
                itemBuilder:(context,index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectindex1 = index;
                      });
                    },
                    child: Container(
                      height: 10.h,
                      width: 17.w,
                      child: Column(
                        children: [
                          Container(
                            // height: 5.h,
                            // width: 12.w,
                            margin: EdgeInsets.only(right: 5.w),
                            padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.h),
                            child: Image.asset(icons[index].image.toString(),fit: BoxFit.cover,height: 10.w,width: 10.w,color: Color(0xffb4776e6))
                          ),
                          SizedBox(height: 1.h,),
                          Center(
                            child: Text(icons[index].name.toString(),style: TextStyle(color:Colors.black ,fontSize: 8.sp,fontFamily: "Poppins",
                                fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,),
                          ),

                        ],
                      ),
                    ),
                  );
                } ),
          ),
        ],
      ),
    ) ,
      ),
      isLoading:isLoading,
    );
  }
  view(){
    final Map<String, String> data = {
    };
    data['action']="view_profile";
    data['user_id'] = (userData?.data?.uId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewapi(data).then((Response response) async {
          viewmodel = ViewModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewmodel?.status == "1") {
            setState(() {
              isLoading = false;
            });
            if (kDebugMode) {
            }
          }
          else{
            setState(() {
              isLoading = false;
            });
            // buildErrorDialog(context, "","Invalid login");
          }
        });

      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error',"Internate Required");
      }
    });
  }
  trip(){
    final Map<String, String> data = {};
    data['client_id'] = (userData?.data?.uId).toString();
    data['type'] = place[selectindex!].toString() ;
    data['action'] = 'my_trip';

    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().tripapi(data).then((Response response) async {

          tripmodel = TripModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && tripmodel?.status == 1) {
            setState(() {
              isLoading = false;
            });

            if (kDebugMode) {}
          } else {
            setState(() {
              isLoading = false;
            });
            buildErrorDialog(context, '', "No Itinerary ");
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
  favouruteap(){
    final Map<String, String> data = {};
    data['itinerary_id'] = (tripmodel?.data?[selectindex2!].itineraryId).toString();
    data['action'] = 'favourite_trip';
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().favouriteapi(data).then((Response response) async {
          favouritemodel = Favouritemodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && favouritemodel?.status == 1) {
            setState(() {
              isLoading = false;
            });
            trip();

            buildErrorDialog(context, "",(favouritemodel?.message).toString());
          } else {
            setState(() {
              isLoading = false;
            });
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
