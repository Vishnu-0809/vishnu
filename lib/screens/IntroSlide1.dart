import 'dart:io';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
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

class IntroSlider extends StatefulWidget {
  IntroSlider(
      {super.key,
      
      // required this.password,
   
      // required this.location_on
      });
  //  final bool location_on;
  // final String password;
 

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  // var uuid = Uuid();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    bool someBooleanValue = true;


    List<String> Heading=["Scan to Verify Authenticity","Expiry check, alerts & Notification","Register the Products","Enjoy rewards on claiming the products","Activate Digital Warranty","Access to Purchase history"];
    List<String> Content=["Scan QR code of our partnered Brands to Verify  product authenticity even before  buying","Provides easy expiry check or alert during purchase and sends you notifications when the product expires, post purchase.","Claim and register purchased products to your name, to access your purchase history anytime , anywhere !!","You may get rewards upon successful registration of products","Say no to storing your warranty cards and paper bills. Activates warranty for the products registered. Save your bills on cloud to access it anytime.","Post purchase, you can access information about product details, expiration dates, and the specifics of your registered products."];
    return Scaffold(
      body:Column(
        children: [
          Stack(
            children: [
              Container(
        // color: Colors.blue,
        height: MediaQuery.of(context).size.height*1,
        child: 
       Stack(

      children: [Container(
         margin: EdgeInsets.symmetric(vertical: 80.0),
        // color: Colors.blue,
        height: MediaQuery.of(context).size.height * 0.80,
        
        child:CarouselSlider.builder(
          // carouselController: _carouselController,
          
          itemCount: 6,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.50,
            disableCenter: true,
            enlargeCenterPage: false,
            // autoPlay: true,
            autoPlayInterval: Duration(seconds: 3, milliseconds: 50),
            reverse: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, i, id) {
            String Advertisement = "assets/Pic" + (i + 1).toString() + ".png";
            return GestureDetector(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                                        },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                      width: MediaQuery.of(context).size.height*0.296,
                      height: MediaQuery.of(context).size.height * 0.30,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          Advertisement,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )

,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Container(
                    // height: MediaQuery.of(context).size.height* 0.0,
                    width: MediaQuery.of(context).size.width*0.8,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1),

                    child: Text(

                      Heading[i],
                   maxLines: 3,
          overflow: TextOverflow.ellipsis,
                      style:   TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.062,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins Medium"
                              ),
                    ),
                  )
                                              ),],
                  )
                  ,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Container(
                    // height: MediaQuery.of(context).size.height* 0.0,
                    width: MediaQuery.of(context).size.width*0.8,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1),

                    child:   Text(
                      Content[i],
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                  )
                                              ),],
                  ),
                
                ],
              ),
              onTap: () {
                // var url = imgList[i];
                // print(url.toString());
              },
            );
          },
        ), 
      ),
      
       Positioned(
        
          bottom: 0, // Adjust the position of the dots as needed
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.height*0.91,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return Container(
                width: 9.0,
                height:9.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.blue : Colors.black,
                ),
              );
            }),
          ),
        ),
      ],
    ),
    ),
    Positioned(
        
          bottom: 0, // Adjust the position of the dots as needed
          left: 0,
          right: 0,
          top:MediaQuery.of(context).size.height*0.70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width ,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                            child: ElevatedButton(
                              onPressed:()async{
                                SharedPreferences preferences = await SharedPreferences.getInstance();
   
                                        preferences.setBool("INTRO",true);
                                        INTRO=true;
                               Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Login(
                                              mainLink: "",location_on: true,
                                            ),
              ),
              (route) => false,
            );
                            
                              } , style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: FittedBox(
                                child: 
                                    Text(
                                  'Get Started',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 13.5,
                                  color: Colors.white
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          ),
            ],
          ),
        ),



            ],
          )
    ,
    
    ],
      )

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
