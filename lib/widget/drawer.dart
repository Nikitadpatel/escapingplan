import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:escapingplan/Modal/viewmodel.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:escapingplan/screen/MessagePage.dart';
import 'package:escapingplan/screen/favouritelist.dart';
import 'package:escapingplan/screen/login.dart';
import 'package:escapingplan/screen/myagent.dart';
import 'package:escapingplan/screen/mytrips1.dart';
import 'package:escapingplan/screen/ourpartners.dart';
import 'package:escapingplan/screen/profile2.dart';
import 'package:escapingplan/screen/resuestlist.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/sharedpreferance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class drawer1 extends StatefulWidget {
  final BuildContext context;
  const drawer1(this.context, {Key? key}) : super(key: key);
  @override
  State<drawer1> createState() => _drawer1State();
}

class _drawer1State extends State<drawer1> {
  List<bool> index = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  ViewModel? viewmodel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view();
    index = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
  }

  @override
  Widget build(BuildContext context) {
    double widthDrawer = MediaQuery.of(context).size.width * 0.75;
    return SafeArea(
      child: Drawer(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: widthDrawer,
            // color: Colors.black,
            child: ListView(
              //padding: EdgeInsets.all(2.w),
              children: [
                Container(
                  height: 12.5.h,
                  padding: EdgeInsets.all(3.w),
                  width: widthDrawer,
                  // color: Colors.black.withOpacity(0.3),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/splash2.jpg"))
                      // image: NetworkImage(
                      //     'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                      ),
                  child: (userData != null)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CircleAvatar(
                            //   child: ClipOval(
                            //     child: CachedNetworkImage(
                            //       imageUrl: viewmodel?.data?.profileImg ?? '',
                            //       imageBuilder: (context, imageProvider) =>
                            //           Container(
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
                            //           child: CircularProgressIndicator()),
                            //       errorWidget: (context, url, error) =>
                            //           Container(
                            //         color: Colors.white,
                            //       ),
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 7.w,
                            // ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    (userData?.data?.fullname).toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text((userData?.data?.email).toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
                // Divider(color: Colors.black,),

                // Divider(color: Colors.black,),
                Container(
                  color: index[1]
                      ? Color(0xffb4776e6).withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      // color: Color(0xffb4776e6),
                      color: index[1] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    leading: Icon(Icons.travel_explore,
                        // color: Color(0xffb4776e6),
                        color: index[1] ? Color(0xffb4776e6) : Colors.black),
                    title: Text(
                      'My Itinerary',
                      style: TextStyle(
                          // color: Color(0xffb4776e6),
                          color: index[1] ? Color(0xffb4776e6) : Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      setState(() {
                        index[1] = !index[1];
                      });
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => mytrips1()));
                    },
                  ),
                ),
                Container(
                  color: index[2]
                      ? Color(0xffb4776e6).withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      // color: Color(0xffb4776e6),
                      color: index[2] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    leading: Icon(Icons.travel_explore,
                        // color: Color(0xffb4776e6),
                        color: index[2] ? Color(0xffb4776e6) : Colors.black),
                    title: Text(
                      'My Agent',
                      style: TextStyle(
                          // color: Color(0xffb4776e6),
                          color: index[2] ? Color(0xffb4776e6) : Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      setState(() {
                        index[2] = !index[2];
                      });
                      Navigator.of(context).pop();
                      print('You Just Tapped Me !!');
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Myagent()));
                    },
                  ),
                ),
                // Divider(color: Colors.black,),

                // Container(
                //   color:index[2]? Color(0xffb4776e6).withOpacity(0.2): Colors.transparent,
                //   child: ListTile(
                //     trailing: Icon(Icons.arrow_forward_ios,
                //       // color: Color(0xffb4776e6),
                //       color:index[2]? Color(0xffb4776e6) :Colors.black,
                //     ),
                //     leading: Icon(Icons.favorite_border,
                //       // color: Color(0xffb4776e6),
                //       color:index[2]? Color(0xffb4776e6) :Colors.black,
                //     ),
                //     title: Text('My Favourites',style:  TextStyle(
                //         // color: Color(0xffb4776e6),
                //       color:index[2]? Color(0xffb4776e6) :Colors.black,
                //         fontSize: 12.sp,
                //         fontFamily: "Poppins",
                //         fontWeight: FontWeight.w600),),
                //     onTap: () {
                //       setState(() {
                //         index[2] = !index[2];
                //       });
                //       Navigator.of(context).pop();
                //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>favouritelist()));
                //     },
                //   ),
                // ),
                // Container(
                //   color: index[3]
                //       ? Color(0xffb4776e6).withOpacity(0.2)
                //       : Colors.transparent,
                //   child: ListTile(
                //     trailing: Icon(
                //       Icons.arrow_forward_ios,
                //       // color: Color(0xffb4776e6),
                //       color: index[3] ? Color(0xffb4776e6) : Colors.black,
                //     ),
                //     leading: Icon(
                //       Icons.request_page,
                //       // color: Color(0xffb4776e6),
                //       color: index[3] ? Color(0xffb4776e6) : Colors.black,
                //     ),
                //     title: Text(
                //       'My Request Change',
                //       style: TextStyle(
                //           // color: Color(0xffb4776e6),
                //           color: index[3] ? Color(0xffb4776e6) : Colors.black,
                //           fontSize: 12.sp,
                //           fontFamily: "Poppins",
                //           fontWeight: FontWeight.w600),
                //     ),
                //     onTap: () {
                //       setState(() {
                //         index[3] = !index[3];
                //       });
                //       Navigator.of(context).pop();
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => requestlist()));
                //     },
                //   ),
                // ),
                // Divider(color: Colors.black,),
                Container(
                  color: index[4]
                      ? Color(0xffb4776e6).withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      // color: Color(0xffb4776e6),
                      color: index[4] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    leading: Icon(
                      Icons.person,
                      // color: Color(0xffb4776e6),
                      color: index[4] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    title: Text(
                      'Travellers Profile',
                      style: TextStyle(
                          // color: Color(0xffb4776e6),
                          color: index[4] ? Color(0xffb4776e6) : Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      setState(() {
                        index[4] = !index[4];
                      });
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => profile2()));
                    },
                  ),
                ),
                // Divider(color: Colors.black,),
                // Container(
                //   color: index[6]
                //       ? Color(0xffb4776e6).withOpacity(0.2)
                //       : Colors.transparent,
                //   child: ListTile(
                //     trailing: Icon(
                //       Icons.arrow_forward_ios,
                //       // color: Color(0xffb4776e6),
                //       color: index[6] ? Color(0xffb4776e6) : Colors.black,
                //     ),
                //     leading: Icon(
                //       Icons.person,
                //       // color: Color(0xffb4776e6),
                //       color: index[6] ? Color(0xffb4776e6) : Colors.black,
                //     ),
                //     title: Text(
                //       'Travellers Profile',
                //       style: TextStyle(
                //           // color: Color(0xffb4776e6),
                //           color: index[6] ? Color(0xffb4776e6) : Colors.black,
                //           fontSize: 12.sp,
                //           fontFamily: "Poppins",
                //           fontWeight: FontWeight.w600),
                //     ),
                //     onTap: () {
                //       setState(() {
                //         index[6] = !index[6];
                //       });
                //       Navigator.of(context).pop();
                //       print('bye');
                //     },
                //   ),
                // ),
                Container(
                  color: index[5]
                      ? Color(0xffb4776e6).withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      // color: Color(0xffb4776e6),
                      color: index[5] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    leading: Icon(
                      Icons.chat,
                      // color: Color(0xffb4776e6),
                      color: index[5] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    title: Text(
                      'Chat',
                      style: TextStyle(
                          // color: Color(0xffb4776e6),
                          color: index[5] ? Color(0xffb4776e6) : Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      setState(() {
                        index[5] = !index[5];
                      });
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MessagePage()));
                    },
                  ),
                ),
                Container(
                  color: index[7]
                      ? Color(0xffb4776e6).withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      // color: Color(0xffb4776e6),
                      color: index[7] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    leading: Icon(
                      Icons.people,
                      // color: Color(0xffb4776e6),
                      color: index[7] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    title: Text(
                      'Our Partners',
                      style: TextStyle(
                          // color: Color(0xffb4776e6),
                          color: index[7] ? Color(0xffb4776e6) : Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      setState(() {
                        index[7] = !index[7];
                      });
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OurPartners(),
                      ));
                    },
                  ),
                ),
                Container(
                  color: index[8]
                      ? Color(0xffb4776e6).withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      // color: Color(0xffb4776e6),
                      color: index[8] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    leading: Icon(
                      Icons.location_on,
                      // color: Color(0xffb4776e6),
                      color: index[8] ? Color(0xffb4776e6) : Colors.black,
                    ),
                    title: Text(
                      'Book Your Next Trip',
                      style: TextStyle(
                          // color: Color(0xffb4776e6),
                          color: index[8] ? Color(0xffb4776e6) : Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () async {
                      setState(() {
                        index[8] = !index[8];
                      });
                      Navigator.of(context).pop();
                      const url = 'https://www.escapingsolo.com';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ),
                Container(
                  color: index[0]
                      ? Color.fromARGB(250, 230, 71, 71).withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    // trailing: Icon(
                    //   Icons.arrow_forward_ios,
                    //   // color: Color(0xffb4776e6),
                    //   color: index[0] ? Color(0xffb4776e6) : Colors.black,
                    // ),
                    leading: Icon(
                      Icons.login,
                      // color: Color(0xffb4776e6),
                      color: index[0]
                          ? Color.fromARGB(250, 230, 71, 71)
                          : Color.fromARGB(250, 230, 71, 71),
                    ),
                    title: Text((userData == null) ? 'Login' : 'Logout',
                        style: TextStyle(
                            // color: Color(0xffb4776e6),
                            color: index[0]
                                ? Color.fromARGB(250, 230, 71, 71)
                                : Color.fromARGB(250, 230, 71, 71),
                            fontSize: 12.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600)),
                    onTap: () async {
                      setState(() {
                        index[0] = !index[0];
                      });
                      userData == null
                          ? await SaveDataLocal.getDataFromLocal()
                          : await SaveDataLocal.clearUserData();
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => login1()));
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600);
  view() {
    final Map<String, String> data = {};
    data['action'] = "view_profile";
    data['user_id'] = (userData?.data?.uId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewapi(data).then((Response response) async {
          viewmodel = ViewModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewmodel?.status == "1") {
            setState(() {
              // isLoading = false;
            });

            if (kDebugMode) {}
          } else {}
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }
}
