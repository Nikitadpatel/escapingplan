import 'dart:convert';

import 'package:escapingplan/Modal/agentmodal.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

import '../widget/buildErrorDialog.dart';
import '../widget/const.dart';

class Myagent extends StatefulWidget {
  const Myagent({super.key});

  @override
  State<Myagent> createState() => _MyagentState();
}

class _MyagentState extends State<Myagent> {
  bool isLoading = true;
  TextEditingController _user = TextEditingController(text: '');
  TextEditingController _gen = TextEditingController();

  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _phone = TextEditingController(text: "");
  TextEditingController _add = TextEditingController(text: "");
  TextEditingController _expertise = TextEditingController(text: "");
  TextEditingController _emergency_contact = TextEditingController(text: "");
  TextEditingController _additionaltravel = TextEditingController(text: "");
  TextEditingController _date = TextEditingController(text: "");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    agentapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 00,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Agent Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
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
                    readOnly: true,
                    controller: _user,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the Name";
                      }
                      return null;
                    },
                    decoration: inputDecoration(
                        hinttext: (agentdata?.data?.fullname == null)
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
                        hinttext: (agentdata?.data?.emailAddress == null)
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
                          hinttext: (agentdata?.data?.dateOfBirth == null)
                              ? "Date of Birth"
                              : _date.text)),
                  SizedBox(
                    height: 4.h,
                  ),
                  IntlPhoneField(
                    readOnly: true,
                    controller: _phone,
                    decoration: inputDecoration(
                        lable: "Phone Number",
                        icon: Icon(null),
                        hinttext: (agentdata?.data?.phoneNumber == null)
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
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: _gen,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Give Gender";
                      }
                      return null;
                    },
                    decoration: inputDecoration(
                        hinttext: (agentdata?.data?.address == null)
                            ? "Gender"
                            : _gen.text,
                        lable: "Gender",
                        icon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: _add,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter the Address";
                      }
                      return null;
                    },
                    decoration: inputDecoration(
                        hinttext: (agentdata?.data?.address == null)
                            ? "Address"
                            : _add.text,
                        lable: "Address",
                        icon: Icon(Icons.home)),
                  ),
                ],
              ),
            ),
          ],
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

  agentapi() {
    final Map<String, String> data = {};
    data['client_id'] = ' ${userData?.data?.clientId}';
    data['action'] = 'my_agent';
    print(' ${userData?.data?.clientId}' + '================================');
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().agentapi(data).then((Response response) async {
          agentdata = MyagentModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && agentdata?.status == 1) {
            setState(() {
              isLoading = false;
              _user.text = userData?.data?.clientName ?? "";
              _email.text = (agentdata?.data?.emailAddress) ?? "";
              _phone.text = (agentdata?.data?.phoneNumber) ?? "";
              _add.text = (agentdata?.data?.address) ?? "";

              _gen.text = (agentdata?.data?.gender) ?? "";
              _date.text = (agentdata?.data?.dateOfBirth) ?? "";
            });

            if (kDebugMode) {}
          } else {
            setState(() {
              isLoading = false;
            });
            buildErrorDialog(context, '', "No Agent Data");
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
