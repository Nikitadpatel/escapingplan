import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:escapingplan/Modal/ProfileModel.dart';
import 'package:escapingplan/Modal/viewmodel.dart';
import 'package:escapingplan/Provider/authprovider.dart';
import 'package:escapingplan/widget/buildErrorDialog.dart';
import 'package:escapingplan/widget/const.dart';
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
  String? id= "0";
  var filename;
  ViewModel? viewmodel;
  ProfileModel? profilemodel;

  final _formKey = GlobalKey<FormState>();
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;

  TextEditingController _user = TextEditingController(text: "");
  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _phone = TextEditingController(text: "");
  TextEditingController _add = TextEditingController(text: "");
  TextEditingController _expertise = TextEditingController(text: "");
  TextEditingController _emergency_contact = TextEditingController(text: "");
  TextEditingController _additionaltravel = TextEditingController(text: "");
  TextEditingController _date = TextEditingController(text: "");
  String gender = "Male";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    view();
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 25.w,),
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
                        child:(_pickedFile == null)?
                        CircleAvatar(
                          child: ClipOval(
                            child:CachedNetworkImage(
                              imageUrl: viewmodel?.data?.profileImg ?? '',
                              imageBuilder: (context, imageProvider) => Container(
                                height: 28.w,
                                width: 28.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),),
                              placeholder: (context, url) =>  Center(
                                  child: CircularProgressIndicator(color: Colors.black,)),
                              errorWidget: (context, url, error) =>
                                  Container(
                                    color: Colors.white,
                                  ),
                              //     Image.asset('assets/profile_pic_placeholder.png'), height: 28.w,
                              // width: 28.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ):CircleAvatar(
                            radius: 14.w,
                            backgroundImage: Image.file(_pickedFile!).image)

                        // (_pickedFile == null)?CircleAvatar(
                        //   backgroundColor: Colors.transparent,
                        //   backgroundImage: NetworkImage(
                        //     (viewmodel?.data?.profileImg).toString()
                        //     // fit: BoxFit.cover,
                        //   )
                        // )
                        // : CircleAvatar(
                        //   radius: 14.w,
                        //   backgroundImage: Image.file(_pickedFile!).image)
                    ),
                    Positioned(
                        top: 9.h,
                        left: 18.w,
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
                              onPressed: () {
                              alert();
                              },
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
                            hinttext:(viewmodel?.data?.fullname == null)? "Name":_user.text,lable: "User Name",icon: Icon(Icons.person)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
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
                        decoration: inputDecoration(hinttext:(viewmodel?.data?.fullname == null)?"Email":_email.text,lable: "Email Address",icon: Icon(Icons.email_outlined)),
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
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                _date.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          decoration: inputDecoration(icon: Icon(Icons.date_range),
                            lable: "Date of Birth",hinttext: (viewmodel?.data?.dateOfBirth == null)?"Date of Birth":_date.text
                          )),
                      SizedBox(
                        height: 4.h,
                      ),
                      IntlPhoneField(
                        controller: _phone,
                        decoration: inputDecoration(lable: "Phone Number", icon: Icon(null),

                            hinttext: (viewmodel?.data?.phoneno == null)?"Phone Number":_phone.text),
                        // decoration: InputDecoration(
                        //   floatingLabelAlignment: FloatingLabelAlignment.start,
                        //   fillColor: Colors.white,
                        //   filled: true,
                        //   contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                        //   hintText: "Mobile Number",
                        //   hintStyle: textStyle1,
                        //   label: Text("Phone Number"),
                        //   border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                        //     borderSide: const BorderSide(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   focusedBorder: OutlineInputBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                        //     borderSide: const BorderSide(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   // counter: Offstage(),
                        // ),
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
                      Container(
                        child: DropdownButtonFormField<String>(
                          value: "Male",
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                            label: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Gender"),
                            ),
                            prefixIcon: Icon(Icons.perm_contact_cal_outlined),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.sp)),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.sp)),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onChanged: (salutation) =>
                              setState(() => gender = salutation!),
                          validator: (value) {
                            if( value == null){

                              return "Field Required";
                            }
                            print("object");
                            return null;
                          },
                          items: ['Male', 'Female', 'Other']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                        SizedBox(
                          height: 4.h,
                        ),
                      TextFormField(
                        controller: _add,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter the Address";
                          }
                          return null;
                        },
                        decoration: inputDecoration(hinttext:
                        (viewmodel?.data?.address == null)?"Address":_add.text,

                        lable: "Address",icon: Icon(Icons.home)),
                      ),
                      // SizedBox(
                      //   height: 4.h,
                      // ),
                      // TextFormField(
                      //   controller: _expertise,
                      //   keyboardType: TextInputType.text,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Enter the Expertise";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: inputDecoration(hinttext:  (viewmodel?.data?.expertise == null)?"Expertise":_expertise.text,
                      //       lable: "Expertise",icon: Icon(Icons.location_city)),
                      // ),
                      // SizedBox(
                      //   height: 4.h,
                      // ),
                      // TextFormField(
                      //   controller: _emergency_contact,
                      //   keyboardType: TextInputType.phone,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Enter the Emergency Contact Number";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: inputDecoration(hinttext:
                      //   (viewmodel?.data?.emergencyContact == null)?
                      //   "Emergency Contact Number"
                      //       :_emergency_contact.text,
                      //       lable: "Emergency Contact Number",icon: Icon(Icons.location_city)),
                      // ),
                      // SizedBox(
                      //   height: 4.h,
                      // ),
                      // TextFormField(
                      //   controller: _additionaltravel,
                      //   keyboardType: TextInputType.text,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Enter the Additional Traveller";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: inputDecoration(hinttext: (viewmodel?.data?.additionalTraveller == null)?"Additional Traveller":_additionaltravel.text,lable: "Additional Traveller",icon: Icon(Icons.location_city)),
                      // ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              profile();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 40.0,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: Color(0xffb4776e6),
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Text("Save",style: TextStyle(color: Colors.white,fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,fontSize: 12.sp
                                ),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h,)
                    ],
                  ),
                )
              ],
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
  InputDecoration inputDecoration({required String lable,required Icon icon,required String hinttext}) {
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
      labelStyle: TextStyle(fontSize: 12.sp,fontFamily: "Poppins"),
      prefixIcon: icon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide:  BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide:  BorderSide(
          color: Colors.black,
        ),
      ),
    );
  }
  profile(){
      final Map<String, String> data = {
      };
      data['action']="change_profile";
      data['user_id'] = (userData?.data?.uId).toString();
      data['username'] = _user.text.trim().toString();
      data['email'] = _email.text.trim().toString();
      data['phone_number'] = _phone.text.trim().toString();
      data['gender'] = gender.toString();
      data['expertise']=_expertise.text.trim().toString();
      data['profile_image'] = _pickedFile?.path ??'';
      data['address'] = _add.text.trim().toString();
      data['emergency_contact'] = _emergency_contact.text.trim().toString();
      data['additional_traveller'] = _additionaltravel.text.trim().toString();
      data['date_of_birth'] = _date.text.trim().toString();
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().profileapi(data).then((Response response) async {
            print(response.body);
            profilemodel = ProfileModel.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && profilemodel?.status == 1) {
              setState(() {
                // isLoading = false;
              });
              if (kDebugMode) {
              }
              buildErrorDialog(context, "","Profile Updated Successfully");
            }
            else{
              // buildErrorDialog(context, "","Invalid login");
            }
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, 'Error',"Internate Required");
        }
      });
  }
  view(){
    final Map<String, String> data = {
    };
    data['action']="view_profile";
    data['user_id'] = (userData?.data?.uId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewapi(data).then((Response response) async {
          viewmodel = ViewModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewmodel?.status == "1") {
            setState(() {
              // isLoading = false;
            });
            // await SaveDataLocal.saveLogInData(userData!);
            _user.text=viewmodel?.data?.fullname ?? "";
            _email.text=(viewmodel?.data?.email) ?? "";
            _phone.text=(viewmodel?.data?.phoneno) ?? "";
            _add.text=(viewmodel?.data?.address) ?? "";
            _expertise.text=(viewmodel?.data?.expertise) ?? "";
            _emergency_contact.text=(viewmodel?.data?.emergencyContact) ?? "";
            _additionaltravel.text=(viewmodel?.data?.additionalTraveller) ?? "";
            gender = (viewmodel?.data?.gender) ?? "";
            _date.text=(viewmodel?.data?.dateOfBirth) ?? "";
            // await SaveDataLocal.getDataFromLocal(userData!);
            if (kDebugMode) {
            }
            // buildErrorDialog(context, "","Login Successfully");
            //
            //
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
          }
          else{
            // buildErrorDialog(context, "","Invalid login");
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error',"Internate Required");
      }
    });
  }
  alert(){
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
          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black)
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: ()async{

                  camera();
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(width: 2.w,),
                    Text("Capture Picture form camera ",style: textStyle1,maxLines: 2,)
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Divider(),
              SizedBox(height: 1.h,),
              GestureDetector(
                onTap: (){
                  gallery();
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    Icon(Icons.photo),
                    SizedBox(width: 2.w,),
                    Text("Choose your picture from gallery",style: textStyle1,maxLines: 2,)
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
  camera()async{
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedFile = File(photo!.path);
    });
  }
  gallery()async{
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedFile = File(photo!.path);
    });
  }
}
