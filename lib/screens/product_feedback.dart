import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/login.dart';
import 'package:Veots/widgets/send_accept.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/class_models.dart';
import '../widgets/Requests.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'final_forgot_password.dart';

class Product_Feedback extends StatefulWidget {
  Product_Feedback(
    {super.key, required this.snapshot});
 
  final Details snapshot;
  //  final bool location_on;
  // final String password;

  @override
  State<Product_Feedback> createState() => _Product_FeedbackState();
}

class _Product_FeedbackState extends State<Product_Feedback> {
  // var uuid = Uuid();


  TextEditingController content=TextEditingController(text: '');
  int currentIndex = 0;
   bool someBooleanValue = true;
    String Review1="Very Bad";
    String Review2="Bad";
    String Review3="Good";
    String Review4="Very Good";
    String Review5="Excellent";
    String ReviewStringFinal="";
    double ReviewValue=0.0;
  @override
  Widget build(BuildContext context) {

    
    final textScale = MediaQuery.of(context).textScaleFactor;
   
    List<String> Heading = [
      "Scan to Verify Authenticity",
      "Expiry check, alerts & Notification",
      "Register the Products",
      "Enjoy rewards on claiming the products",
      "Activate Digital Warranty",
      "Access to Purchase history"
    ];
    List<String> Content = [
      "Scan QR code of our partnered Brands to Verify  product authenticity even before  buying",
      "Provides easy expiry check or alert during purchase and sends you notifications when the product expires, post purchase.",
      "Claim and register purchased products to your name, to access your purchase history anytime , anywhere !!",
      "You may get rewards upon successful registration of products",
      "Say no to storing your warranty cards and paper bills. Activates warranty for the products registered. Save your bills on cloud to access it anytime.",
      "Post purchase, you can access information about product details, expiration dates, and the specifics of your registered products."
    ];
 updateValue(double rating) {

  setState(() {
    ReviewValue=rating;
  print("qwer"+ReviewValue.toString());
  });
  


}
   

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        // Container(
        //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //   height: 20,
        //   child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        //     IconButton(
        //       padding: EdgeInsets.all(0),
        //       onPressed: () {
        //        print("asdsd");
        //        Navigator.pop(context);
        //       },
        //       icon: Icon(
        //         Icons.close,
        //         size: MediaQuery.of(context).size.width * 0.08,
        //         color: Colors.black,
        //       ),
        //     ),
        //   ]),
        // ),
       
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Product Feedback",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Poppins Medium",
                  color: const Color(0xff002060),
                  // fontStyle: FontStyle.italic,
                  fontSize: MediaQuery.of(context).size.width * 0.058,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          // padding: EdgeInsets.only(top: 500),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12,
          color: Color.fromARGB(255, 201, 196, 196),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width / 3,
                    margin: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: CachedNetworkImage(
                        imageUrl:
                            widget.snapshot.details["imageProd"],
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                  // width: 200,
                  // height: MediaQuery.of(context)
                  //         .size
                  //         .height /
                  //     4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment:
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.03,
                    ),
                    SizedBox(
                      // fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: widget.snapshot.details["prodName"]!=null?Text(
                        widget.snapshot.details["prodName"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          color: const Color(0xff002060),
                          // fontStyle: FontStyle.italic,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                        ),
                      ):Container()
                    ),
                    // SizedBox(height: 8),
                    widget.snapshot.details["brand"]!=null?FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        widget.snapshot.details["brand"],
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          color: Color.fromARGB(255, 123, 119, 119),
                          //  backgroundColor:Color(0x888888),
                          // fontStyle: FontStyle.italic,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                        ),
                      ),
                    ):Container()
                  ]))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
               padding: EdgeInsets.all(10),
              child: Text(
                "Rate the product or service",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Poppins Medium",
                  color: const Color(0xff002060),
                  // fontStyle: FontStyle.italic,
                  fontSize: MediaQuery.of(context).size.width * 0.028,
                ),
              ),
            )
          ],
        ),
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Container(
             padding: EdgeInsets.all(5),
       
            child:  RatingBar.builder(
              
          initialRating: 0,
          itemSize: 30,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print("rating "+rating.toString());
 setState(() {
                ReviewValue = rating;
                if (rating == 1.0) {
                  ReviewStringFinal = Review1;
                }
                 if (rating == 2.0) {
                  ReviewStringFinal = Review2;
                }
                  if (rating == 3.0) {
                  ReviewStringFinal = Review3;
                }
                  if (rating == 4.0) {
                  ReviewStringFinal = Review4;
                }
                  if (rating == 5.0) {
                  ReviewStringFinal = Review5;
                }
              });
              // print(ReviewStringFinal+"gg");

          },
        ),
           ),

          //ReviewValue==0?Container():(ReviewValue==1?Text(Review1):(ReviewValue==2?Text(Review1):ReviewValue==3?Text(Review3):ReviewValue==4?Text(Review4):ReviewValue==5?Text(Review5)))

          if (ReviewValue == 1.0) ...[

             Text(ReviewStringFinal
 ,style: TextStyle(color: Colors.red),),
          ]
          ,
          if (ReviewValue == 2.0) ...[

             Text(ReviewStringFinal
 ,style: TextStyle(color: Colors.orange),),
          ]
          ,
          if (ReviewValue == 3.0) ...[

             Text(ReviewStringFinal
 ,style: TextStyle(color: Colors.green),),
          ]
          ,
          if (ReviewValue == 4.0) ...[

             Text(ReviewStringFinal
 ,style: TextStyle(color: Colors.green),),
          ]
          ,
          if (ReviewValue == 5.0) ...[

             Text(ReviewStringFinal
 ,style: TextStyle(color: Colors.green),),
          ]
                  
                
          
          
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           
            Container(
               padding: EdgeInsets.all(10),
              child: Text(
                "Comments or Feedback",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontFamily: "Poppins Medium",
                  color: const Color(0xff002060),
                  // fontStyle: FontStyle.italic,
                  fontSize: MediaQuery.of(context).size.width * 0.028,
                ),
              ),
            )
          ],
        ),
        
     
        Container(
          // color: Colors.grey,
          margin: const EdgeInsets.all(6.0),
  padding: const EdgeInsets.all(4.0),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromARGB(255, 79, 79, 81))
  ),
          width: MediaQuery.of(context).size.width * 0.95,
          child: TextField(
            controller: content,
            maxLines: 15, //or null
            decoration: InputDecoration.collapsed(
                hintText:
                    "Please provide comprehensive feedback, including as many details as possible.."),
          ),
        )

        ,
        SizedBox(height:20)
        ,Container(
           
         
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: const Color(0xff003296),
                    height: MediaQuery.of(context).size.height / 15,
                    width: 8,
                  ),
                 
                  Column(
                    children: [
                      Row(
                        children: [
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width * 0.065,
                          // ),
                          Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                            child: ElevatedButton(
                              onPressed: ()async {
                                print("ggggggggggggggggg");
                                print(ReviewValue.toInt());
                                print(content.text);
                                 
    final token = await createProductFeedback(
        widget.snapshot.details["prodID"],ReviewValue.toInt(),content.text);
    // final token = await createAlbumPurchaseHistoryDetailsEmail(
    //     "email", "wkhan5776@gmail.com");
    // print(token);
  var responseData = (token.message);
  print("ads"+responseData);
  print(token.statusCode);

  if(token.statusCode==200){
    Navigator.pop(context);
     {
      
            // print("Not ------------------------verified");
            final show = SnackBar(
                duration: Duration(seconds: 1, milliseconds: 500),
                content: Text(
                  // token!.message,
                  "Feedback sent!",
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
    else if(token!.statusCode==404){
       {
            print("Not ------------------------verified");
            final show = SnackBar(
                duration: Duration(seconds: 1, milliseconds: 500),
                content: Text(
                  // token!.message,
                  "Update unsuccessful",
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
            print("Not ------------------------verified");
            final show = SnackBar(
                duration: Duration(seconds: 1, milliseconds: 500),
                content: Text(
                  // token!.message,
                  "Please try again",
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
    // if()
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: FittedBox(
                                child: Text(
                                  'Submit',
                                  style: 
                                  // Theme.of(context).textTheme.bodyMedium,
                                  TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 13.5
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child:  FittedBox(
                                child: Text(
                                  'Cancel',
                                  style: 
                                  // Theme.of(context).textTheme.bodyMedium,
                                  TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 13.5
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      
                    ],
                  ),
                ],
              ),
        )
      ],
      
    ),
        ));
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        // width: MediaQuery.of(context).size.width / 2.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontFamily: "Poppins Medium"),
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
