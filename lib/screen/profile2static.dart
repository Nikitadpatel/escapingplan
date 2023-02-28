
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class profile2static extends StatefulWidget {
  const profile2static({Key? key}) : super(key: key);

  @override
  State<profile2static> createState() => _profile2staticState();
}

class _profile2staticState extends State<profile2static> {
  String gender = "Male";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _country = TextEditingController();
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
      _country.text = "India";
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 0.w,),
              Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
              IconButton(onPressed: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profile2()));
              },
                  icon: Icon(Icons.edit))
            ],
          ),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Stack(
                children: [

                  Container(
                    height: 28.w,
                    width: 28.w,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                      // border: Border.all(color: Colors.grey.shade900,width: 2),
                      // borderRadius: BorderRadius.circular(100.0)
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10.h,
                      left: 52.w,
                      // right: 5.w,
                      child: Container(
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(100.0)),
                        child: Container(
                          height: 8.w,
                          width: 8.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
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

                          decoration: inputDecoration(
                            // icon: Icon(Icons.person)
                            )),
                      SizedBox(height: 1.h),
                      Text(
                        "Email Address",
                        style: textStyle,
                      ),
                      TextFormField(
                          readOnly: true,
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,

                          decoration: inputDecoration(
                            // icon: Icon(Icons.email_outlined),
                             )),
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
                          decoration: inputDecoration(
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
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      // Text(
                      //   "Country",
                      //   style: textStyle,
                      // ),
                      // TextFormField(
                      //     readOnly: true,
                      //     controller: _country,
                      //     keyboardType: TextInputType.text,
                      //
                      //     decoration: inputDecoration(
                      //       // icon: Icon(Icons.person)
                      //     )),
                      // SizedBox(
                      //   height: 1.h,
                      // ),
                      Text(
                        "Gender",
                        style: textStyle,
                      ),
                      TextFormField(
                          readOnly: true,
                          controller: _gender,
                          keyboardType: TextInputType.text,
                          decoration: inputDecoration(
                           )),
                    ]),
              )
            ],
          ),
        ),
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
  InputDecoration inputDecoration(
    // required String hintText,
  ) {
    return InputDecoration(

      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      // hintText: hintText,
      // hintStyle: textStyle1,
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

}
