import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:escapingplan/Modal/Favouritemodal.dart';
import 'package:escapingplan/Modal/tripmodal.dart';
import 'package:escapingplan/Modal/viewmodel.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:escapingplan/Provider/travelprovider.dart';
import 'package:escapingplan/screen/packegedetail.dart';
import 'package:escapingplan/screen/profile2.dart';
import 'package:escapingplan/screen/weather.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/drawer.dart';
import 'package:escapingplan/widget/load.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Modal/Rrequestmodel.dart';
import '../Modal/detailmodel.dart';
import '../Provider/homeProvider.dart';
import '../widget/locwig.dart';
import '../widget/weathercontainer.dart';
import 'MessagePage.dart';

class mytrips1 extends StatefulWidget {
  mytrips1({
    Key? key,
  }) : super(key: key);
  @override
  State<mytrips1> createState() => _mytrips1State();
}

class Sachen {
  Icon? image;
  String? name;
  String? link;
  Sachen(this.image, this.name, {this.link});
}

class _mytrips1State extends State<mytrips1> {
  TripModel? tripmodel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> place = [
    "All",
    "Upcoming",
    "Recently completed",
  ];
  Favouritemodal? favouritemodel;
  ViewModel? viewmodel;
  HomeProvider? apiproviderT;
  HomeProvider? apiproviderF;
  List<Sachen> icons = [
    Sachen(Icon(Icons.person, size: 10.w), "PROFILE", link: 'locview()'),
    Sachen(Icon(Icons.map_outlined, size: 10.w), "MAPS", link: 'locview()'),
    Sachen(Icon(Icons.cloudy_snowing, size: 10.w), "WEATHER",
        link: 'locview()'),
    Sachen(Icon(Icons.message_outlined, size: 10.w), "CHAT",
        link: 'MessagePage'),
  ];
  int? selectindex = 0;
  int? selectindex1 = 0;
  int? selectindex2 = 0;
  int? selectindex3 = 0;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    trip();
    favouruteap();
    view();
    detailap();
  }

  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<HomeProvider>(context, listen: false);
    apiproviderT = Provider.of<HomeProvider>(context, listen: true);

    return commanScreen(
      scaffold: Scaffold(
        drawer: drawer1(context),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => profile2()));
                  },
                  child: Row(
                    children: [
                      Text(
                        "Hi , " + (userData?.data?.fullname).toString() + "  !",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            fontFamily: "Poppins"),
                      ),
                      SizedBox(width: 2.w),
                      // CircleAvatar(
                      //   child: ClipOval(
                      //     child: CachedNetworkImage(
                      //       imageUrl: viewmodel?.data?.profileImg ?? '',
                      //       imageBuilder: (context, imageProvider) => Container(
                      //         height: 90,
                      //         width: 90,
                      //         decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //             image: imageProvider,
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //       placeholder: (context, url) => Center(
                      //           child: CircularProgressIndicator(
                      //         color: Colors.white,
                      //       )),
                      //       errorWidget: (context, url, error) => Container(
                      //         color: Colors.white,
                      //       ),
                      //       // Image.asset('assets/profile_pic_placeholder.png'),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  "Discover ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      fontFamily: "Poppins"),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectindex2 = index;

                                  print("index" + index.toString());
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => packagedetail(
                                        iid: (userData?.data?.itineraryId)
                                            .toString())));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 80.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 1.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: CachedNetworkImage(
                                        imageUrl: (detailmodal?.gallery?[index])
                                            .toString(),
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Container(color: Colors.white),
                                        // Image.asset('assets/profile_pic_placeholder.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 28.h,
                                    left: 3.w,
                                    right: 3.w,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 8.h,
                                      // width:74.w,
                                      color: Colors.black.withOpacity(0.3),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              (detailmodal?.aboutTheTour?[index]
                                                      .title)
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w600),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => locview(
                                  data:
                                      'https://www.google.com/maps/?api=1&query=21.1592002,72.8222963',
                                ),
                              ));
                            },
                            child: Container(
                              height: 40.h,
                              width: 90.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => locview(
                                      data:
                                          'https://www.google.com/maps/?api=1&query=21.1592002,72.8222963',
                                    ),
                                  ));
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'assets/map.png',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WeatherPage(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  height: 27.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/splash2.jpg")),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: weathercontainer(context)),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 3.w),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Feeling Adventurous?",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 18.sp,
              //             fontFamily: "Poppins",
              //             fontWeight: FontWeight.w600),
              //         textAlign: TextAlign.center,
              //       ),
              //       TextButton(
              //           onPressed: () {},
              //           child: Text(
              //             "Show all",
              //             style: TextStyle(
              //                 color: Color(0xffb4776e6),
              //                 fontSize: 12.sp,
              //                 fontFamily: "Poppins",
              //                 fontWeight: FontWeight.w600),
              //           ))
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 11.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 5.w),
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
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          index == 0
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => profile2(),
                                ))
                              : index == 1
                                  ? Navigator.of(context)
                                      .push(MaterialPageRoute(
                                      builder: (context) => locview(
                                        data:
                                            'https://www.google.com/maps/?api=1&query=21.1592002,72.8222963',
                                      ),
                                    ))
                                  : index == 2
                                      ? Navigator.of(context)
                                          .push(MaterialPageRoute(
                                          builder: (context) => WeatherPage(),
                                        ))
                                      : Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MessagePage()));
                          print('========= Why you Tapped ${index}? ========');
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: Container(
                            height: 10.h,
                            width: 17.w,
                            child: Column(
                              children: [
                                icons[index].image as Icon,
                                SizedBox(
                                  height: 1.h,
                                ),
                                Center(
                                  child: Text(
                                    icons[index].name.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 8.sp,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      isLoading: isLoading,
    );
  }

  view() {
    final Map<String, String> data = {};
    data['action'] = "view_profile";
    data['user_id'] = (userData?.data?.uId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewapi(data).then((Response response) async {
          viewmodel = ViewModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewmodel?.status == 1) {
            setState(() {
              isLoading = false;
            });
            if (kDebugMode) {}
          } else {
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
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  trip() {
    final Map<String, String> data = {};
    data['client_id'] = (userData?.data?.uId).toString();
    data['type'] = place[selectindex!].toString();
    data['action'] = 'my_trip';

    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().tripapi(data).then((Response response) async {
          tripmodel = TripModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && tripmodel?.status == 1) {
            setState(() {
              isLoading = false;
            });
            print(tripmodel?.data?[selectindex!].favourite);
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

  favouruteap() {
    print(tripmodel?.data?[selectindex2!].itineraryId);
    final Map<String, String> data = {};
    data['itinerary_id'] =
        (tripmodel?.data?[selectindex2!].itineraryId).toString();
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

            buildErrorDialog(context, "", (favouritemodel?.message).toString());
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

  adventure() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: new Text('Select from below'),
        content: Container(
            height: 185.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 1.5.h,
                  childAspectRatio: 1.3,
                  crossAxisCount: 3,
                ),
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 0.h),
                              child: Image.asset(icons[index].image.toString(),
                                  fit: BoxFit.cover,
                                  height: 10.w,
                                  width: 10.w,
                                  color: Color(0xffb4776e6))),
                          SizedBox(
                            height: 1.h,
                          ),
                          Center(
                            child: Text(
                              icons[index].name.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }

  detailap() {
    final Map<String, String> data = {};
    data['itinerary_id'] = (userData?.data?.itineraryId).toString();
    data['action'] = 'detail_page';
    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().detailapi(data).then((Response response) async {
          detailmodal = DetailModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && detailmodal?.status == 1) {
            setState(() {
              isLoading = false;
            });
            print('Hu Avi gyo ho');
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
