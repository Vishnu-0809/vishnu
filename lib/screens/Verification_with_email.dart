import 'dart:math';
import 'package:Veots/screens/CompanyNameScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:Veots/screens/home_page.dart';
import '../widgets/Requests.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'package:bson/bson.dart';
class VerificationEmail extends StatefulWidget {
  VerificationEmail(
      {super.key,
      required this.Username,
      required this.CompanyName,
      required this.password,
      required this.gender,
      required this.Email,
      required this.Country,
      required this.location_on,
      required this.link,
      required  this.dob,
      });
      final String link;
  final bool location_on;
  final String Username;
  final String CompanyName;
  final String password;
  final String gender;
  final String Email;
  final String Country;
  final String dob;

  @override
  State<VerificationEmail> createState() => _VerificationEmailState();
}

class _VerificationEmailState extends State<VerificationEmail> {
  // var uuid = Uuid();

  bool register_loading=false;
  var v1 = Uuid().v1();
  TextEditingController _OTP = TextEditingController();
  String CODE = "";
 
  Albumotpverify? token;
  
  AlbumPhoneRegister? token2;
  
  Albumotpsend? token3;

  bool IsPhoneNo = false;
  void verify() async {
    token = await createAlbum301(widget.Email, CODE);

    //  Navigator.of(context)
    //             .push(
    //           MaterialPageRoute(
    //             builder: (context) => Verification(),
    //           ),
    //         );
    if (token!.type == 'success') {
      if(widget.CompanyName!="")
      {
        {

          token2 = await createAlbum401(widget.Username,widget.CompanyName, widget.password,
          widget.gender, IsPhoneNo, widget.Email, v1,widget.Country,widget.dob);

      print(token2!.status);
      print("the above is the response of register api");
      if (token2!.status==201) //register successful
      {
        setState(() {
                                  
                                  register_loading=false;
                                });
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('udid', v1);
        pref.setString('name', widget.Username);
            // pref.setString('Companyname', widget.CompanyName);
            pref.setString('custId_coupon',token2!.custId_coupon!);
        pref.setString('id', widget.Email);
        pref.setString('gender',widget.gender);
        pref.setString('companyName', widget.CompanyName);
        pref.setString('dob',widget.dob);
       
        UDID=v1;
        ID=widget.Email;
        NAME=widget.Username;
        GENDER=widget.gender;
        COMNAME=widget.CompanyName;
        MOB_not_EM=false;
        DOB=widget.dob;
        custId_coupon=token2!.custId_coupon;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(first_time: 1,
            location_on: widget.location_on,mainLink:widget.link,),
          ),
        );
        
      } else if(token2!.status==400){
        setState(() {
                                  
                                  register_loading=false;
                                });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Verification Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Verification of user was unsuccessful'),
              );
            });
      }
      else if(token2!.status==11000){
        setState(() {
                                  
                                  register_loading=false;
                                });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Duplication Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Email ID already exists'),
              );
            });
      }
      else if(token2!.status==500){
        setState(() {
                                  
                                  register_loading=false;
                                });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Something went wrong!!'),
              );
            });
      }

      // print("Skipped the next Page");
      // print(token2);
      // print("token2");
    } 
      }
      else{
        {

      token2 = await createAlbum401_2(widget.Username, widget.password,
          widget.gender, IsPhoneNo, widget.Email, v1,widget.Country,widget.dob);

      print(token2!.status);
      print("the above is the response of register api");
      if (token2!.status==201) //register successful
      {
        setState(() {
                                  
                                  register_loading=false;
                                });
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('udid', v1);
        pref.setString('name', widget.Username);
            // pref.setString('Companyname', widget.CompanyName);
            pref.setString('custId_coupon',token2!.custId_coupon!);
        pref.setString('id', widget.Email);
        pref.setString('gender',widget.gender);
        pref.setString('companyName', widget.CompanyName);
        pref.setString('dob',widget.dob);
       
        UDID=v1;
        ID=widget.Email;
        NAME=widget.Username;
        GENDER=widget.gender;
        COMNAME=widget.CompanyName;
        DOB=widget.dob;
        MOB_not_EM=false;
        custId_coupon=token2!.custId_coupon;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(first_time: 1,
            location_on: widget.location_on,mainLink:widget.link,),
          ),
        );
        
      } else if(token2!.status==400){
        setState(() {
                                  
                                  register_loading=false;
                                });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Verification Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Verification of user was unsuccessful'),
              );
            });
      }
      else if(token2!.status==11000){
        setState(() {
                                  
                                  register_loading=false;
                                });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Duplication Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Email ID already exists'),
              );
            });
      }
      else if(token2!.status==500){
        setState(() {
                                  
                                  register_loading=false;
                                });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Something went wrong!!'),
              );
            });
      }

      // print("Skipped the next Page");
      // print(token2);
      // print("token2");
    } 
      }
    }
    else {
      setState(() {
                                  
                                  register_loading=false;
                                });
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
                                'Email ID or OTP not valid',
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
void initState() {
    print(v1);
  }
    void resendcode() async {
    token3 = await createAlbum101(widget.Email);
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
                            Navigator.of(context).pop();
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
                        register_loading?CircularProgressIndicator():  Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: MediaQuery.of(context).size.width / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((4.0)),
                              color:const Color(0xFF002060),
                            ),
                            child: MaterialButton(
                              // color: Colors.amber,
                              onPressed: (() {
                                 setState(() {
                                  
                                  register_loading=true;
                                });
                                verify();
                              }),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "Verify now",
                                  style: TextStyle(color: Colors.white,
                                  // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium"),
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
                                  "Resend code",

                                  style: TextStyle(
                                    color: const Color(0xFF761af1),
                                    // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium"
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
            // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium"),
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
