import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:escapingplan/Modal/ProfileModel.dart';
import 'package:escapingplan/Modal/viewmodel.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
import 'package:escapingplan/widget/extra%20travellers.dart';
import 'package:escapingplan/widget/myprofileage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

class profile2 extends StatefulWidget {
  const profile2({Key? key}) : super(key: key);

  @override
  State<profile2> createState() => _profile2State();
}

class _profile2State extends State<profile2> {
  String? id = "0";
  var filename;

  ProfileModel? profilemodel;

  final _formKey = GlobalKey<FormState>();
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;

  TextEditingController _user = TextEditingController(text: "");
  TextEditingController _gen = TextEditingController(text: "");

  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _phone = TextEditingController(text: "");
  TextEditingController _add = TextEditingController(text: "");
  TextEditingController _expertise = TextEditingController(text: "");
  TextEditingController _emergency_contact = TextEditingController(text: "");
  TextEditingController _additionaltravel = TextEditingController(text: "");
  TextEditingController _date = TextEditingController(text: "");
  String gender = "Male";
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              dividerColor: Colors.black,
              indicatorColor: Colors.black54,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  child: Text(
                    'My Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  child: Text(
                    'Extra Travellers',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  "Profile",
                  style: TextStyle(color: Colors.black),
                ),
                // IconButton(onPressed: (){},
                //     icon: Icon(Icons.edit))
              ],
            ),
            automaticallyImplyLeading: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: 70.h,
                child: TabBarView(
                  children: [Mypage(), ExtraTraveller()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle1 = TextStyle(
      fontFamily: "Poppins",
      fontSize: 10.sp,
      color: Colors.grey,
      fontWeight: FontWeight.w400);
  InputDecoration inputDecoration(
      {required String lable, required Icon icon, required String hinttext}) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
      fillColor: Colors.white,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      filled: true,
      errorStyle: TextStyle(
        color: Colors.red,
      ),
      // hintText: "jjhbf",
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(lable),
      ),
      hintText: hinttext,
      hintStyle: textStyle1,
      labelStyle: TextStyle(fontSize: 12.sp, fontFamily: "Poppins"),
      prefixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
    );
  }

  // profile() {
  //   final Map<String, String> data = {};
  //   data['action'] = "change_profile";
  //   data['user_id'] = (userData?.data?.uId).toString();
  //   data['username'] = _user.text.trim().toString();
  //   data['email'] = _email.text.trim().toString();
  //   data['phone_number'] = _phone.text.trim().toString();
  //   data['gender'] = _gen.toString();
  //   data['expertise'] = _expertise.text.trim().toString();
  //   data['profile_image'] = _pickedFile?.path ?? '';
  //   data['address'] = _add.text.trim().toString();
  //   data['emergency_contact'] = _emergency_contact.text.trim().toString();
  //   data['additional_traveller'] = _additionaltravel.text.trim().toString();
  //   data['date_of_birth'] = _date.text.trim().toString();
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       authprovider().profileapi(data).then((Response response) async {
  //         print(response.body);
  //         profilemodel = ProfileModel.fromJson(json.decode(response.body));
  //         if (response.statusCode == 200 && profilemodel?.status == 1) {
  //           setState(() {
  //             // isLoading = false;
  //           });
  //           if (kDebugMode) {}
  //           buildErrorDialog(context, "", "Profile Updated Successfully");
  //         } else {
  //           // buildErrorDialog(context, "","Invalid login");
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         // isLoading = false;
  //       });
  //       buildErrorDialog(context, 'Error', "Internate Required");
  //     }
  //   });
  // }

  // view() {
  //   final Map<String, String> data = {};
  //   data['action'] = "view_profile";
  //   data['user_id'] = (userData?.data?.uId).toString();
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       authprovider().viewapi(data).then((Response response) async {
  //         viewmodel = ViewModel.fromJson(json.decode(response.body));
  //         if (response.statusCode == 200 && viewmodel?.status == "1") {
  //           setState(() {
  //             // isLoading = false;
  //           });
  //           // await SaveDataLocal.saveLogInData(userData!);
  //           _user.text = viewmodel?.data?.fullname ?? "";
  //           _email.text = (viewmodel?.data?.email) ?? "";
  //           _phone.text = (viewmodel?.data?.phoneno) ?? "";
  //           _add.text = (viewmodel?.data?.address) ?? "";
  //           _expertise.text = (viewmodel?.data?.expertise) ?? "";
  //           _emergency_contact.text = (viewmodel?.data?.emergencyContact) ?? "";
  //           _additionaltravel.text =
  //               (viewmodel?.data?.additionalTraveller) ?? "";
  //           _gen.text = (viewmodel?.data?.gender) ?? "";
  //           _date.text = (viewmodel?.data?.dateOfBirth) ?? "";
  //           // await SaveDataLocal.getDataFromLocal(userData!);
  //           if (kDebugMode) {}
  //           // buildErrorDialog(context, "","Login Successfully");
  //           //
  //           //
  //           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
  //         } else {
  //           // buildErrorDialog(context, "","Invalid login");
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         // isLoading = false;
  //       });
  //       buildErrorDialog(context, 'Error', "Internate Required");
  //     }
  //   });
  // }

  alert() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(2.w),
          // title: new Text('Message'),
          content: Container(
            height: 15.h,
            width: 70.w,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    camera();
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Capture Picture form camera ",
                        style: textStyle1,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(),
                SizedBox(
                  height: 1.h,
                ),
                GestureDetector(
                  onTap: () {
                    gallery();
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.photo),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Choose your picture from gallery",
                        style: textStyle1,
                        maxLines: 2,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  camera() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedFile = File(photo!.path);
    });
  }

  gallery() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedFile = File(photo!.path);
    });
  }

  void myprofile() {}
}
