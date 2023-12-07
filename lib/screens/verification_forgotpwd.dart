import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/login.dart';
import 'package:Veots/widgets/send_accept.dart';
import '../widgets/Requests.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'final_forgot_password.dart';

class VerificationForgotPwd extends StatefulWidget {
  VerificationForgotPwd(
      {super.key,
      
      // required this.password,
     required this.isPhoneNo,
      required this.phoneNum,
      required this.Link,
      // required this.location_on
      });
  //  final bool location_on;
  // final String password;
  final bool isPhoneNo;
  final String phoneNum;

  final String Link;

  @override
  State<VerificationForgotPwd> createState() => _VerificationForgotPwdState();
}

class _VerificationForgotPwdState extends State<VerificationForgotPwd> {
  // var uuid = Uuid();
  var v1 = Uuid().v1();
  TextEditingController _OTP = TextEditingController();
  String CODE = "";
  Albumotpverifyforgotpwd? token;
  AlbumotpverifyforgotpwdEmail? token5;
Albumotpsendforgotpwd? token2;
AlbumotpsendforgotpwdEmail? token4;
  // bool IsPhoneNo = true;
  Album_reset? token3;

  
  
  void verify() async {



    if(widget.isPhoneNo)
    {
      token = await createAlbum_otpverifyforgotpwd(widget.phoneNum, CODE);
      print("insdie true phone");

    //  Navigator.of(context)
    //             .push(
    //           MaterialPageRoute(
    //             builder: (context) => Verification(),
    //           ),
    //         );
    if (token!.type == 'success') {
      // token2 = await createAlbum4(widget.Username, widget.password,
      //     widget.gender, IsPhoneNo, widget.phoneNum, v1);
     
     
     Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: ((context) => Forgot_password(
                                            isPhoneNo: true,
                                            main_Link: widget.Link,phoneNum:widget.phoneNum,
                                            // location_on:widget.location_on,
                                            ))),
                                  
                                  );
     
     
     //old code for reverse way
      // token3=await createAlbum_reset(123, widget.phoneNum.toString(),widget.password.toString());
    
      // print(token3!.status);
      // print("the above is the response of change pwd api");
      // if (token3!.status==200) //register successful
      // {
      //   // SharedPreferences pref = await SharedPreferences.getInstance();
      //   // pref.setString('udid', v1);
      //   // pref.setString('name', widget.Username);
      //   // pref.setString('id', widget.phoneNum);
      //   // UDID=v1;
      //   // MOBILE=widget.phoneNum;
      //   // Navigator.of(context).push(
      //   //   MaterialPageRoute(
      //   //     builder: (context) => HomeScreen(first_time: 1,),
      //   //   ),
      //   // );
      //    Navigator.of(context).pushAndRemoveUntil(
      //                                 MaterialPageRoute(
      //                                     builder: ((context) =>Login(mainLink: widget.Link))),
      //                                 (Route<dynamic> route) => false,
      //                                 );
      // } else if(token3!.status==400){
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text(
      //             "Password Change Error",
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //           content: Text('Password change was unsuccessful'),
      //         );
      //       });
      // }
      // else if(token3!.status==11000){
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text(
      //             " Error",
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //           content: Text('Password change was unsuccessful'),
      //         );
      //       });
      // }
      // else if(token3!.status==500){
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text(
      //             "Error",
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //           content: Text('Something went wrong!!'),
      //         );
      //       });
      // }

      // // print("Skipped the next Page");
      // // print(token2);
      // // print("token2");
    } else {
      print(token);
      print("token");
      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Verification error",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Verification error",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.of(context).pop();
                                          
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Mobile number or OTP not valid',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          });
      
    }
    }
    else{
      token5 = await createAlbum_otpverifyforgotpwdEmail(widget.phoneNum, CODE);

    //  Navigator.of(context)
    //             .push(
    //           MaterialPageRoute(
    //             builder: (context) => Verification(),
    //           ),
    //         );
    if (token5!.type == 'success') {
      // token2 = await createAlbum4(widget.Username, widget.password,
      //     widget.gender, IsPhoneNo, widget.phoneNum, v1);
     
     
     Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: ((context) => Forgot_password(
                                           isPhoneNo: false,
                                            main_Link: widget.Link,phoneNum:widget.phoneNum,
                                            // location_on: widget.location_on,
                                            ))),
                                  
                                  );
     
     
     //old code for reverse way
      // token3=await createAlbum_reset(123, widget.phoneNum.toString(),widget.password.toString());
    
      // print(token3!.status);
      // print("the above is the response of change pwd api");
      // if (token3!.status==200) //register successful
      // {
      //   // SharedPreferences pref = await SharedPreferences.getInstance();
      //   // pref.setString('udid', v1);
      //   // pref.setString('name', widget.Username);
      //   // pref.setString('id', widget.phoneNum);
      //   // UDID=v1;
      //   // MOBILE=widget.phoneNum;
      //   // Navigator.of(context).push(
      //   //   MaterialPageRoute(
      //   //     builder: (context) => HomeScreen(first_time: 1,),
      //   //   ),
      //   // );
      //    Navigator.of(context).pushAndRemoveUntil(
      //                                 MaterialPageRoute(
      //                                     builder: ((context) =>Login(mainLink: widget.Link))),
      //                                 (Route<dynamic> route) => false,
      //                                 );
      // } else if(token3!.status==400){
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text(
      //             "Password Change Error",
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //           content: Text('Password change was unsuccessful'),
      //         );
      //       });
      // }
      // else if(token3!.status==11000){
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text(
      //             " Error",
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //           content: Text('Password change was unsuccessful'),
      //         );
      //       });
      // }
      // else if(token3!.status==500){
      //   showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text(
      //             "Error",
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //           content: Text('Something went wrong!!'),
      //         );
      //       });
      // }

      // // print("Skipped the next Page");
      // // print(token2);
      // // print("token2");
    } else {
      print(token5);
      print("token");
      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Verification error",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Verification error",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.of(context).pop();
                                          
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Email or OTP not valid',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          });
      
    }
    }
  }
// void initState() {
//     print(v1);
//   }
    void resendcode() async {
    if(widget.isPhoneNo)
    {
      token2 = await createAlbum_otpSendforgotPWd(widget.phoneNum);
    print("ppppppppp");


    if (token!.type == 'success') {
      print("Successful_register");
    } else {
      print('Failure');
    }
    
    }
    token4 = await createAlbum_otpSendforgotPWdemdail(widget.phoneNum);
    print("ppppppppp");


    if (token!.type == 'success') {
      print("Successful_register");
    } else {
      print('Failure');
    }
  }
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    bool someBooleanValue = true;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpeg'), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top:8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    Padding(padding: EdgeInsets.only(left:15)
                    ,child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                         
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF002060),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20)),
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 8,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        )
                      ],
                    ) ,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: buildFittedWidthText(
                                "Type a Verification Code"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: buildFittedWidthText("that we have sent"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: buildFittedWidthText(
                                "Enter your verification code below."),
                          ),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/ver.png"),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 6,
                      // width:MediaQuery.of(context).size.width / 1.3 ,
                      child: OtpTextField(
                        fillColor: Colors.white,
                        fieldWidth: MediaQuery.of(context).size.width / 5.6,
                        filled: true,
                        textStyle: TextStyle(color: Colors.black),
                        borderColor: Colors.white,
                        numberOfFields: 4,
                        borderWidth: 0,
                        autoFocus: true,
                        enabledBorderColor: Colors.white,
                        // borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        borderRadius: BorderRadius.all(Radius.circular(15)),

                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          // CODE=code;
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          CODE = verificationCode;
                          print("------------------");
                          print(CODE);
                          print("------------------");
                        }, // end onSubmit
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width /2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: MediaQuery.of(context).size.width / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((4.0)),
                              color:const Color(0xFF002060),
                            ),
                            child: MaterialButton(
                              // color: Colors.amber,
                              onPressed: (() {
                                verify();
                              }),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "VERIFY NOW",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                      height: MediaQuery.of(context).size.height/50,
                    ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: MediaQuery.of(context).size.width / 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((4.0)),
                                color: Colors.white),
                            child: MaterialButton(
                              // color: Colors.amber,
                              onPressed:() {
                                resendcode();
                              },
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "RESEND CODE",
                                  style: TextStyle(
                                    color: const Color(0xFF761af1),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        // width: MediaQuery.of(context).size.width / 2.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle( color: Colors.white,
            fontFamily: "Poppins Medium"),
          ),
        ),
      );
  Widget buildFittedWidthText2(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(text),
        ),
      );
  Widget buildFittedWidthText3(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 0.1}) {
    final width = MediaQuery.of(context).size.width / 2;
    double val = (width / 2000) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
