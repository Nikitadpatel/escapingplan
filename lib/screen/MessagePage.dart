import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:escapingplan/Modal/messagemodel.dart';
import 'package:escapingplan/Modal/viewmodel.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:escapingplan/Provider/travelprovider.dart';
import 'package:escapingplan/screen/mytrips1.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/load.dart';
import 'package:escapingplan/widget/openimage.dart';
import 'package:escapingplan/widget/pdfview.dart';
import 'package:escapingplan/widget/video.dart';
import 'package:escapingplan/widget/videoplayer.dart';
import 'package:escapingplan/widget/webview.dart';
import 'package:escapingplan/widget/webview2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

import 'dart:core';
class MessagePage extends StatefulWidget {
  MessagePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MessagePage> createState() => _MessagePageState();
}
class _MessagePageState extends State<MessagePage> {
  Position? _currentPosition;
  TextEditingController _chat = TextEditingController();
  // final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  bool isLoading =true;
  LocationPermission? permission;
  String? _currentAddress;
  // File? file;
  String? date;
  String? location;
  String? pdfFlePath;
  String? googleMapsUrl;
  var senderid;
  var receiverid;
  var outputDate2 = "";
  var outputDate1;
  String? date2 = "";
  String? data1;
  int? diff;
  String? type;
  final sampleUrl = 'http://www.africau.edu/images/default/sample.pdf';
  ScrollController _scrollController = ScrollController();
  bool? emojiShowing;
  int? count = 0;
  ViewModel? viewmodel;
  MessageModal? messagemodel;
  Future<void> Counter() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      diff;
      outputDate1;
    });
  }

  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      senderid = userData?.data?.uId;
      receiverid = userData?.data?.clientid;
    });
    viewchat();
    // _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
    //
    //   viewchat();
    // });
    view();
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      scaffold: Scaffold(
          backgroundColor: Colors.white,
          // backgroundColor: Color(0xffb4776e6),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              toolbarHeight: 10.h,
              elevation: 0.0,
              // backgroundColor: Colors.white,
              backgroundColor: Color(0xffb4776e6),
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => mytrips1()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 22.sp,
                ),
              ),
              titleSpacing: 0,
              title: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 7.w,
                        child: ClipOval(
                          child: (userData?.data?.clientimage != "" )?Image.network(
                              userData?.data?.clientimage ?? "",
                            fit: BoxFit.fitWidth,
                            width: 14.w,
                            height: 14.w,
                          ):Image.asset("assets/profile_pic_placeholder.png", fit: BoxFit.cover,
                            width: 14.w,
                            height: 14.w,)
                        ),
                      ),
                      Positioned(
                        top: 10.w,
                        left: 11.w,
                        child: Container(
                          height: 3.w,
                          width: 3.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        userData?.data?.clientname ?? "",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: "Poppins"),
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Online",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontFamily: "Poppins"),
                            ),
                          ])
                    ],
                  ),
                  // SizedBox(width: 42.w,),
                  // Image.asset("assets/dots.png",height: 20.0,width: 20.0,)
                ],
              )),
            ),
          ),
          body: isLoading?Container():SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 79.5.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // color:Colors.yellow,
                      // color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          height: 79.5.h,
                          child: ((messagemodel?.data?.length ?? 0 ) == 0)
                                  ? SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // Center(
                                          //     child: CircularProgressIndicator(
                                          //       color:Colors.black
                                          //     )
                                              Text(
                                            'No Message ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
                                          )

                                        ],
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: ListView.builder(
                                            reverse: true,
                                            shrinkWrap: true,
                                            controller: _scrollController,
                                            itemCount:
                                                messagemodel?.data?.length,
                                            itemBuilder: (context, index) {
                                              bool showSeparator = false;
                                              var outputFormat2 =
                                                  DateFormat('dd/MM/yyyy');
                                              var outputFormat1 =
                                                  DateFormat("dd");
                                              DateTime parseDate = DateFormat(
                                                      "yyyy-MM-dd hh:mm:ss")
                                                  .parse(messagemodel
                                                          ?.data?[index].date ??
                                                      "");

                                              if (index <
                                                  (messagemodel!.data!.length -
                                                      1)) {
                                                var outputFormat2 =
                                                    DateFormat('dd/MM/yyyy');
                                                DateTime parseDate1 = DateFormat(
                                                        "yyyy-MM-dd hh:mm:ss")
                                                    .parse(messagemodel
                                                            ?.data?[index + 1]
                                                            .date ??
                                                        "");
                                                var inputDate1 = DateTime.parse(
                                                    parseDate1.toString());
                                                outputDate2 = outputFormat2
                                                    .format(inputDate1);
                                              }
                                              var inputDate = DateTime.parse(
                                                  parseDate.toString());
                                              var outputFormat =
                                                  DateFormat(' hh:mm a');
                                              var outputDate = outputFormat
                                                  .format(inputDate);
                                              outputDate1 = outputFormat2
                                                  .format(inputDate);
                                              date2 = outputFormat1
                                                  .format(inputDate);

                                              diff = (DateTime.now().day) -
                                                  int.parse(date2.toString());
                                              Counter();

                                              // outputDate2 = outputFormat2.format(inputDate);
                                              if (outputDate1 != outputDate2) {
                                                showSeparator = true;
                                              } else {
                                                // showSeparator = true;
                                              }
                                              return Column(
                                                children: [
                                                  (showSeparator)
                                                      ? Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 2.h,
                                                            ),
                                                            Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(1
                                                                            .w),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1
                                                                            .w),
                                                                height: 4.h,
                                                                width: 25.w,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.3),
                                                                ),
                                                                child: Text(
                                                                  (diff == 0)
                                                                      ? "Today"
                                                                      : (diff ==
                                                                              1)
                                                                          ? "Yesterday"
                                                                          : outputDate1
                                                                              .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontFamily:
                                                                          "Poppins"),
                                                                )),
                                                          ],
                                                        )
                                                      : Container(),
                                                  (senderid ==
                                                          messagemodel
                                                              ?.data?[index]
                                                              .fromUserId)
                                                      ? Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20.w,
                                                                  right: 3.w,
                                                                  top: 0.h),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                outputDate,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade700,
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal),
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              (messagemodel
                                                                          ?.data?[
                                                                              index]
                                                                          .messageType ==
                                                                      "image")
                                                                  ? Expanded(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .push(MaterialPageRoute(builder: (context) => openimage(imageid: messagemodel?.data?[index].message ?? "")));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          margin: EdgeInsets.only(
                                                                              left: 2.w,
                                                                              top: 2.h,
                                                                              right: 2.w),
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 5.w,
                                                                              vertical: 1.h),
                                                                          width:
                                                                              60.w,
                                                                          height:
                                                                              40.w,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            // color:Colors.grey,
                                                                            color:
                                                                                Color(0xffb4776e6).withOpacity(0.3),
                                                                            borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(20.0),
                                                                                topLeft: Radius.circular(20.0),
                                                                                topRight: Radius.circular(20.0),
                                                                                bottomRight: Radius.circular(0.0)),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            messagemodel?.data?[index].message ??
                                                                                "",
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : (messagemodel
                                                                              ?.data?[
                                                                                  index]
                                                                              .messageType ==
                                                                          "video")
                                                                      ? Expanded(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Player(videoid: messagemodel?.data?[index].message ?? "")));
                                                                            },
                                                                            child: Container(
                                                                                margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                width: 60.w,
                                                                                height: 40.w,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xffb4776e6).withOpacity(0.3),
                                                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                  shape: BoxShape.rectangle,
                                                                                ),
                                                                                child: addVideo(videoid: messagemodel?.data?[index].message ?? "")),
                                                                          ),
                                                                        )
                                                                      : (messagemodel?.data?[index].messageType ==
                                                                              "files")
                                                                          ? Expanded(
                                                                              child: GestureDetector(
                                                                              onTap: () async {
                                                                                final String? url = (messagemodel?.data?[index].message);
                                                                                String fileExtension = path.extension(url!);
                                                                                print(fileExtension.toString());
                                                                                if(fileExtension==".txt"){
                                                                                  Navigator?.of(context).push(MaterialPageRoute(builder: (context)=>webview(data: messagemodel?.data?[index].message,)));


                                                                                }
                                                                                else{
                                                                                  var response = await http.get(Uri.parse((messagemodel?.data?[index].message).toString()));

                                                                                  String fileName = url.toString().split('/').last;
                                                                                  Directory? storageDirectory =Platform.isAndroid ?await getExternalStorageDirectory(): await getDownloadsDirectory();
                                                                                  String directoryPath = storageDirectory!.path;
                                                                                  File file = File('$directoryPath/$fileName');
                                                                                  // Directory directory = await getApplicationDocumentsDirectory();
                                                                                  await file.writeAsBytes(response.bodyBytes);
                                                                                  String filePath = '${storageDirectory.path}/$fileName';
                                                                                  print(filePath.toString());
                                                                                  try {
                                                                                    print("object");
                                                                                    final result = await OpenFile.open(filePath);

                                                                                  } catch (e) {
                                                                                    print(e.toString());
                                                                                  }
                                                                                }


                                                                              },
                                                                              child: Container(
                                                                                  margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                  width: 40.w,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xffb4776e6).withOpacity(0.3),
                                                                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                    shape: BoxShape.rectangle,
                                                                                  ),
                                                                                 child: Text(messagemodel?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.blue.shade700, fontFamily: "Poppins", fontSize: 12.sp)),
                                                                                  ),
                                                                            ))
                                                                          : (messagemodel?.data?[index].messageType == "location")
                                                                              ? Expanded(
                                                                                  child: GestureDetector(
                                                                                    onTap: () async {

                                                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>webview2(data: messagemodel?.data?[index].message,)));
                                                                                    },
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                      width: 40.w,
                                                                                      // height:50.w,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xffb4776e6).withOpacity(0.3),
                                                                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                      child:
                                                                                      // webview2(data:messagemodel?.data?[index].message)
                                                                                      Row(
                                                                                        children: [
                                                                                          Icon(Icons.location_on),
                                                                                          Text("Tap here", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 12.sp)),
                                                                                        ],
                                                                                      )
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              : Expanded(
                                                                                  child: Container(
                                                                                    margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                    width: 40.w,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xffb4776e6).withOpacity(0.3),
                                                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Text(messagemodel?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 12.sp)),

                                                                                  ),
                                                                                )
                                                              // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                                            ],
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 3.w,
                                                                  top: 1.h,
                                                                  right: 10.w),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor: Colors.transparent,
                                                                radius: 5.w,
                                                                child: ClipOval(
                                                                    child: (userData?.data?.clientimage != "" )?Image.network(
                                                                      userData?.data?.clientimage ?? "",
                                                                      fit: BoxFit.fitWidth,
                                                                      width: 10.w,
                                                                      height: 10.w,
                                                                    ):Image.asset("assets/profile_pic_placeholder.png", fit: BoxFit.cover,
                                                                      width: 10.w,
                                                                      height: 10.w,)
                                                                ),
                                                              ),
                                                              // Image.asset(
                                                              //   "assets/profile.png",
                                                              //   height: 7.w,
                                                              //   width: 7.w,
                                                              //   fit: BoxFit
                                                              //       .cover,
                                                              // ),
                                                              (messagemodel
                                                                          ?.data?[
                                                                              index]
                                                                          .messageType ==
                                                                      "image")
                                                                  ? Expanded(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .push(MaterialPageRoute(builder: (context) => openimage(imageid: messagemodel?.data?[index]?.message ?? "")));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          margin: EdgeInsets.only(
                                                                              left: 2.w,
                                                                              top: 2.h,
                                                                              right: 2.w),
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 5.w,
                                                                              vertical: 1.h),
                                                                          width:
                                                                              60.w,
                                                                          height:
                                                                              40.w,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.3),
                                                                            // color: Color(0xffb4776e6).withOpacity(0.3),
                                                                            borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(20.0),
                                                                                topLeft: Radius.circular(20.0),
                                                                                topRight: Radius.circular(20.0),
                                                                                bottomRight: Radius.circular(0.0)),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            messagemodel?.data?[index].message ??
                                                                                "",
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : (messagemodel
                                                                              ?.data?[
                                                                                  index]
                                                                              .messageType ==
                                                                          "video")
                                                                      ? Expanded(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).push(MaterialPageRoute(
                                                                                  builder: (context) => Player(
                                                                                        videoid: messagemodel?.data?[index]?.message,
                                                                                      )));
                                                                            },
                                                                            child: Container(
                                                                                margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                width: 60.w,
                                                                                height: 40.w,
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.grey.withOpacity(0.3),
                                                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                  shape: BoxShape.rectangle,
                                                                                ),
                                                                                child: addVideo(videoid: messagemodel?.data?[index].message ?? "")),
                                                                          ),
                                                                        )
                                                                      : (messagemodel?.data?[index].messageType ==
                                                                              "files")
                                                                          ? Expanded(
                                                                              child: GestureDetector(
                                                                                onTap: () async {
                                                                                  var response = await http.get(Uri.parse((messagemodel?.data?[index].message).toString()));
                                                                                  final String? url = (messagemodel?.data?[index].message);
                                                                                  String fileName = url.toString().split('/').last;
                                                                                  Directory? storageDirectory =Platform.isAndroid ?await getExternalStorageDirectory(): await getDownloadsDirectory();
                                                                                  String directoryPath = storageDirectory!.path;
                                                                                  File file = File('$directoryPath/$fileName');
                                                                                  // Directory directory = await getApplicationDocumentsDirectory();
                                                                                  await file.writeAsBytes(response.bodyBytes);
                                                                                  String filePath = '${storageDirectory.path}/$fileName';
                                                                                  print(filePath.toString());
                                                                                  try {
                                                                                    final result = await OpenFile.open(filePath);
                                                                                  } catch (e) {
                                                                                    print(e.toString());
                                                                                  }

                                                                                  // String fileExtension = path.extension(url!);
                                                                                  // print(fileExtension.toString());
                                                                                  // if(fileExtension==".pdf"){
                                                                                  //   Navigator?.of(context).push(MaterialPageRoute(builder: (context)=>pdfview(data: messagemodel?.data?[index].message,)));
                                                                                  //
                                                                                  // }
                                                                                  // else{
                                                                                  //
                                                                                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>webview(data: messagemodel?.data?[index].message,)));
                                                                                  // }
                                                                                },
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                  width: 40.w,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xffb4776e6).withOpacity(0.3),
                                                                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                    shape: BoxShape.rectangle,
                                                                                  ),
                                                                                  child: Text(messagemodel?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.blue.shade700, fontFamily: "Poppins", fontSize: 12.sp)),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          : (messagemodel?.data?[index].messageType == "location")
                                                                              ? Expanded(
                                                                                  child: GestureDetector(
                                                                                    onTap: () async {

                                                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>webview2(data: messagemodel?.data?[index].message,)));

                                                                                    },
                                                                                    child: Container(
                                                                                        margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                        width: 40.w,
                                                                                        // height:40.h,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.grey.withOpacity(0.3),
                                                                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        child:
                                                                                         // webview2(data: messagemodel?.data?[index].message,))



                                                                                        Row(
                                                                                          children: [
                                                                                            Icon(Icons.location_on),
                                                                                            Text(
                                                                                               "Tap here",
                                                                                                textAlign: TextAlign.left,
                                                                                                style: TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 12.sp)),
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                        ))
                                                                              : Expanded(
                                                                                  child: GestureDetector(
                                                                                    onTap: () async {
                                                                                      String? url = (messagemodel?.data?[index].message).toString();
                                                                                      final uri = Uri.parse(url);
                                                                                      if (await canLaunchUrl(uri)) {
                                                                                        await launchUrl(uri);
                                                                                      } else {
                                                                                        throw 'Could not launch $url';
                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 2.w),
                                                                                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                                                                                      width: 40.w,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Colors.grey.withOpacity(0.3),
                                                                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), bottomRight: Radius.circular(0.0)),
                                                                                        shape: BoxShape.rectangle,
                                                                                      ),
                                                                                      child: Text(messagemodel?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 12.sp)),
                                                                                    ),
                                                                                  ),
                                                                                ),

                                                              // VideoPlayerItem(
                                                              // videoUrl:
                                                              //     messagemodel?.data?[index].message ?? ""

                                                              Text(
                                                                outputDate,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade700,
                                                                    fontFamily:
                                                                        "Poppins",
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                ],
                                              );
                                            },
                                            // gridDelegate:
                                            //     const SliverGridDelegateWithFixedCrossAxisCount(
                                            //         crossAxisCount: 2),
                                          ),
                                        ),
                                        Positioned(
                                            top: 10.0,
                                            left: 30.w,
                                            right: 30.w,
                                            child: Container(
                                                alignment: Alignment.center,
                                                height: 3.h,
                                                width: 20.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                ),
                                                child: Text(
                                                  (diff == 0)
                                                      ? "Today"
                                                      : (diff == 1)
                                                          ? "Yesterday"
                                                          : outputDate1
                                                              .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontFamily: "Poppins"),
                                                )))
                                      ],
                                    ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 1.h,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(bottom: 2.h,top: 2.h,left: 3.w,right: 3.w),
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            _showOuterDialog();
                          },
                          child: Icon(
                            Icons.attach_file_outlined,
                            color: Color(0xff1a54ac),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            height: 40.0,
                            width: 300.0,
                            child: TextField(
                              cursorColor: Colors.black,
                              style: TextStyle(fontFamily: "Poppins"),
                              keyboardType: TextInputType.text,
                              controller: _chat,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.w),
                                filled: true,
                                fillColor: Color(0xffb4776e6).withOpacity(0.1),
                                // border:OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(20.0)
                                // ),
                                hintText: "Type your message....",
                                hintStyle: TextStyle(
                                    fontFamily: "Poppins", fontSize: 12.sp),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff1a54ac),
                                    ),
                                    borderRadius: BorderRadius.circular(50.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50.0)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.emoji_emotions_rounded,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      emojiShowing = !emojiShowing!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        // padding: const EdgeInsets.all(8.0),
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                            color: Color(0xff1a54ac), shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              type = "text";
                              addchat();
                            },
                            icon: Center(
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 6.w,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 2.w,
                      )
                    ],
                  ),
                ),
                // Offstage(
                //   offstage: !emojiShowing,
                //   child: SizedBox(
                //     height: 250,
                //     // child: EmojiPicker(
                //     //     onEmojiSelected: (Category? category, Emoji emoji) {
                //     //       _onEmojiSelected(emoji);
                //     //     },
                //     //     onBackspacePressed: _onBackspacePressed,
                //     //     config: Config(
                //     //         columns: 7,
                //     //         // Issue: https://github.com/flutter/flutter/issues/28894
                //     //         emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                //     //         verticalSpacing: 0,
                //     //         horizontalSpacing: 0,
                //     //         initCategory: Category.RECENT,
                //     //         bgColor: const Color(0xFFF2F2F2),
                //     //         indicatorColor: Colors.blue,
                //     //         iconColor: Colors.grey,
                //     //         iconColorSelected: Colors.blue,
                //     //         // progressIndicatorColor: Colors.blue,
                //     //         backspaceColor: Colors.blue,
                //     //         showRecentsTab: true,
                //     //         recentsLimit: 28,
                //     //         noRecents: const Text(
                //     //           'No Recents',
                //     //           style: TextStyle(fontSize: 20, color: Colors.black26),
                //     //           textAlign: TextAlign.center,
                //     //         ),
                //     //         tabIndicatorAnimDuration: kTabScrollDuration,
                //     //         categoryIcons: const CategoryIcons(),
                //     //         buttonMode: ButtonMode.MATERIAL)),
                //   ),
                // ),
              ],
            ),
          )),
      isLoading: isLoading,
    );
  }

  addchat() {
    print(senderid);
    print(receiverid);
    final Map<String, String> data = {};
    data['from_user_id'] = senderid.toString();
    data['to_user_id'] = receiverid.toString();
    data['message_type'] = type.toString();
    data['message'] = (type == "text")
        ? _chat.text.trim()
        : (type == "location")
            ? location ?? ""
            : _pickedFile?.path ?? "";
    data['status'] = "0";
    data['action'] = 'add_chat';
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().addlist(data).then((Response response) async {
          if (response.statusCode == 200) {
            print(response.body);
            setState(() {
              // isLoading = false;
            });

            // _scrollController.animateTo(
            //     _scrollController.position.minScrollExtent,
            //     duration: Duration(milliseconds: 200),
            //     curve: Curves.easeInOut
            // );
            // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
            viewchat();
            _chat.text = "";

            if (kDebugMode) {}
            // buildErrorDialog(context, "", "Login Successfully");

          } else {
            // buildErrorDialog(context, "", "Invalid login");
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  view() {
    final Map<String, String> data = {};
    data['action'] = "view_profile";
    data['user_id'] = userData?.data?.uId ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewapi(data).then((Response response) async {
          viewmodel = ViewModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewmodel?.status == "1") {
            setState(() {
              // isLoading = false;
            });
            data1 = viewmodel?.data?.profileImg ?? "";
          } else {
            // buildErrorDialog(context, "","Invalid login");
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  viewchat() {
    final Map<String, String> data = {};
    data['from_user_id'] = senderid.toString();
    data['to_user_id'] = receiverid.toString();
    data['action'] = 'view_chat';
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().viewlist(data).then((Response response) async {
          messagemodel = MessageModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && messagemodel?.status == 1) {
            setState(() {
              isLoading = false;
            });

            if (kDebugMode) {}


          } else {
            isLoading = false;

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

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sample.pdf');
    if (await file.exists()) {
      return file.path;
    }
    final response = await http.get(Uri.parse(sampleUrl!));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  selectimage() {
    showDialog(
      context: context,
      builder: (context) {
        return
            // Platform.isAndroid
            AlertDialog(
          title: const Text("From where do you want to take the photo?"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MessagePage()));
                    getimagegallery();
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () {
                    getimagecamera();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        );

      },
    );
  }

  selectvideo() {
    showDialog(
      context: context,
      builder: (context) {
        return
            // Platform.isAndroid
            AlertDialog(
          title: const Text("From where do you want to take the Video?"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MessagePage()));
                    getvideogallery();
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () {
                    getvideocamera();
                    Navigator.of(context).pop();
                    // getImage();
                  },
                )
              ],
            ),
          ),
        );

      },
    );
  }

  getimagecamera() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedFile = File(photo!.path);
    });
    addchat();
  }

  getvideocamera() async {
    XFile? photo = await _picker.pickVideo(source: ImageSource.camera);
    setState(() {
      _pickedFile = File(photo!.path);
    });
    addchat();
  }
  getvideogallery() async {
    XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      _pickedFile = File(photo!.path);
    });
    addchat();
  }
  getimagegallery() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedFile = File(photo!.path);
    });
    addchat();
  }
  getfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        type = "files";
        _pickedFile = File(result.files.single.path.toString());
      });
      addchat();
    } else {
      // User canceled the picker
    }
  }
  getlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best)
          .timeout(const Duration(seconds: 5));
      setState(() {
        _currentPosition = position;
        print(position);
      });
      getaddress();
      return position;
    } catch (e) {
      return null;
    }
  }

  getaddress() async {
    print("object");
    // List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(52.2165157, 6.9437819);

    List<Placemark> placemark = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    Placemark place = placemark[0];
    setState(() {
      print("1234");
      _currentAddress = "${place.locality},${place.postalCode},${place.street}";
    });
  }
  void _showOuterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: new Text('Select from below'),
        content: Container(
          height: 180.0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0.0,
                childAspectRatio: 1.3,
                crossAxisCount: 2,
              ),
              children: [
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      type = "video";
                    });
                    // getvideo();
                    Navigator.of(context).pop();
                    selectvideo();
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.lightBlue),
                        child: Icon(
                          Icons.video_camera_back,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        "video",
                        style:
                            TextStyle(fontSize: 12.sp, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      type = "image";
                    });
                    Navigator.of(context).pop();
                    selectimage();
                    // XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
                    // setState(() {
                    //   _pickedFile = File(photo!.path);
                    // });
                    // addchat();
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.lightBlue),
                        child: Icon(
                          Icons.photo,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        "Image",
                        style:
                            TextStyle(fontSize: 12.sp, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    bool serviceEnabled = await determinePosition();

                    if(serviceEnabled)
                      {
                        Position? position = await getlocation();
                        location =
                      'https://www.google.com/maps/search/?api=1&query=${position?.latitude},${position?.longitude}';
                      print("location" + location.toString());
                      type = "location";
                      addchat();
                      }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.lightBlue),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      Text("Location"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    getfile();
                    Navigator.of(context).pop();
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.lightBlue),
                        child: Icon(
                          Icons.contact_page,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      Text("Document"),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
