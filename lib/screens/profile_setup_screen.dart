import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screens/home_page.dart';
import 'package:travel_app/screens/location_permission.dart';
import 'package:travel_app/screens/login_page.dart';
import 'package:travel_app/utils/constance.dart';
import 'package:http/http.dart' as http;

class ProfileSetupPage extends StatefulWidget {
  static const String routeName = '/profile_setup_screen';
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _cityController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool android = false;
  bool isLoading = false;
  String? _imagePath;
  ImageSource _imageSource = ImageSource.camera;
  String? dropdownvalue;
  DateTime? _dateTime;
  //DateTime? _dateTime;
  var items = [
    'Male',
    'Female',
    'Other',
  ];
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: AssetImage(
              "images/4.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Container(
          height: 800.h,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    child: Text(
                      "Almost there !",
                      style: mytextstyle(Colors.white, 30.sp, FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 39.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0.r),
                          child: Container(
                            height: 100.h,
                            width: 100.w,
                            child: _imagePath == null
                                ? CircleAvatar(
                                    backgroundColor: Colors.white70,
                                    radius: 80.r,
                                  )
                                : Image.file(
                                    File(_imagePath!),
                                    width: 100.w,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 1,
                          child: CircleAvatar(
                              child: IconButton(
                                  onPressed: () {
                                    _updateProfileimage();
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.grey,
                                  ))),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintStyle: mytextstyle(
                              Colors.white70, 15.sp, FontWeight.w400),
                          hintText: "Full name",
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintStyle: mytextstyle(
                              Colors.white70, 15.sp, FontWeight.w400),
                          hintText: "Phone",
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () {
                        _showDatePicker();
                      },
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _dateTime == null
                                    ? "Birthday"
                                    : getFormattedDate(
                                        _dateTime!, "dd-MMM-yyyy"),
                                style: TextStyle(
                                    fontSize: _dateTime == null ? 14 : 16,
                                    color: _dateTime == null
                                        ? Colors.white70
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(25)),
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 120,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r)),
                            ),
                            hint: Text(
                              'Gender',
                              style: TextStyle(color: Colors.white70),
                            ),
                            value: dropdownvalue,
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue = value;
                              });
                            },
                            onSaved: (value) {
                              dropdownvalue = value;
                            },
                            items: items
                                .map((status) => DropdownMenuItem(
                                      child: Text(status),
                                      value: status,
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Select Gender';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: 210,
                          child: TextFormField(
                            controller: _cityController,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                hintStyle: mytextstyle(
                                    Colors.white70, 15.sp, FontWeight.w400),
                                hintText: "City",
                                filled: true,
                                fillColor: Colors.white70,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintStyle: mytextstyle(
                              Colors.white70, 15.sp, FontWeight.w400),
                          hintText: "Email",
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                hintStyle: mytextstyle(
                                    Colors.white70, 15.sp, FontWeight.w400),
                                hintText: "Password",
                                filled: true,
                                fillColor: Colors.white70,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r))),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _confirmpasswordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(_obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                hintStyle: mytextstyle(
                                    Colors.white70, 15.sp, FontWeight.w400),
                                hintText: "Confirm Password",
                                filled: true,
                                fillColor: Colors.white70,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28, bottom: 11),
                    child: Row(
                      children: [
                        Text(
                          "What do you prefer?",
                          style:
                              mytextstyle(Colors.white, 15.sp, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 60, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 35.h,
                            width: 91.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white54),
                            child: Center(
                                child: Text(
                              "Mountains",
                              style: mytextstyle(
                                  Colors.white, 15.sp, FontWeight.w400),
                            ))),
                        Container(
                            height: 35.h,
                            width: 61.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white54),
                            child: Center(
                                child: Text(
                              "Rivers",
                              style: mytextstyle(
                                  Colors.white, 15.sp, FontWeight.w400),
                            ))),
                        Container(
                            height: 35.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              "Deserts",
                              style: mytextstyle(
                                  Colors.greenAccent, 15.sp, FontWeight.w400),
                            ))),
                        Container(
                            height: 34.h,
                            width: 46.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              "sea",
                              style: mytextstyle(
                                  Colors.greenAccent, 15.sp, FontWeight.w400),
                            ))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Row(
                      children: [
                        Text(
                          "Enable Location for Better Experience",
                          style:
                              mytextstyle(Colors.white, 15.sp, FontWeight.w500),
                        ),
                        CupertinoSwitch(
                            activeColor: Color(0xff08B464),
                            thumbColor: Colors.white,
                            trackColor: Colors.grey,
                            value: android,
                            onChanged: (value) {
                              setState(() {
                                android = value;
                                determinePosition();
                              });
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                      onPressed: () {
                        register();
                      },
                      child: Text(
                        "Continue",
                        style:
                            mytextstyle(Colors.white, 16.sp, FontWeight.w500),
                      ),
                      color: Color(0xff08BA64),
                      height: 50.h,
                      minWidth: 150.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      "Skip for now",
                      style:
                          mytextstyle(Colors.white70, 14.sp, FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: _imageSource, imageQuality: 60);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        Navigator.pop(context);
      });
    }
  }

  _updateProfileimage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 20,
          content: Text("Please select"),
          actions: [
            ElevatedButton.icon(
              icon: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade100),
              label: Text(
                'Camera',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                _imageSource = ImageSource.camera;
                _pickImage();
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.image,
                color: Colors.black,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade100),
              label: Text(
                'Gallery',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                _imageSource = ImageSource.gallery;
                _pickImage();
              },
            ),
          ],
        );
      },
    );
  }

  register() async {
    if (_formKey.currentState!.validate()) {
      try {
        var uri = "${baseUrl}register";

        var request = http.MultipartRequest("POST", Uri.parse(uri));
        if (_imagePath != null) {
          var img = await http.MultipartFile.fromPath("image", _imagePath!);
          request.files.add(img);
        }
        request.fields["name"] = _nameController.text;
        request.fields["phone"] = _phoneController.text;
        request.fields["email"] = _emailController.text;
        request.fields["gender"] = dropdownvalue!;
        request.fields["password_confirmation"] =
            _confirmpasswordController.text;
        request.fields["password"] = _passwordController.text;
        request.fields["address"] = _cityController.text;
        request.fields["prefer"] = "fgr";
        request.fields["dob"] = _dateTime!.toString();
        var respons = await request.send();

        if (respons.statusCode == 200) {
          // String url = "${baseUrl}register";
          // var map = Map<String, dynamic>();
          // var responce = await http.post(Uri.parse(url), body: map, headers: {
          //   "Accept": "application/json",
          // });
          // var data = jsonDecode(responce.body);
          // SharedPreferences sharedPreferences =
          //     await SharedPreferences.getInstance();
          // sharedPreferences.setString("token", data["token"]);
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
          showInToast("Register Successful");
        } else {
          showInToast("Not Registerd");
        }
      } catch (e) {}
    }
  }

  void _showDatePicker() async {
    final dt = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime.now());
    if (dt != null) {
      setState(() {
        _dateTime = dt;
      });
    }
  }
}
