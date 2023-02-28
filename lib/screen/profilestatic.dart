

import 'package:escapingplan/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class profilestatic extends StatefulWidget {
  const profilestatic({super.key});

  @override
  State<profilestatic> createState() => _profilestaticState();
}

class _profilestaticState extends State<profilestatic> {
  String select = "Male";
  String gender = "Male";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _gender = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print("hiii");
      _user.text = "Raj";
      _email.text = "abc@gmail.com";
      _date.text = "12-01-2020";
      _phone.text = "12345657890";
      _gender.text = "Male";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Positioned(
              top: 0.h,
              left: 0.w,
              right: 0.w,
              child: Stack(children: [
                Container(
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                      color: Color(0xffb4776e6)
                      // gradient: new LinearGradient(
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //     colors: [
                      //   Color(0xff1a54ac),
                      //   Color.fromARGB(255, 66, 125, 214),
                      //
                      //   //  Color(0xFF1976D2),
                      //   // Color(0xFF42A5F5),
                      // ])
                  ),
                ),
                Positioned(
                    top: 5.h,
                    left: 0.w,
                    right: 0.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => login1()));
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              print("object");
                              // editdata();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => profile()));
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
                Positioned(
                    top: 12.h,
                    left: 10.w,
                    right: 10.w,
                    child: Container(
                        height: 30.w,
                        width: 30.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png"))))),
                Positioned(
                    top: 20.h,
                    left: 25.w,
                    right: 5.w,
                    child: Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ]),
            ),
            Positioned(
                top: 35.h,
                left: 0.w,
                right: 0.w,
                bottom: 0.h,
                child: SingleChildScrollView(
                  child: Container(
                    height: 60.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        color: Colors.white),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: textStyle,
                            ),
                            TextFormField(
                                readOnly: true,
                                controller: _user,
                                keyboardType: TextInputType.text,
                                // validator: (val) {
                                //   if (val!.isEmpty) {
                                //     return "Enter the Name";
                                //   }
                                //   return null;
                                // },
                                decoration: inputDecoration(
                                    // icon: Icon(Icons.person)
                                    hintText: "Name")),
                            SizedBox(height: 1.h),
                            Text(
                              "Email Address",
                              style: textStyle,
                            ),
                            TextFormField(
                                readOnly: true,
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                // validator: (value) {
                                //   String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                                //       "\\@" +
                                //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                                //       "(" +
                                //       "\\." +
                                //       "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                                //       ")+";
                                //   //Convert string p to a RegEx
                                //   RegExp regExp = RegExp(p);
                                //   if (value!.isEmpty) {
                                //     return 'Please enter Your Email';
                                //   } else {
                                //     //If email address matches pattern
                                //     if (regExp.hasMatch(value)) {
                                //       return null;
                                //     } else {
                                //       //If it doesn't match
                                //       return 'Email is not valid';
                                //     }
                                //   }
                                // },
                                decoration: inputDecoration(
                                    // icon: Icon(Icons.email_outlined),
                                    hintText: "Email")),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "Date Of Birth",
                              style: textStyle,
                            ),
                            TextFormField(
                                controller: _date,
                                readOnly: true,
                                enabled: true,
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "Select Birthdate";
                                //   }
                                //   return null;
                                // },
                                // onTap: () async {
                                //   DateTime? pickedDate = await showDatePicker(
                                //       context: context,
                                //       initialDate: DateTime.now(),
                                //       firstDate: DateTime(2000),
                                //       //DateTime.now() - not to allow to choose before today.
                                //       lastDate: DateTime(2101));
                                //   if (pickedDate != null) {
                                //     print(pickedDate);
                                //     String formattedDate =
                                //         DateFormat('dd-MM-yyyy').format(pickedDate);
                                //     print(formattedDate);
                                //     setState(() {
                                //       _date.text = formattedDate;
                                //     });
                                //   } else {
                                //     print("Date is not selected");
                                //   }
                                // },
                                decoration: inputDecoration(
                                  hintText: "Date of birth",
                                  // icon: Icon(
                                  //   Icons.calendar_month_outlined,
                                  // )),
                                )),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "Phone",
                              style: textStyle,
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: _phone,
                              decoration: inputDecoration(
                                hintText: "Mobile Number",
                              ),
                              // validator: (value) {
                              //   if (value?.number.length != 10) {
                              //     return "Enter 10 digit Mobile Number";
                              //   } else if (value!.number.isEmpty) {
                              //     return "Enter the  Mobile Number";
                              //   }
                              //   return null;
                              // },
                              // initialCountryCode: 'IN',
                              // showDropdownIcon: true,
                              // dropdownIconPosition: IconPosition.trailing,
                              // onChanged: (phone) {
                              //   print(phone.completeNumber);
                              // },
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "Gender",
                              style: textStyle,
                            ),
                            TextFormField(
                                readOnly: true,
                                controller: _gender,
                                keyboardType: TextInputType.text,
                                // validator: (val) {
                                //   if (val!.isEmpty) {
                                //     return "Enter the Name";
                                //   }
                                //   return null;
                                // },
                                decoration: inputDecoration(
                                    // icon: Icon(Icons.person)
                                    hintText: "Gender")),
                            // Container(
                            //   child: DropdownButtonFormField<String>(
                            //     value: select,
                            //     decoration: InputDecoration(
                            //         focusedBorder: UnderlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.grey.shade200),
                            //         ),
                            //         enabledBorder: UnderlineInputBorder(
                            //           borderSide:
                            //               BorderSide(color: Colors.grey.shade200),
                            //         )),
                            //     onChanged: (salutation) =>
                            //         setState(() => select = salutation!),
                            //     validator: (value) =>
                            //         value == null ? 'field required' : null,
                            //     items: [
                            //       'Male',
                            //       'Female',
                            //       'Other'
                            //     ].map<DropdownMenuItem<String>>((String value) {
                            //       return DropdownMenuItem<String>(
                            //         value: value,
                            //         child: Text(value),
                            //       );
                            //     }).toList(),
                            //   ),
                            // )
                          ]),
                    ),
                  ),
                ))
          ],
        )),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      fontFamily: "Poppins",
      fontSize: 12.sp,
      color: Colors.grey,
      fontWeight: FontWeight.w400);
  TextStyle textStyle1 = TextStyle(
      fontFamily: "Poppins",
      fontSize: 10.sp,
      color: Colors.grey,
      fontWeight: FontWeight.bold);
  InputDecoration inputDecoration({
    required String hintText,
  }) {
    return InputDecoration(
      // prefixIcon: icon,

      // fillColor: Colors.white,
      // hoverColor: Colors.white,
      // focusColor: Colors.white,
      // filled: true,
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      hintText: hintText,
      hintStyle: textStyle1,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      ),
    );
  }

  editdata() {}
}
