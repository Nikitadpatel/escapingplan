import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:escapingplan/Modal/partnersmodal.dart';
import 'package:escapingplan/screen/profile2.dart';
import 'package:escapingplan/screen/weather.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Provider/authprovider.dart';
import '../widget/buildErrorDialog.dart';
import '../widget/const.dart';
import '../widget/drawer.dart';
import '../widget/locwig.dart';
import 'MessagePage.dart';

class OurPartners extends StatefulWidget {
  const OurPartners({super.key});

  @override
  State<OurPartners> createState() => _OurPartnersState();
}

class Sachen {
  Icon? image;
  String? name;

  Sachen(
    this.image,
    this.name,
  );
}

class _OurPartnersState extends State<OurPartners> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    partnersapi();
  }

  List<Sachen> icons = [
    Sachen(
      Icon(Icons.person, size: 11.w),
      "PROFILE",
    ),
    Sachen(
      Icon(Icons.map_outlined, size: 11.w),
      "MAPS",
    ),
    Sachen(
      Icon(Icons.cloudy_snowing, size: 11.w),
      "WEATHER",
    ),
    Sachen(
      Icon(Icons.message_outlined, size: 11.w),
      "CHAT",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 18.h,
                          // width: 10.h,
                          child: GestureDetector(
                            onTap: () async {
                              String url = partnerdata!.data![index].partnerLink
                                  .toString();
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 16.h,
                                      width: 17.h,
                                      child: CachedNetworkImage(
                                        imageUrl: partnerdata
                                                ?.data?[index].partnerImage ??
                                            '',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.sp),
                                            ),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/profile_pic_placeholder copy.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      child: Flexible(
                                        child: Text(
                                          partnerdata
                                                  ?.data?[index].partnerName ??
                                              '',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    // Flexible(
                                    //   child: Text(
                                    //     partnerdata?.data?[index].partnerLink ?? '',
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: partnerdata == null
                          ? 0
                          : partnerdata?.data?.length ?? 0,
                    ),
                  ),
                  Container(
                    height: 9.h,
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
                                  ? Navigator.of(context)
                                      .push(MaterialPageRoute(
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
                                              builder: (context) =>
                                                  WeatherPage(),
                                            ))
                                          : Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MessagePage()));
                              print(
                                  '========= Why you Tapped ${index}? ========');
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
          ],
        ),
        // child: Container(
        //   alignment: Alignment.centerLeft,
        //   child: GridView.builder(
        //       // shrinkWrap: true,
        //       itemCount:
        //           partnerdata == null ? 0 : partnerdata?.data?.length ?? 0,
        //       itemBuilder: (context, index) {
        //         return Container(
        //           // height: 18.h,
        //           // width: 10.h,
        //           child: GestureDetector(
        //             onTap: () {},
        //             child: Center(
        //               child: Column(
        //                 children: [
        //                   SizedBox(
        //                     height: 16.h,
        //                     width: 17.h,
        //                     child: CachedNetworkImage(
        //                       imageUrl:
        //                           partnerdata?.data?[index].partnerImage ?? '',
        //                       imageBuilder: (context, imageProvider) =>
        //                           Container(
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.all(
        //                             Radius.circular(10.sp),
        //                           ),
        //                           image: DecorationImage(
        //                             image: imageProvider,
        //                             fit: BoxFit.cover,
        //                           ),
        //                         ),
        //                       ),
        //                       placeholder: (context, url) => const Center(
        //                           child: CircularProgressIndicator()),
        //                       errorWidget: (context, url, error) => Image.asset(
        //                           'assets/profile_pic_placeholder copy.png'),
        //                     ),
        //                   ),
        //                   Container(
        //                     child: Flexible(
        //                       child: Text(
        //                         partnerdata?.data?[index].partnerName ?? '',
        //                         textAlign: TextAlign.center,
        //                       ),
        //                     ),
        //                   ),
        //                   Flexible(
        //                     child: Text(
        //                       partnerdata?.data?[index].partnerLink ?? '',
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //       scrollDirection: Axis.horizontal,
        //       gridDelegate:
        //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1)),
      ),
    );
  }

  partnersapi() {
    final Map<String, String> data = {};
    data['action'] = "display_partners";

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().partnerapi(data).then((Response response) async {
          partnerdata = Partnersmodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && partnerdata?.status == "1") {
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
}
