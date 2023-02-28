import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:escapingplan/Modal/favouritelistmodel.dart';
import 'package:escapingplan/Provider/travelprovider.dart';
import 'package:escapingplan/screen/mytrips1.dart';
import 'package:escapingplan/screen/packegedetail.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/drawer.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

class favouritelist extends StatefulWidget {
  const favouritelist({Key? key}) : super(key: key);

  @override
  State<favouritelist> createState() => _favouritelistState();
}

class _favouritelistState extends State<favouritelist> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
FavouritelistModel? favouritelistmodel;
  @override
  void initState() {

    super.initState();
    getfavouriteitinery();
    print("length"+(favouritelistmodel?.data?.length).toString());
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "assets/splash2.jpg",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        drawer: drawer1(context),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              margin: EdgeInsets.only(right: 1.h),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'Favourites',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
                fontSize: 16.sp
            ),
          ),
          centerTitle: true,
          // actions: [
          //   GestureDetector(
          //     onTap: () {
          //       _scaffoldKey.currentState?.openDrawer();
          //     },
          //     child: Container(
          //       margin: EdgeInsets.only(right: 1.h),
          //       child: const Icon(
          //         Icons.menu,
          //         color: Colors.white,
          //       ),
          //     ),
          //   )
          // ],
        ),
        body:  Container(
          margin: EdgeInsets.only(top: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child:
                (favouritelistmodel == null ? 0 :favouritelistmodel?.data?.length) ==
                    null
                    ?SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                            'No Favourite yet ',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          )),
                       SizedBox(
                        height: 10.0,
                      ),
                       Center(
                          child: Text(
                            'Tap the Favourite icon on any Itinerary  and \n  we will save it here for you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white),
                          )),
                       SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.w),
                        child: Container(
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700,
                                offset: Offset(0, 20),
                                blurRadius: 20,
                                spreadRadius: -5,
                              ),
                            ],
                            // border: Border.all(color: Colors.white,width: 1.0)
                          ),
                          height: 50.0,
                          child: TextButton(
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              // backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 1.h),
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.sp),
                                  )),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => mytrips1(),
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Explore",
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14.sp,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
                    : Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  child: ListView.builder(
                    itemCount:favouritelistmodel?.data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:  EdgeInsets.only(
                            top: 10.0, bottom: 10.0),
                        padding:  EdgeInsets.only(left: 10.0,right: 10.0,
                            top: 10.0, bottom: 10.0),
                        // height: 110.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.sp),
                          ),
                          // color: Colors.grey.shade200,
                          color: Colors.white,
                        ),

                        // margin: EdgeInsets.only(right: 1.h, bottom: 1.h),
                        child: GestureDetector(
                          onTap: () async {
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      packagedetail(iid:favouritelistmodel
                                          ?.data?[index]
                                          .itineraryId),
                                ));
                            // getfavouriteitinery();
                          },
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15.w,
                                width: 15.w,
                                // height: 18.h,
                                // width: 17.h,
                                child: CachedNetworkImage(
                                  imageUrl: favouritelistmodel
                                          ?.data?[index]
                                          .images?[0] ??
                                      '',
                                  imageBuilder:
                                      (context, imageProvider) =>
                                          Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.sp),
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                       Center(
                                          child:
                                              CircularProgressIndicator()),
                                  errorWidget:
                                      (context, url, error) =>
                                          Container(
                                    color: Colors.grey,
                                    // child: Image.network("https://unsplash.com/photos/bMIlyKZHKMY"),
                                  ),
                                ),
                              ),
                              SizedBox(width:3.w),
                              Expanded(
                                child: Container(
                                  height: 20.w,
                                  width: 43.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        favouritelistmodel
                                            ?.data?[index].title ??
                                            '',
                                        textAlign: TextAlign.center,
                                        style:  TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                        // textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      Text(
                                        favouritelistmodel
                                            ?.data?[index].subtitle ??
                                            '',
                                        textAlign: TextAlign.center,
                                        style:  TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Lato",
                                            fontSize: 14.0),
                                        // textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width:3.w),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            packagedetail(iid:favouritelistmodel
                                                ?.data?[index]
                                                .itineraryId),
                                      ));
                                },
                                child: Container(
                                  height: 10.w,
                                  width: 20.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20.0)
                                  ),
                                
                                  child: Text("View",style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins"
                                  ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    // gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
  getfavouriteitinery(){
    checkInternet().then((internet) async {
      if (internet) {
        travelprovider().favouritelist({
          'user_id': userData?.data?.uId ?? '',
          'action': 'favourite_list'
        }).then((Response response) async {
          favouritelistmodel   = FavouritelistModel.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && favouritelistmodel?.status == "1") {

            setState(() {

            });
          } else {
            setState(() {

            });
          }
        }).catchError((onError) {
          setState(() {

          });
          // buildErrorDialog(context, 'Error', 'Something went wrong');
        });
      } else {
        setState(() {

        });
        buildErrorDialog(context, 'Error', 'Internet Required');
      }
    });
  }

}