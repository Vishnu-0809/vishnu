import 'dart:io';
import 'package:Veots/screens/verification_forgotpwd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/final_forgot_password.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/pre_register.dart';
import 'package:Veots/screens/reset_password.dart';
import 'package:Veots/widgets/NetworkCheck.dart';
import '../widgets/Requests.dart';
import './display_product_main.dart';

import '../widgets/error.dart';
import '../widgets/send_accept.dart';

bool login_loading = false;
void loginNotification() async {
  int notificatiosLength = 0;
  var not_post;
  SharedPreferences shref = await SharedPreferences.getInstance();

  String contactType = MOB_not_EM! ? 'mobile' : "email";
  not_post = await createAlbum_notification(
      contactType, ID.toString(), DateTime.now().toString());
  List<String> list = not_post!.convert(not_post!.data);
  if (shref.getStringList("data") != null &&
      shref.getStringList("data") != []) {
    List<String> olddata = shref.getStringList("data")!;
    for (int i = 0; i < olddata.length; i++) {
      for (int j = 0; j < list.length; j++) {
        if (olddata[i][6] != list[j][6]) {
          notificatiosLength++;
        }
      }
    }
  } else {
    notificatiosLength = list.length;
    print(notificatiosLength);
  }
  await shref.setInt("expiryLength", notificatiosLength);
  print("neww data");
  shref.remove("data");
  await shref.setStringList("data", list);
  print('-----------------------------------------');
}

void loginWarranty() async {
  int notificatiosLength = 0;
  var not_warr;
  SharedPreferences shref = await SharedPreferences.getInstance();
  String contactType = MOB_not_EM! ? 'mobile' : "email";
  not_warr = await createAlbum_Warranty(
      contactType, ID.toString(), DateTime.now().toString());
  List<String> list = not_warr!.convert(not_warr!.data);
  print("neww data warranty");
  print(list);
  if (shref.getStringList("datawarranty") != null &&
      shref.getStringList("datawarranty") != []) {
    List<String> olddata = shref.getStringList("datawarranty")!;
    for (int i = 0; i < olddata.length; i++) {
      for (int j = 0; j < list.length; j++) {
        if (olddata[i][7] != list[j][7]) {
          notificatiosLength++;
        }
      }
    }
  } else {
    notificatiosLength = list.length;
    print(notificatiosLength);
  }
  await shref.setInt("warrantyLength", notificatiosLength);
  shref.remove("datawarranty");
  await shref.setStringList("datawarranty", list);
  print('-----------------------------------------');
}

String? email;
late bool ActiveConnection;
final id = TextEditingController();
final password = TextEditingController();
final formkey = GlobalKey<FormState>();
bool connectivityResult = true;

bool visible = true;
var credentials;

class Phone_view extends StatefulWidget {
  const Phone_view(
      {super.key, required this.mainLink, required this.location_on});
  final String mainLink;
  final bool location_on;
  @override
  State<Phone_view> createState() => _Phone_viewState();
}

class _Phone_viewState extends State<Phone_view> {
  Albumotpsendforgotpwd? token2;
  AlbumotpsendforgotpwdEmail? token3;
  void send_otp_verify() async {}

  void forgotpwd_function() async {
    if (formkey.currentState!.validate()) {
      RegExp reg = RegExp(r'[0-9]{10}');
      print(id.text);
      print(password.text);
      // CheckUserConnection();
      connectivityResult = await InternetConnectionChecker().hasConnection;
      if (connectivityResult) {
        //   credentials = await createAlbum(name.text, password.text,
        // (name.text.length == 10 && reg.hasMatch(name.text)) ? true : false);
        print("--------------------------------------------------");
        if ((id.text.length == 10 && reg.hasMatch(id.text))) {
          token2 = await createAlbum_otpSendforgotPWd(id.text.toString());
          if (token2!.type == 'success') {
            widget.mainLink == ""
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: ((context) => VerificationForgotPwd(
                            isPhoneNo: true,
                            phoneNum: id.text,
                            Link: widget.mainLink.toString()
                            // ,location_on: widget.location_on,
                            ))),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: ((context) => VerificationForgotPwd(
                              isPhoneNo: true, phoneNum: id.text,
                              Link: widget.mainLink.substring(32).toString(),
                              // location_on: widget.location_on,
                            ))),
                  );
          } else {
            print("Not ------------------------verified");
            final show = SnackBar(
                duration: Duration(seconds: 1, milliseconds: 500),
                content: Text(
                  // token!.message,
                  "Error",
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Color.fromRGBO(72, 72, 72, 0.8),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.25,
                  right: MediaQuery.of(context).size.width * 0.25,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ));
            ScaffoldMessenger.of(context).showSnackBar(show);
          }
        } else if (id.text.contains('@') && id.text.contains('.')) {
          token3 = await createAlbum_otpSendforgotPWdemdail(id.text.toString());
          print(token3);
          if (token3!.type == 'success') {
            widget.mainLink == ""
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: ((context) => VerificationForgotPwd(
                            isPhoneNo: false,
                            phoneNum: id.text,
                            Link: widget.mainLink.toString()
                            // ,location_on: widget.location_on,
                            ))),
                  )

                //

                : Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: ((context) => VerificationForgotPwd(
                              isPhoneNo: false, phoneNum: id.text,
                              Link: widget.mainLink.substring(32).toString(),
                              // location_on: widget.location_on
                            ))),
                  );
          } else {
            print("Not ------------------------verified");
            final show = SnackBar(
                duration: Duration(seconds: 1, milliseconds: 500),
                content: Text(
                  // token!.message,
                  "Error2",
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Color.fromRGBO(72, 72, 72, 0.8),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.25,
                  right: MediaQuery.of(context).size.width * 0.25,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ));
            ScaffoldMessenger.of(context).showSnackBar(show);
          }
        } else {
          final show_net = Show_snack(context, "Please enter your Email/Phone");
          ScaffoldMessenger.of(context).showSnackBar(show_net);
        }
      } else {
        final show_net = Show_snack(context, "Please check your connection");
        ScaffoldMessenger.of(context).showSnackBar(show_net);
      }
    }
  }

  void login_function() async {
    if (formkey.currentState!.validate()) {
      connectivityResult = await InternetConnectionChecker().hasConnection;
      if (connectivityResult) {
        print('connectitiy');
        RegExp reg = RegExp(r'[0-9]{10}');
        bool key =
            (id.text.length == 10 && reg.hasMatch(id.text)) ? true : false;
        print(password.text);
        credentials = await createAlbum(id.text.trim(), password.text, key);
        if (credentials.success) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('token', credentials.token);
          pref.setString('udid', credentials.Udid);
          pref.setString('name', credentials.name);
          pref.setString('id', id.text);
          pref.setString('dob', credentials.dob);
          pref.setString('custId_coupon', credentials.custId_coupon);
          credentials.companyName == null
              ? null
              : pref.setString('companyName', credentials.companyName);
          pref.setString('gender', credentials.gender);

          RegExp reg = RegExp(r'^[0-9]{10}$');
          UDID = credentials.Udid;
          ID = id.text;
          NAME = credentials.name;
          COMNAME = credentials.companyName;
          GENDER = credentials.gender;
          DOB = credentials.dob;
          if ((ID!.length == 10 && reg.hasMatch(ID.toString()))) {
            MOB_not_EM = true;
          } else {
            MOB_not_EM = false;
          }
          print(ID);
          print(GENDER);
          print(NAME);
          print(COMNAME);
          loginNotification();
          loginWarranty();
          SharedPreferences shref = await SharedPreferences.getInstance();
          await shref.setString('notification', "show");
          await Future.delayed(Duration(seconds: 1));

          (widget.mainLink != "" && widget.location_on)
              ? Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: ((context) => DisplayProdMain(
                          subLink: widget.mainLink.substring(32)))),
                  (Route<dynamic> route) => false,
                )
              : Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: ((context) => HomeScreen(
                            first_time: 0,
                            mainLink: widget.mainLink,
                            location_on: widget.location_on,
                          ))),
                  (Route<dynamic> route) => false,
                );

          id.text = '';
          password.text = '';
          setState(() {
            login_loading = false;
          });
        } else {
          setState(() {
            login_loading = false;
          });

          final show = Show_snack(context, credentials.message);
          ScaffoldMessenger.of(context).showSnackBar(show);
        }
      } else {
        setState(() {
          login_loading = false;
        });
        final show_net = Show_snack(context, "Please check your connection");
        ScaffoldMessenger.of(context).showSnackBar(show_net);
      }
    }
  }

  @override
  void initState() {
    visible = true;
    // CheckUserConnection();
  }

  @override
  Widget build(BuildContext context) {
    return (Column(children: [first_half1(context), second_half1(context)]));
  }

  Widget first_half1(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(253, 253, 254, 1)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.025,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 13, bottom: MediaQuery.of(context).size.height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Image.asset(
                      'assets/veots_logo_wo_tl.png',
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Veots",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Medium",
                        fontSize: MediaQuery.of(context).size.width * 0.042,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.red,
                  child: FittedBox(
                    child: Image.asset(
                      'assets/Login.gif',
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.33,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget second_half1(BuildContext context) {
    return Expanded(
      child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
              color: Color.fromRGBO(0, 32, 96, 1)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              FittedBox(
                  child: Text(
                'Login',
                style: TextStyle(
                    fontFamily: "Poppins Medium",
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    // ,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              )),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.00,
              // ),
              FittedBox(
                  child: Text('Sign in to Continue',
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          fontSize: MediaQuery.of(context).size.width * 0.028,
                          color: Colors.white,
                          letterSpacing: 1.2))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Form(
                key: formkey,
                child: Container(
                  margin: EdgeInsets.only(left: 50.h, right: 50.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email/Phone',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Poppins Medium",
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                color: Colors.white,
                                letterSpacing: 1.2)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.007),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: id,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                            contentPadding: EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(35.r)),
                          ),
                          validator: (value) {
                            RegExp reg = RegExp(r'[0-9]{10}');

                            if (value == null || value.isEmpty) {
                              return null;
                            } else if ((!value.contains('@') ||
                                    !value.contains('.')) &&
                                !((value.length == 10 &&
                                    reg.hasMatch(value)))) {
                              return 'Invalid Email/Phone';
                            }
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015),
                        Text('Password',
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Poppins Medium",
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                color: Colors.white,
                                letterSpacing: 1.2)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.007),
                        TextFormField(
                          onChanged: (value) {
                            if (!formkey.currentState!.validate()) {}
                          },
                          obscureText: visible,
                          obscuringCharacter: '*',
                          controller: password,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                // padding: EdgeInsets.only(
                                //     top: MediaQuery.of(context).size.height *
                                //         0.01),
                                iconSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                icon: Icon(
                                  color: Color(0xff4d4c4c),
                                  visible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(35.r)),
                              contentPadding: EdgeInsets.only(
                                left: 20,
                              )),
                          validator: (value) {
                            // RegExp regex =
                            // RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                            // if (value!=null && !regex.hasMatch(value))
                            // {
                            //   return 'enter valid password' ;
                            // }
                          },
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  child: Text('Forgot Password',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins Medium",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.white,
                                          letterSpacing: 1.2)),
                                  onPressed: (() {
                                    print('Phone');
                                    print(MediaQuery.of(context).size.width);
                                    print(MediaQuery.of(context).size.height);

                                    forgotpwd_function();
                                  })),
                            ])
                      ]),
                ),
              ),

              login_loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Poppins Medium",
                            fontSize:
                                MediaQuery.of(context).size.width * 0.035),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 22, 22, 1),
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.38,
                              MediaQuery.of(context).size.height * 0.046)),
                      onPressed: () async {
                        setState(() {
                          login_loading = true;
                        });
                        login_function();
                      }),

              FittedBox(
                child: TextButton(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontFamily: "Poppins Medium",
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            color: Colors.white,
                            letterSpacing: 1.2),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Create a new account',
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.028,
                                  color: Colors.blue,
                                  letterSpacing: 1.2)),
                        ],
                      ),
                    ),
                    onPressed: (() {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: ((context) => Pre_Register_(
                                  Link: widget.mainLink,
                                  location_on: widget.location_on,
                                ))),
                        (Route<dynamic> route) => false,
                      );

                      // Navigator.of(context).pushAndRemoveUntil(
                      //   MaterialPageRoute(
                      //       builder: ((context) => Pre_Register_(
                      //             Link: widget.mainLink,
                      //             location_on: widget.location_on,
                      //           ))),
                      //   (Route<dynamic> route) => false,
                      // );
                    })),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ]),
          )),
    );
  }

  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          ActiveConnection = true;
        });
      } else {
        setState(() {
          ActiveConnection = false;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        ActiveConnection = false;
      });
    }
  }
}
