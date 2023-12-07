import 'dart:io';
import 'package:Veots/screens/phone_view.dart';
import 'package:Veots/screens/verification_forgotpwd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Veots/screens/pre_register.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/NetworkCheck.dart';
import '../widgets/Requests.dart';
import '../widgets/error.dart';
import '../widgets/send_accept.dart';
import 'constants.dart';
import 'display_product_main.dart';
import 'home_page.dart';
import 'dart:convert';
import 'package:Veots/screens/final_forgot_password.dart';
final formkey = GlobalKey<FormState>();
final id = TextEditingController();
final password = TextEditingController();
bool visible = true;
var credentials;
bool ActiveConnection = false;
bool login_button=true;



class Tab_view extends StatefulWidget {
  const Tab_view({super.key, required this.mainLink,required this.location_on});
    final bool location_on;
  final String mainLink;
  @override
  State<Tab_view> createState() => _Tab_viewState();
}

class _Tab_viewState extends State<Tab_view> {
  Albumotpsendforgotpwd? token2;
  AlbumotpsendforgotpwdEmail? token3;
  void forgotpwd_function() async {
    if (formkey.currentState!.validate()) {
      RegExp reg = RegExp(r'[0-9]{10}');
      print(id.text);
      print(password.text);
      // CheckUserConnection();
     connectivityResult = await InternetConnectionChecker().hasConnection;
      if (connectivityResult)
    {

          //   credentials = await createAlbum(name.text, password.text,
          // (name.text.length == 10 && reg.hasMatch(name.text)) ? true : false);
      print("--------------------------------------------------");
      if ((id.text.length == 10 && reg.hasMatch(id.text)) ) 
      {
        
        token2= await createAlbum_otpSendforgotPWd(id.text.toString());
          if(token2!.type=='success')
    {
        widget.mainLink == ""?
                                
                                   Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) => VerificationForgotPwd(isPhoneNo:true,phoneNum: id.text,Link:widget.mainLink.toString()
                  // ,location_on: widget.location_on,
                  ) )),
            )

            //
      
                                  :
                                   Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) => VerificationForgotPwd(isPhoneNo:true,phoneNum: id.text,Link:widget.mainLink.substring(32).toString(),
                  // location_on: widget.location_on,
                  ) )),
            );
    }
    else{
      print("Not ------------------------verified");
       final show = SnackBar(
        duration: Duration(seconds: 1,milliseconds: 500),
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
                                  
      } 

      else if (id.text.contains('@') &&  id.text.contains('.'))
          {
        
        token3= await createAlbum_otpSendforgotPWdemdail(id.text.toString());
        print(token3);
          if(token3!.type=='success')
    {
        widget.mainLink == ""?
                                
                                   Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) => VerificationForgotPwd(isPhoneNo:false,phoneNum: id.text,Link:widget.mainLink.toString()
                  // ,location_on: widget.location_on,
                  ) )),
            )

            //
      
                                  :
                                   Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) => VerificationForgotPwd(isPhoneNo:false,phoneNum: id.text,Link:widget.mainLink.substring(32).toString()
                  // ,location_on: widget.location_on
                  ,) )),
            );
    }
    else{
      print("Not ------------------------verified");
       final show = SnackBar(
        duration: Duration(seconds: 1,milliseconds: 500),
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
                                  
      } 
      else {
        
        final show_net= Show_snack(context,"Please enter your Email/Phone");
        ScaffoldMessenger.of(context).showSnackBar(show_net);

       
      }
      
    }
      else{
        
        final show_net= Show_snack(context,"Please check your connection");
        ScaffoldMessenger.of(context).showSnackBar(show_net);
      }
     
    }
  }
  void login_function() async {
    if (formkey.currentState!.validate()) {
      
     

      // CheckUserConnection();
      if (connectivityResult){
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
        credentials.companyName==null? null:pref.setString('companyName',credentials.companyName);
       pref.setString('gender',credentials.gender);
        UDID=credentials.Udid;
        ID=id.text;
        NAME=credentials.name;
        GENDER=credentials.gender;
        COMNAME=credentials.companyName;
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
        SharedPreferences shref=await SharedPreferences.getInstance();
       await  shref.setString('notification',"show");
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
                    builder: ((context) => HomeScreen(first_time: 0,
                    mainLink: widget.mainLink,location_on: widget.location_on,))),
                (Route<dynamic> route) => false,
              );
              id.text = '';
        password.text = '';
             
      } else {
        
          final show=Show_snack(context,credentials.message);
        ScaffoldMessenger.of(context).showSnackBar(show);
      
      }
    }
    else{
       final show_net= Show_snack(context,"Please check your connection");
        ScaffoldMessenger.of(context).showSnackBar(show_net);
      
    }
    
 
    }
  }

  @override
  void initState() {
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [first_half2(context), second_half2(context)]),
    );
  }
Widget first_half2(BuildContext context) {
    return (Container(
        decoration: BoxDecoration(color: Color.fromRGBO(253, 253, 254, 1)),
        margin: EdgeInsets.only(left: 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
                          child: Text("Veots",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Poppins Medium",fontSize:  MediaQuery.of(context).size.width * 0.042, ),),
                        ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: FittedBox(
                    child: Image.asset(
                  'assets/Login.gif',
                     width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.35,
                )),
              ),
            ],
          ),
        )));
  }
  Widget second_half2(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color.fromRGBO(0, 32, 96, 1)),
      child: Column(
        children: [
          const SizedBox(height: 5),
          FittedBox(
            child: Text(
              'Login',
              style: TextStyle(
                 fontFamily: "Poppins Medium",
                  fontSize:MediaQuery.of(context).size.width*0.07,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ),
          FittedBox(
              child: Text('Sign in to Continue',
                  style: TextStyle(
                     fontFamily: "Poppins Medium",
                      fontSize:MediaQuery.of(context).size.width*0.025,
                      color: Colors.white,
                      letterSpacing: 1.2))),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
          ),
          Form(
            key: formkey,
            child: Container(
              margin: EdgeInsets.only(
                left: 60.0, 
               right: 60),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email/Phone',
                        style: TextStyle(
                           fontFamily: "Poppins Medium",
                            fontSize: MediaQuery.of(context).size.width*0.03,
                            color: Colors.white,
                            letterSpacing: 1.2)),
                     SizedBox(height: MediaQuery.of(context).size.height*0.02),
                     
                  
                    TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: id,
                          style: TextStyle(color: Colors.black,
                          
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(
                              left: 13,
                            ),
                             border:OutlineInputBorder(borderSide:BorderSide.none,
                              borderRadius: BorderRadius.circular(35.r) ),
                            errorStyle: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025),
                          ),
                          
                          validator: (value) {
                            RegExp reg = RegExp(r'[0-9]{10}');
                             if (value==null|| value.isEmpty){
                            return null ;
                          }
                          else if ((
                                  !value.contains('@') ||
                                  !value.contains('.')) &&
                              !((value.length == 10 && reg.hasMatch(value)))) {
                            return 'Invalid Email/Phone';
                          }
                          },
                          
                        ),
                     SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    Text('Password',
                        style: TextStyle(
                           fontFamily: "Poppins Medium",
                            fontSize: MediaQuery.of(context).size.width*0.03,
                            color: Colors.white,
                            letterSpacing: 1.2)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.02),
                        TextFormField(
                          obscureText: visible,
                          controller: password,
                          style: TextStyle(color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                              fillColor: Colors.white,
                            
                              suffixIcon: IconButton(
                                iconSize: MediaQuery.of(context).size.height*0.04,                                icon: Icon(
                                  visible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                color: Color(0xff4d4c4c),
                                ),
                                onPressed: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                              ),
                               border:OutlineInputBorder(borderSide:BorderSide.none,
                               borderRadius: BorderRadius.circular(35.r) ),
                              contentPadding:
                                  EdgeInsets.only(left: 15, 
                                  top: MediaQuery.of(context).size.height*0.03,
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
                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          child: Text('Forgot Password',
                              style: TextStyle( fontFamily: "Poppins Medium",
                                  fontSize: MediaQuery.of(context).size.width*0.03,
                                  color: Colors.white,
                                  letterSpacing: 1.2)),
                          onPressed: (() {
                          forgotpwd_function();
                          }
                    )
                    ))])
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          ElevatedButton(
            child: Text(
              'Login In',
              style: TextStyle(
                 fontFamily: "Poppins Medium",fontSize: MediaQuery.of(context).size.width*0.03),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 22, 22, 1),
                minimumSize: Size(
                    MediaQuery.of(context).size.width*0.2, 
                  MediaQuery.of(context).size.height*0.1)
                  ),
            onPressed: () async {
                  
                  login_function();
                  
                }
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.015),
          FittedBox(
            child: TextButton(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                       fontFamily: "Poppins Medium",
                        fontSize: MediaQuery.of(context).size.width*0.03,
                        color: Colors.white,
                        letterSpacing: 1.2),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Create a new account',
                          style: TextStyle(
                             fontFamily: "Poppins Medium",
                              fontSize: MediaQuery.of(context).size.width*0.03,
                              color: Colors.blue,
                              letterSpacing: 1.2)),
                    ],
                  ),
                ),
                onPressed: (() {
                  Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => Pre_Register_(Link:widget.mainLink,
          location_on: widget.location_on,))),
          (Route<dynamic> route) => false,
        );
                })
  
                ),
          ),
        ],
      ),
    );
  }
Future CheckUserConnection() async {
	try {
	final result = await InternetAddress.lookup('google.com');
	if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
		setState(() {
		ActiveConnection = true;
	
		});
	}
  else{
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
