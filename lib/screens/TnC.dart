import 'dart:io';
import 'package:Veots/widgets/ham.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:Veots/screens/cash_back.dart';
import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/no_CB_War.dart';
import 'package:Veots/screens/phone_view.dart';
import 'package:Veots/screens/warranty_bill_upload.dart';

import 'package:Veots/widgets/send_accept.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/class_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;

import '../screens/Notifications_view.dart';
import '../screens/home_page.dart';
import '../screens/product_details.dart';
import '../widgets/not_icon.dart';
// import 'not_icon.dart';

class TnC extends StatefulWidget {
  const TnC({
    super.key,
  });

  @override
  State<TnC> createState() => _TnCState();
}

class _TnCState extends State<TnC> {
  // void initState() {
  //   super.initState();
  //   // () async {
  //   //   await info();
  //   //   setState(() {

  //   //   });
  //   // }();
  //   info();
  // }

  @override
   var _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? mobile;
  // Future info()  {
  //   // SharedPreferences pref = await SharedPreferences.getInstance();
  //   // mobile = pref.getString('id');
  //   print("Mobile from info func:$MOBILE");
  //   return MOBILE;
  // }

  // File? file;
  void initState() {
    // TODO: implement initState
    () async {
      await _write();
      setState(() {
        _write();
      });
    }();

    super.initState();
  }

  _write() async {}

  //  File filenull=ile.writeAsString('');
  bool loading = false;
  Album3? token;
  // Future getData() async {
  // //   final Directory directory = await getApplicationDocumentsDirectory();
  // // final file = File('${directory.path}/my_file.txt');
  // // await file.writeAsString("x");

  //   print(widget.i_value);
  //   print(widget.clientId);
  //   print(widget.batchNo);
  //   String type= MOB_not_EM! ? "mobile" :"email";
  //   token = await createAlbum56(
  //       widget.i_value.toString(), ID!, widget.clientId, widget.batchNo,File(""),LOCATION,widget.link,type);
  //   print(token?.message);
  //   return token;
  // }
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

  final _localAuthentication = LocalAuthentication();
  bool _isUserAuthorized = false;

  Future<void> authenticateUser() async {
    bool isAuthorized = false;
    try {
      isAuthorized = await _localAuthentication.authenticate(
        localizedReason: "Please authenticate to claim product",
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on PlatformException catch (exception) {
      if (exception.code == local_auth_error.notAvailable ||
          exception.code == local_auth_error.passcodeNotSet ||
          exception.code == local_auth_error.notEnrolled) {
        // Handle this exception here.
      }
    }

    if (!mounted) return;

    setState(() {
      _isUserAuthorized = isAuthorized;
      print("enterrrr");
    });
  }

  // late ClaimProd temp;
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: ((context) => HomeScreen(first_time: 0,
                mainLink: '',location_on: true,))),
            (Route<dynamic> route) => false,
          );

          return true;
        },
        child: SafeArea(
            child: Scaffold(
                key: _scaffoldKey,
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Container(
                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
                // margin: EdgeInsets.only(top: 0),
                // color: Colors.red,
                child: Row(
                  children: [
                    Container(
                      // color: Colors.yellow,
                      // alignment: Alignment.bottomRight,
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: IconButton(
                          onPressed: () {
                            // Navigator.of(context).pushAndRemoveUntil(
                            //   MaterialPageRoute(
                            //       builder: ((context) => HomeScreen(
                            //             first_time: 0,
                            //           ))),
                            //   (Route<dynamic> route) => false,
                            // );
                            // Navigator.pop(context);
                            // int count = 0;
                            // Navigator.of(context).pop();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => HomeScreen(
                                        first_time: 0,mainLink: '',location_on: true,
                                      ))),
                              (Route<dynamic> route) => false,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff002060),
                            size: MediaQuery.of(context).size.width * 0.04,
                          )),
                    ),

                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width/15,
                    // ),

                    Container(
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/veots_logo_wo_tl.png',
                           height: MediaQuery.of(context).size.width * 0.09,
                        width: MediaQuery.of(context).size.width * 0.09,
                      ),
                    ),
                    Spacer(),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.45,
                    // ),
                   Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Color(0xff002060),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: FittedBox(
                                    child: IconButton(
                                        onPressed: () {
                                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
                                     (context)=>HomeScreen(first_time: 0,
                                     mainLink: '',location_on: true,)), (route) => false);
                                         },
                                        icon: const Icon(
                                          Icons.home,
                                          color: Colors.white,
                                        ))),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Not_icon(),
                            
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Container(
                              height: MediaQuery.of(context).size.width * 0.07,
                              width: MediaQuery.of(context).size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Color(0xff002060),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: 
                                  InkWell(
                                 onTap: (){
                            _scaffoldKey.currentState?.openDrawer();    },
                                   child: Icon(
                                      Icons.menu,
                                      size: MediaQuery.of(context).size.width * 0.05,
                                      color: Colors.white,
                                    ),
                                
                                      ),
                                ),
                              )),
                          const SizedBox(width: 12,)
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height* 0.0,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.08,
                        left: MediaQuery.of(context).size.width * 0.08),

                    child: Text(
                      "Terms and Conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                                              color: const Color(0xff002060),
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.058,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                // height:  MediaQuery.of(context).size.height * 0.72,
                // color: Colors.blue,
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.08,
                    left: MediaQuery.of(context).size.width * 0.08),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Veots',
                                                          style: TextStyle(
                            
                            // decoration: TextDecoration.underline,
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),


                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' - A Product of KSJ Rudh Pvt Ltd: TERMS OF USE',
                                                          style: TextStyle(
                            // 
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Welcome to Veots. This is a document or a record of Veots mobile app, web app platform - www.veots.com and www.veots.in (hereinafter referred to as \"Platform\" ) ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Veots is a product of KSJ Rudh Private Limited and is owned by KSJ Rudh private limited, having its registered address at – no:S-693, 12th cross, 15th main, Bharath Nagar 2nd stage, BEL Layout, Bangalore, Karnataka, India – 560091. ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "For the purpose of Terms and Conditions, terminologies used in any context such as - Client, User, You, yours’s, buyers refer to all the customers or users of Veots services / platform. “We”, “us”, “Owner”,” Ours”, “Ourselves”, “The company” refers to Veots/KSJ Rudh Private Limited. Party, Parties , Seller , Brands refers to Our Clients/brands who have collaborated with Veots.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "By using our services offered though our platform, including but not limited to (verifying the authenticity of the product, product reviews, product information, Loyalty programs.,) you will be subject to rules, guidelines, policies, terms and conditions, limitations of the services offered. We reserve the rights at our sole discretion, to modify, change, edit, delete, remove, add portions without any prior notice to you. It becomes your responsibility to review these terms and condition for any periodical changes. Your continued use of our services will mean that you accept and agree with our edits and changes. At any stage, if you decide to not agree with our condition, you are free to refrain yourself from using our services/platform.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Intellectual Property Rights",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "All the materials used on our platform including but not limited to Art, video, music, audio, image, text, graphics, technology, logo, trademarks, icons, drawings are claimed by us and are protected as per the copy right act, all our intellectual property is protected under copyright, trademark and other intellectual property laws.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "As a part of this agreement, you agree not to mis-use any content of our platform, re-produce, distribute, sell, publish using any electronic media and the like directly or assist somebody else to mis-use the content materials on this platform, without prior written consent of the owner, the content on this platform is only for your personal, non-commercial use. Your use of content/material for commercial use other than personal is violation of copyrights, trademarks, Intellectual property and other proprietary rights and is prohibited. We claim the right for the text, data, images, information, reviews, video, music and any other materials you upload or provide when you use our services/platform. We reserve the right to use or re-produce the content you upload, by this you agree to provide royalty free, unconditional, perpetual worldwide right to us to use your content for business purpose only.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "User Account, Password and Security",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "When you use our platform or service, you accept the terms that you are sole responsible to maintain confidentiality of your Profile/Account and other information you provide. You shall be responsible for all the activity that happens under your account/id and the like. You agree not to provide data which is inaccurate, in-complete, not current or untrue. At any point of time if we notice discrepancy, we shall have full rights to blacklist or delete your account or data without any prior notice. You shall agree to inform/report us immediately of any unauthorised use or breach of Veots account or password. ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Users Conduct and Rules ",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Use of our platform is strictly governed by rules and regulations. Users shall not host, hyperlink, copy, share any information which does not belong to them from our platform, Users shall not infringe upon third party including but not limited to intellectual property and privacy contents. Users shall not mis-use other person’s email address, phone number and the like. You shall not conduct any activities with an intention to cause loss to our business or revenue or the like. You shall not use our platform for fraudulent purpose. You shall not use any algorithm or any logic or methodology to gain unauthorised access to our platform, you shall refrain from hacking, password mining and the like. ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "The information provided on the platform on the products and services shall be downloaded, provided that you do not remove any proprietary notice language in all copies of such documents, make no modification for information or make any additional representation or warranties to the documents available on our platform. These information on platform shall strictly used only for personal and non-commercial information purpose only and not for any commercial use.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Services Offered and Warranty",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Veots provides a number of services through the Platform. Primarily Veots helps you to authenticate the product kept on sale even before buying. Veots shall help you with brand identification and verification of the products to say if it is genuine, fake or expired based on the data provided by our clients. Veots only verifies products of our client who has collaborated with us and not all the products in the market. Our platform shall only authenticate the product and provide you the details of product, but will not allow you to purchase through our platform. Additionally, Veots, might activate warranty based on the purchase date and provides paperless Warranty details which can only be used as a document to contact Brands and exercise warranty. Veots is not responsible for the change in the warranty timeline, terms and conditions laid by Brands and the like. By using our platform, it becomes responsibility of users to read and understand the terms and conditions of Brands before buying the product. Users shall contact Brands directly to settle their warranty, Veots claims no responsibility to settle the argument between seller and buyer. Veots cannot be held responsible if the buyer has not followed the policies of Seller. While we strive to provide all the required product details to users, Veots does not take responsibility to ensure that Product description or other content of the product on our Platform is accurate, reliable, current, or error-free, complete and assumes no liability in this regard. Veots will also not assure the quality of the products you purchase., we shall only verify that they are from the genuine manufacturer.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Indemnity",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "You shall not hold Veots, its owners, employees or subsidiaries responsible for your breach of contract or terms and conditions with Seller or brands for any Quality, Warranty, guarantee, refund, coupons and any other issues arising before, during or after purchase of product.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "E-Platform for Communication",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "By using our platform, you agree that Vetos is only an online platform that enables you to verify the products you purchase, activate warranty and the like, however, Veots cannot control any 3rd party transaction in any manner and you cannot hold Veots liable for this.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Limitation of Liability",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Veots shall not be liable for Unintended, corrective, special and the like damages resulting from the use/inability to use our services/platform. Veots shall not be responsible for non-availability of the platform during maintenance. Further users shall understand there might be delay in processing data or updating due to technical glitches and Veots shall not be responsible for this. Users understand and agrees that any disputes and disagreement between seller and buyers are settled between themselves.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Termination",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Veots shall blacklist or delete the user account and would block the access to the platform in its own discretion if we find that the user has infringed or breached the terms and conditions or is unethical. In case you or we decide to terminate your account, all the data corresponding to your usage and services might be deleted. If you provide incorrect, false identification, phone numbers or any details to gain access to our platform with intent to deceive, Veots reserves all the rights to refuse access, block, delete accounts including the linked accounts without any prior notice to you.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Governing Law",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "All the terms and conditions, privacy policy, cookie policy and loyalty program policy are governed by Laws of India. Disputes arising in relation hereto shall be subject to exclusive jurisdiction of court. The place of jurisdiction shall be exclusively in Bangalore.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Coupons",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Veots may sometime provide coupons as a loyalty program, by partnering with brands. Coupons cannot be transferred if you change your number/email address of your account. Coupons may come with expiry date and terms and conditions, how to use and the like. It’s user’s responsibility to read through the terms and conditions and follow the rules accordingly as stated by our partners. Veots holds no responsibility if the coupons don’t work as intended, and it is the discretion of our partners to revoke any coupon codes or promotion code. Coupons allocated are not exchangeable. Each coupon can only be redeemed once.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Contact us / Queries",
                        style: TextStyle(
                            
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "You can write to us on Customersupport@veots.com or call us on 9632123543",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Last updated: April 17, 2023.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                  // child: Text("Q. How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2: How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:"),
                ),
              )),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 55,
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height / 14,
              //   width: MediaQuery.of(context).size.width * 0.4,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
              //   child: ElevatedButton(
              //     onPressed:
              //        () async{
              //       await authenticateUser();
              //       if(_isUserAuthorized)
              //       {
              //         Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => ClaimButt(i_value: widget.i_value, clientId: widget.clientId, batchNo: widget.batchNo,),
              //           ));
              //       }
              //   //     else{
              //   //       showDialog(
              //   //     context: context,
              //   //     builder: (context){
              //   //     return AlertDialog(
              //   //         title: Text("Error!!!",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              //   //         content: Text("Authentication Failure"),
              //   //     );
              //   //     }
              //   // );

              //     },
              //     style: ElevatedButton.styleFrom(
              //         primary: Colors.transparent, shadowColor: Colors.transparent),
              //     child: Text(
              //       'Claim Product',
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
            ],
          ),
       
        
           drawer:  HamWidget())
        ));
  }
}
