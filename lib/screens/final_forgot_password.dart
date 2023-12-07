import 'package:flutter/material.dart';
import 'package:Veots/screens/verification_forgotpwd.dart';
import 'package:Veots/widgets/send_accept.dart';

import '../widgets/Requests.dart';
import 'constants.dart';
import 'login.dart';

class Forgot_password extends StatefulWidget {
  const Forgot_password({super.key,
  required this.isPhoneNo
  ,required this.main_Link,
  required this.phoneNum});
  final bool isPhoneNo;
final String main_Link;

final String phoneNum;
  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {



// bool register_loading=false;


final new_password = TextEditingController();
final confirm_password = TextEditingController();
final new_formkey = GlobalKey<FormState>();
final confirm_formkey = GlobalKey<FormState>();
final formkey= GlobalKey<FormState>();
bool visible_new =true;
bool visible_confirm =true;
  Album_reset? token3;
// Album_reset? token;
// Albumotpsendforgotpwd? token2;
 void verify () async
 {
  if (formkey.currentState!.validate() ){
    // token=await createAlbum_reset(123, widget.phoneNum.toString(), confirm_password.text) ;
   // token2 = await createAlbum4(widget.Username, widget.password,
      //     widget.gender, IsPhoneNo, widget.phoneNum, v1);
      token3=await createAlbum_reset(123,widget.isPhoneNo, widget.phoneNum.toString(),confirm_password.text);
      print(widget.phoneNum.toString());
      print(confirm_password.text);
      print(token3!.status);
      print("the above is the response of change pwd api");
      if (token3!.status==200) //register successful
      {
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.setString('udid', v1);
        // pref.setString('name', widget.Username);
        // pref.setString('id', widget.phoneNum);
        // UDID=v1;
        // MOBILE=widget.phoneNum;
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => HomeScreen(first_time: 1,),
        //   ),
        // );
         Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: ((context) =>Login(mainLink: widget.main_Link,location_on: true,))),
                                      (Route<dynamic> route) => false,
                                      );
      } else if(token3!.status==400)
      {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Password Change Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Password change was unsuccessful'),
              );
            });
      }
      else if(token3!.status==11000){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  " Error",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                content: Text('Password change was unsuccessful'),
              );
            });
      }
      else if(token3!.status==500){
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
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop(
              MaterialPageRoute(
                  builder: ((context) => Login(mainLink:widget.main_Link ,location_on: true,) )),
            );
            return true;
          },
      child:Scaffold(
        body:Stack(
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
            
            child:
            Container(
              color: Colors.transparent,
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
          
                  margin: EdgeInsets.only(left:30,right: 30,top: 20),
                   child: CircleAvatar(
                              // radius:MediaQuery.of(context).size.width*0.048 ,
                              backgroundColor: Color(0xff002060),
                              child:  IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                                builder: ((context) => Login(mainLink:widget.main_Link , location_on: true,) )),
                            
                          );
                        },
                        icon: Icon(
                              Icons.chevron_left,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Colors.white,
                              
                            ),
                        ),
                            ),
                 ),
            
                SizedBox(height: MediaQuery.of(context).size.height*0.05),
                // Container(
                //       margin: EdgeInsets.only(left:30,right: 30),
                //         // color: Colors.blue,
                //         // width: MediaQuery.of(context).size.width / 2.5,
                //         child: FittedBox(
                //           child: Text(
                //             "Thank you, ${NAME}",
                //             style: TextStyle( color: Colors.white,
                //             fontSize: MediaQuery.of(context).size.width*0.06,
                //             fontFamily: "Poppins Medium"),
                //           ),
                //         ),
                      



                // ),
                    
                   Container(
                      margin: EdgeInsets.only(left:30,right: 30),
                        // color: Colors.blue,
                        // width: MediaQuery.of(context).size.width / 2.5,
                        child: FittedBox(
                          child: Text(
                            "Reset your Password",
                            style: TextStyle( color: Colors.white,
                             fontSize: MediaQuery.of(context).size.width*0.06,
                            fontFamily: "Poppins Medium"),
                          ),
                        ),
                      
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.025),
                 Container(
                      margin: EdgeInsets.only(left:30,right: 30),
                        // color: Colors.blue,
                        // width: MediaQuery.of(context).size.width / 2.5,
                        child: FittedBox(
                          child: Text(
                            "Must be at least 8 characters",
                            style: TextStyle( color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width*0.035,
                            fontFamily: "Poppins Medium"),
                          ),
                        ),
                      
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.043),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("assets/4_cropped.png"),
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width *0.9,
                        ),
                    ],
                  ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.043),
                    Form(
                      key: formkey,
                      child:Column(
                        children: [
                           Container(
                      margin: EdgeInsets.only(left:30,right: 30),
                      child: TextFormField(
                        key:new_formkey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                onChanged: (value) {
                                  if (!new_formkey.currentState!.validate()) {
                                    
                                  }
                                },
                                                  //  autovalidateMode: AutovalidateMode.onUserInteraction,
                         validator: (value){
                              String res='';
                              RegExp complete=RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                              RegExp upper = RegExp(r'(?=.*[A-Z])');
                              RegExp lower = RegExp(r'(?=.*[a-z])');
                              RegExp digit = RegExp(r'(?=.*[0-9])');
                              RegExp special = RegExp(r'(?=.?[!@#\$&~])');
                              if(value!.isNotEmpty){
                              if (!upper.hasMatch(value))
                              {
                                res=res+'should contain at least one upper case';
                              }
                              if(!lower.hasMatch(value))
                              {
                                res=res+'\nshould contain at least one lower case';
                              }
                              if(!digit.hasMatch(value))
                              {
                                res=res+'\nshould contain at least one digit';
                              }
                              if(!special.hasMatch(value))
                              {
                                res=res+'\nshould contain at least one Special character';
                              }
                              if(value.length<8)
                              {
                                res=res+'\nMust be at least 8 characters in length';

                              }
                              }

                              if (!complete.hasMatch(value) && value.isNotEmpty) {
                                    //  text_color_pass=Colors.red;
                                   return  res==''?null:res ;
                               
                                  }
                                  else if(value.isEmpty)
                                  {
                                    return "Please enter password";
                                  }
                                  else{
                                      // text_color_pass=Color(0xff4d4c4c);
                                    return null;
                                
                                  }
                           
                          },
                                obscureText: visible_new,
                                controller: new_password,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                    MediaQuery.of(context).size.width * 0.04),
                                decoration: InputDecoration(
                                  hintText: "New Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xffdfdfdf)
                                  ),
                                filled: true,
                                fillColor: Colors.white,
                                    suffixIcon: IconButton(
                                      
                                      // padding: EdgeInsets.only(
                                      //     top: MediaQuery.of(context).size.height *
                                      //         0.01),
                                      iconSize:
                                          MediaQuery.of(context).size.width * 0.05,
                                      icon: Icon(
                                        color: Colors.black,
                                        visible_new
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                          
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          visible_new = !visible_new;
                                        }
                                        );
                                      },
                                    ),
                                border:OutlineInputBorder(borderSide:BorderSide.none,
                                 borderRadius: BorderRadius.circular(10) ),
                                    contentPadding: EdgeInsets.only(
                                      left: 20,
                                   
                                    )
                                    ),
                             
                              ),
                             ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.025),
                              Container(
                      margin: EdgeInsets.only(left:30,right: 30),
                      child: TextFormField(
                                key:confirm_formkey,
                                onChanged: (value) {
                                  if (!confirm_formkey.currentState!.validate()) {}
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                obscureText: visible_confirm,
                                controller: confirm_password,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.04),
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                    color: Color(0xffdfdfdf)
                                  ),

                                filled: true,
                                fillColor: Colors.white,

                                    suffixIcon: IconButton(
                                      
                                      // padding: EdgeInsets.only(
                                      //     top: MediaQuery.of(context).size.height *
                                      //         0.01),
                                      iconSize:
                                          MediaQuery.of(context).size.width * 0.05,
                                      icon: Icon(
                                        color: Colors.black,
                                        visible_confirm
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                          
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          visible_confirm = !visible_confirm;
                                        }
                                        );
                                      },
                                    ),
                                border:OutlineInputBorder(borderSide:BorderSide.none,
                                 borderRadius: BorderRadius.circular(10) ),
                                    contentPadding: EdgeInsets.only(
                                      left: 20,
                                      // top: MediaQuery.of(context).size.height * 0.02,
                                      // bottom: MediaQuery.of(context).size.height*0.01
                                    )
                                    ),
                                validator: (value) {
                                  
                                  if (value==null|| value.isEmpty){
                                      return null ;
                                    }
                                  else if (confirm_password.text!=new_password.text) {
                                  return 'confirm password and new password should be same';
                                  }
                                },
                              ),
                                ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.025),
                          //  SizedBox(
                          //   height: MediaQuery.of(context).size.height / 14,
                          //   width: MediaQuery.of(context).size.width * 0.95,
                          //   child: ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //           primary: Colors.redAccent, //background color of button
                          //           shape: RoundedRectangleBorder(
                          //               //to set border radius to button
                          //               borderRadius: BorderRadius.circular(10)),
                          //           padding:
                          //               EdgeInsets.all(10)), //content padding inside button)
                          //       onPressed: () {},
                          //       child: Text(
                          //         'Reset Password',
                          //         style: TextStyle(fontSize: 18),
                          //       )),
                          // ),
                          Container(
                            margin: EdgeInsets.only(left:30,right: 30),
                                  width: MediaQuery.of(context).size.width*0.95,
                                  height: MediaQuery.of(context).size.height / 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular((10)),
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
                                        "RESET PASSWORD",
                                        style: TextStyle(color: Colors.white,
                                        letterSpacing: 2),
                                      ),
                                    ),
                                  ),
                                ),
                        ]) ,),
                    
                ]),
            )
             ,)
          ],
        )
        )
    ));
  }
}