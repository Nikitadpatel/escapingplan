import 'dart:convert';

import 'package:escapingplan/Modal/ProfileModel.dart';
import 'package:escapingplan/Modal/extramodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../Modal/viewmodel.dart';
import '../Provider/authprovider.dart';
import 'buildErrorDialog.dart';
import 'const.dart';

class ExtraTraveller extends StatefulWidget {
  const ExtraTraveller({super.key});

  @override
  State<ExtraTraveller> createState() => _ExtraTravellerState();
}

class _ExtraTravellerState extends State<ExtraTraveller> {
  TextEditingController _user = TextEditingController(text: '');
  TextEditingController _gen = TextEditingController(text: "Male");

  TextEditingController _email = TextEditingController(text: '');
  TextEditingController _phone = TextEditingController(text: "");
  TextEditingController _add = TextEditingController(text: "");
  TextEditingController _expertise = TextEditingController(text: "");
  TextEditingController _emergency_contact = TextEditingController(text: "");
  TextEditingController _additionaltravel = TextEditingController(text: "");
  TextEditingController _date = TextEditingController(text: "");
  ViewModel? viewmodel;
  ProfileModel? profilemodel;
  bool isLoading = true;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    extraapi();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  TextFormField(
                    controller: _user,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the Name";
                      }
                      return null;
                    },
                    decoration: inputDecoration(
                        hinttext: (extradata?.data?.agent2?.email == null)
                            ? "Name"
                            : _user.text,
                        lable: "Full Name",
                        icon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                          "\\@" +
                          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                          "(" +
                          "\\." +
                          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                          ")+";
                      //Convert string p to a RegEx
                      RegExp regExp = RegExp(p);
                      if (value!.isEmpty) {
                        return 'Please enter Your Email';
                      } else {
                        //If email address matches pattern
                        if (regExp.hasMatch(value)) {
                          return null;
                        } else {
                          //If it doesn't match
                          return 'Email is not valid';
                        }
                      }
                    },
                    decoration: inputDecoration(
                        hinttext: (extradata?.data?.agent1?.email == null)
                            ? "Email"
                            : _email.text,
                        lable: "Email Address",
                        icon: Icon(Icons.email_outlined)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                      controller: _date,
                      readOnly: true,
                      enabled: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Select Birthdate";
                        }
                        return null;
                      },
                      onTap: null,
                      decoration: inputDecoration(
                          icon: Icon(Icons.date_range),
                          lable: "Date of Birth",
                          hinttext: "Date of Birth")),
                  SizedBox(
                    height: 4.h,
                  ),
                  IntlPhoneField(
                    readOnly: true,
                    controller: _phone,
                    decoration: inputDecoration(
                        lable: "Phone Number",
                        icon: Icon(null),
                        hinttext: (extradata?.data?.agent1?.phone == null)
                            ? "Phone Number"
                            : _phone.text),

                    validator: (value) {
                      if (value?.number.length != 10) {
                        return "Enter 10 digit Mobile Number";
                      } else if (value!.number.isEmpty) {
                        return "Enter the  Mobile Number";
                      }
                      return null;
                    },

                    showCountryFlag: false,
                    disableLengthCheck: true,
                    initialCountryCode: "IN",
                    showDropdownIcon: false,
                    // dropdownIconPosition: IconPosition.trailing,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
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

  extraapi() {
    final Map<String, String> data = {};
    data['id'] = ' ${userData?.data?.clientId}';
    data['action'] = 'extra_traveller';
    print(' ${userData?.data?.clientId}' + '================================');
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().extrapartnerapi(data).then((Response response) async {
          extradata = ExtratravModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && extradata?.status == 1) {
            setState(() {
              isLoading = false;
              print(
                  '${extradata?.status} ====================================');
              print('Here');
              _email.text = (extradata?.data?.agent1?.email) ?? "";
              _phone.text = (extradata?.data?.agent1?.phone) ?? "";
              _add.text = (agentdata?.data?.address) ?? "";

              _gen.text = (agentdata?.data?.gender) ?? "";
              _date.text = (extradata?.data?.agent1?.dob) ?? "";
            });

            if (kDebugMode) {}
          } else {
            setState(() {
              isLoading = false;
            });
            print('${extradata?.status} ====================================');
            buildErrorDialog(context, '', "No Extra Travellers");
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
