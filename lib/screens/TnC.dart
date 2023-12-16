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
                                                          text: 'Welcome to Veots. ',
                                                          style: TextStyle(
                            
                            // decoration: TextDecoration.underline,
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),


                                                        ),
                                                       
                                                      ],
                                                    ),
                                                  ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "The following terms and conditions (\"Terms of Use\" or “Terms and Conditions”) govern all use of Veots Platform, Veots Anti-Counterfeiting Solution and related services and products provided by Veots (hereinafter referred to collectively as “Services”).  ",
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
                       "Veots Anti-Counterfeiting Solution is a proprietary product of KSJ Rudh Private Limited and is owned by KSJ Rudh private limited, having its registered address at – no:S-693, 12th cross, 15th main, Bharath Nagar 2nd stage, BEL Layout, Bangalore, Karnataka, India – 560091.",
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
                       "Definitions and Interpretations",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
                       "•	The Veots mobile app, Veots web app platform - www.veots.com and www.veots.in shall be referred to in here as “Platform”.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	The Veots patented anti-counterfeiting solution, Dynamic QR generateion, and the authentication software shall be referred to in here as “Anti-Counterfeiting Solution”.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	Services shall mean the provision of Platform, Anti-Counterfeiting Solution and other related services such as loyalty / cashback, digital warranty, reporting of fake products, track and trace, Product Journey, Expiry Alerts and Notifications, Advertisements, API services and other related services",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                       Text(
                       "•	The terms “user”, “you”, refer to all the users of Veots Services.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	The users may be any of the following as the context dictates\n 	  -“manufacturers” or “Brands” or “seller” or “client” who implement the Anti-Counterfeiting Solution to affix or print QR codes on the products developed, created or manufactured by them and/or use any of our Services; \n 	  -“retailers” or “distributors” who sell or distribute the manufacturer's products and who use the Platform to scan the QR codes to verify the product's authenticity and/or use any of our Services;\n 	  -“end-user” or “buyers” who purchase the products and use the Platform to scan the QR codes to verify the product's authenticity and/or use any of our Services.",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	“we”, “us”, “Owner”, “our”, or “Veots” refers to KSJ Rudh Private Limited. ",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      Text(
                       "•	By the wording “use our Services” or similar connotations refers to the use of our Platform, Anti-Counterfeiting Solution and/or any of our other related services as applicable. ",
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
                       "By accessing or using any of our Services offered though the Platform, including but not limited to (verifying the authenticity of the product, product reviews, product information, Loyalty programs, etc.) you will be subject to rules, guidelines, policies, terms and conditions, limitations of the services offered as specified in these Terms and Conditions. We reserve the rights at our sole discretion, to modify, change, edit, delete, remove, add portions in these Terms and Conditions without any prior notice to you. If there are any material changes, we may promptly notify you by email. It becomes your responsibility to review these Terms and Conditions for any periodical changes. Your continued use of any of our Services will mean that you accept and agree with the modified Terms and Conditions. At any stage, if you decide to not agree with our Terms and Conditions, you are free to refrain yourself from using our Services. If you do not agree with these Terms of Use, please do not access or use any Services. We reserve the right to deny access to or offer any Services to any person or entity. \n\nBy using any Services, you represent and warrant that: (a) you are the age of majority as per the applicable laws to which you are subject, (b) you are of sound mind and have the right, authority, and capacity to agree to and abide by these Terms of Use, (c) if you are accessing any Services on behalf of another person, you are authorized to act on behalf of such person and have the full authority to bind such person to this Terms Of Use. You are a minor, you may only register for and use the Services under the supervision and guidance of an adult or your guardian or parent, in which case the adult or the guardian or parent shall be deemed to be the user and shall be responsible for any activities.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),

                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "All the materials used on our Services including but not limited to art, video, music, audio, image, text, graphics, technology, logo, trademarks, icons, drawings and any and all intellectual property rights therein is claimed and owned by us (or our applicable licensors) and are protected under applicable copyright, trademark and other intellectual property laws. For the avoidance of doubt, Veots retains full ownership rights, title, and interest in all intellectual property associated with the Services. All patents, copyrights, trademarks, trade secrets, know-how, and any other intellectual property rights related to the Services shall remain the exclusive property of Veots.\n\n Any improvements, enhancements, or modifications to the Services made by any user shall be considered contributions to Veots’ intellectual property and shall become the sole property of Veots. User shall promptly disclose any such improvements to Veots and hereby waives any claim to ownership or rights related to these enhancements.\n\nAs a part of these Terms of Use, you agree not to misuse any content of our Services, re-produce, distribute, sell, publish using any electronic media and the like directly or assist somebody else to misuse the content materials on the Services, without prior written consent of the Owner. The content is only for your personal, non-commercial use except as otherwise provided herein. Your use of content/material for commercial use other than personal is violation of our (or our licensors’) copyrights, trademarks, intellectual property and other proprietary rights and is prohibited. We claim the license right for the text, data, images, information, reviews, video, music and any other materials you upload or provide when you use our Services. We reserve the right to use, copy,  modify, publish, transmit, disseminate, distribute, display, market, create derivative works from, and otherwise exploit or re-produce the content in any form or medium whatsoever you upload or provide, by this you agree to grant us and our affiliates, subsidiaries and our and their respective owners, employees, partners, officers, directors, contractors, agents, representatives a royalty free, unconditional, perpetual worldwide right to use your content for business purpose only including to provide, maintain, support, update or upgrade the Services and for conducting internal testing.\n\n When providing bill copies or any documents containing sensitive information, users are solely responsible for ensuring that any sensitive or confidential details (such as financial data, personal identification numbers, account numbers, PAN Number, GST Number, Card number, UPI Id, Address, transaction number, etc.) are appropriately masked or redacted before uploading or sharing such documents on our Platform. Veots strongly advises users to diligently review and mask any sensitive information visible on the documents before uploading. While Veots may provide guidance or recommendations for data masking, it is the user's responsibility to ensure that sensitive information is adequately protected. Veots shall not be held responsible or liable for any failure on the part of users to properly mask sensitive information on the uploaded documents. Users acknowledge and agree that Veots bears no responsibility for any unauthorized disclosure or exposure of sensitive information that remains visible or unmasked on the uploaded documents. By using our Services and uploading documents containing sensitive information, users accept full responsibility for the masking or redaction of any sensitive details and agree that Veots is not liable for any consequences resulting from the user's failure to mask such information.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "When you use our Services, you accept that you are solely responsible to maintain confidentiality of your profile/account and other information you provide to us. You shall be responsible for all the activity that happens under your profile/account. You agree not to provide data, which is inaccurate, in-complete, not current or untrue. At any point of time if we notice discrepancy, we shall have full rights to blacklist or delete your account or data without any prior notice. You shall agree to inform/report us immediately of any unauthorised use or breach of your account or password. You agree not to (a) create or access an account using a false identity or any false or inaccurate information, (b) create an account if you have been previously removed or banned by us, (c) have more than one account at any given time unless expressly permitted by us.",
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
                       "License",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Manufacturer: We grant the manufacturer a non-exclusive, non-transferable license to utilize our proprietary Anti-Counterfeiting Solution solely for the purpose of integrating the solution into their products. This license permits the manufacturer to embed and use our technology in their products to facilitate product authentication and verification. The manufacturer shall not sublicense, sell, distribute, modify, reverse engineer, or reproduce our Anti-Counterfeiting Solution or any Services without prior written consent. The license is solely for integrating the solution into the manufacturer's products and does not grant any rights to our intellectual property or proprietary technology. This license remains valid for the duration of the collaboration between Veots and the manufacturer and may be terminated in the event of breach of terms. Veots will assist the manufacturer in integrating and utilizing the Anti-Counterfeiting Solution for product authentication and verification purposes. The license granted is limited to the specific use within manufacturer's product lines and does not extend to sublicensing or transfer to third parties without explicit written consent from Veots.\n\nRetailer: We grant the retailer a limited, non-exclusive license to utilize our Platform for the purpose of product authentication and verification. This license allows the retailer to use the Platform to verify product authenticity within their establishment or during transactions involving products integrated with our technology. The retailer shall not modify, decompile, replicate, or resell any Services. This license is solely for utilizing the Platform within the retailer's business operations to authenticate products or to check the expiry of the product or for tracking the product journey and does not confer ownership or rights to our Platform or any Services. We reserve the right to revoke or terminate this license in case of misuse or non-compliance with the terms.\n\nEnd-User: We grant the end-user a limited, non-transferable license to use our Platform for the purpose of authenticating and verifying the authenticity of products integrated with our technology. The end-user shall use the Platform solely for personal product verification purposes and shall not modify, reverse engineer, distribute, or use the solution for any commercial purposes or in violation of applicable laws. This license does not grant ownership or rights to our technology and is contingent upon the end-user's adherence to these Terms and Conditions. We reserve the right to revoke or terminate this license in case of misuse or non-compliance with the terms.",
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
                       "Consideration",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                    "The manufacturer agrees to provide monetary consideration to Veots for the integration and use of the Anti-Counterfeiting Solution into their products. The consideration provided by the manufacturer enables the integration, deployment, and utilization of Veots’ anti-counterfeiting technology within their products. All fees are payable in advance and non-refundable except as stated in any applicable law. The end-users and retailers utilizing the Services may not provide monetary consideration for the Services rendered. However, the absence of monetary consideration shall not render these Terms and Conditions invalid or unenforceable. The acceptance and usage of the Services by end-users and retailers imply their acknowledgment and agreement to comply with these Terms and Conditions. The validity and enforceability of these Terms and Conditions remain intact irrespective of the absence of monetary consideration.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Use of our Services is strictly governed by these Terms of Use. Users shall not host, hyperlink, copy, share any information which does not belong to them from our Services. Users shall not infringe upon third party information or rights including but not limited to intellectual property and privacy contents. Users shall not infringe any of our brands, logos, trademarks, or other proprietary marks. Users shall not misuse other person’s email address, phone number and the like. You shall not interfere with the access or use of Services by other users. You shall not conduct any activities with an intention to cause loss to our business or revenue or the like or interfere with or disrupt any of the Services. You shall not use our Services for fraudulent purpose. You shall not use our Services in any way which is harmful to our interests. You shall not use any algorithm or any logic or methodology to gain unauthorised access to our Services. You shall refrain from hacking, password mining and the like. \n\nThe information provided on the platform on the Services shall be downloaded, provided that you do not remove any proprietary notice language in all copies of such documents, make no modification for information or make any additional representation or warranties to the documents available on our Services. These information on Services shall strictly used only for personal and non-commercial information purpose only and not for any commercial use.Additionally, the user shall not:\n•	Modify, reverse engineer, decompile, or attempt to extract the proprietary technology, algorithms, or methodologies used in the Services.\n•	Transfer, sublicense, sell, distribute, or assign the rights granted under the license to any third party unless prior written consent from us is obtained.\n•	Use the Anti-Counterfeiting Solution for purposes other than embedding it into their products for product authentication and verification purposes.\n•	Misrepresent or falsely claim ownership or association with our technology or intellectual property or any Services.\n•	Engage in any actions that may impair or compromise the integrity, functionality, or security of our Services.\n•	Remove any copyright, trademark registration, or other proprietary notices from the Services.\n•	Use the Services to compete with us or be involved directly or indirectly in a business that competes with us.\n•	Build a similar or competitive product or service using similar ideas, features, functionality, or graphics of the Services.\n•	Attempt to circumvent any technological measures related to the Services.\n•	Transmit or introduce any kind of virus or malware or harmful codes in the Services. \n•	Use the Services in any way not permitted or authorized by these Terms of Use.\n•	Impersonate or misrepresent yourself while using the Services.\n•	Use the Services in violation of any applicable laws.\nAdditionally, the manufacturer shall provide necessary product information, design specifications, and cooperation required for the successful integration of the Anti-Counterfeiting Solution and shall facilitate the implementation of the Anti-Counterfeiting Solution across its product lines.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Veots provides a number of Services through the Platform. Primarily Veots helps you to authenticate the product kept on sale even before buying. Veots shall help you with brand identification and verification of the products to say if it is genuine, fake or expired based on the data provided by our clients. The use of Veots’ Services does not imply or guarantee the authenticity, quality, or performance of the physical products themselves. The purpose of our technology is to aid in product authentication and verification for applicable stakeholders. While Veots collaborates with manufacturers to integrate Veots’ technology, Veots is not responsible for the functionality, accuracy, or effectiveness of the Services in every operational scenario. The integration of Veots Anti-Counterfeiting Solution into products is based on collaboration with manufacturers. However, Veots does not assume responsibility for any potential issues, malfunctions, inaccuracies, or shortcomings that may arise in the operation or implementation of the Anti-Counterfeiting Solution within the manufacturer's products. Veots does not guarantee absolute prevention of counterfeiting or fraudulent activities related to the products. The effectiveness of the Anti-Counterfeiting Solution may vary based on several factors, and Veots cannot ensure complete elimination of counterfeit occurrences. Veots disclaims any liability for damages, losses, or adverse outcomes, whether direct or indirect, that may occur due to the use or non-functionality of the Anti-Counterfeiting Solution integrated into the products manufactured by third parties. Veots only verifies products of our client who has collaborated with us and not all the products in the market. Our Platform shall only authenticate the product and provide you the details of product but will not allow you to purchase through our Platform. Additionally, Veots, might activate warranty based on the purchase date and provides paperless warranty details which can only be used as a document to contact manufacturers of the products and exercise warranty. Veots is not responsible for the change in the warranty timeline, terms and conditions laid by Brands and the like. Veots does not manufacture the physical products or have control over their production, quality, distribution, or warranty terms. The warranty terms and coverage are subject to the policies established by the respective manufacturers of the products. We do not provide direct warranties for the products and disclaims any liability or responsibility for the terms, coverage, or fulfillment of warranties. The responsibility for the production, quality assurance, warranties, and any related issues pertaining to the physical products remains solely with the respective manufacturer(s). By using our Services, it becomes responsibility of users to read and understand the terms and conditions of Brands before buying the product. Users shall contact Brands directly to settle their warranty, Veots claims no responsibility to settle the argument between seller and buyer. Veots cannot be held responsible if the buyer has not followed the policies of seller. Retailers using Veots’ Services do so at their discretion and responsibility. Veots does not assume liability for any issues, inaccuracies, or shortcomings that may arise during the use or implementation of the Anti-Counterfeiting Solution or Services within retail environments. Users of the Services should rely on additional product information provided by the manufacturer(s) and exercise their judgment when making purchasing decisions based on product authenticity verifications facilitated by Veots. Users utilizing Services are encouraged to understand its limitations and to exercise their independent judgment and due diligence when relying on the solution for product authentication purposes. Veots does not assume responsibility for the functionality, accuracy, or effectiveness of the Services for every product authentication carried out by buyers. Buyers utilizing Veots’ Services for product verification do so at their discretion and understanding. Veots disclaims any liability for issues, inaccuracies, or shortcomings that may arise during the use or reliance on the Services by buyers. Buyers utilizing Veots’ Services are encouraged to exercise their independent judgment, verify product authenticity through additional means, and understand the limitations of the solution. While we strive to provide all the required product details to users, Veots does not take responsibility to ensure that product description or other content of the product on our Platform is accurate, reliable, current, or error-free, complete and assumes no liability in this regard. Veots will also not assure the quality of the products you purchase, we shall only verify that they are from the genuine manufacturer.\nRegarding Loyalty / Cashback service: The availability of rewards, cashback, or benefits is subject to change at our discretion without prior notice. Veots disclaims any liability or responsibility for the availability, accuracy, or quality of rewards, offers, or cashback provided through the Loyalty / Cashback service. Users are encouraged to review and comply with the specific terms and conditions (if any) governing the Loyalty / Cashback service apart from these Terms and Conditions. Participation in the Loyalty / Cashback service indicates the User's acceptance of the terms and conditions set forth by Veots.\nReport Fake Products Service: We offers a service to report suspected counterfeit products through our Platform. The reporting of suspected fake products is a voluntary initiative undertaken by users based on their judgment and observations. We do not independently verify or authenticate the reported products and disclaims any liability for the accuracy, verification, or outcomes resulting from the reported fake products. The reporting service is provided solely as a means to flag suspected counterfeit products for user awareness. Users are encouraged to exercise caution and use additional verification measures when relying on reported fake products. We recommend contacting relevant authorities or original product manufacturers for further investigation or verification.\nAdvertisement Service: Advertisements displayed on our Platform are intended to promote products or services offered by third-party advertisers. We do not endorse, guarantee, or warrant the accuracy, quality, or effectiveness of the products or services advertised. The information, offers, or promotions displayed in advertisements are the sole responsibility of the respective advertisers. Users engaging with advertisements do so at their own discretion and risk. We disclaim any liability for transactions, agreements, or interactions resulting from engaging with the advertisements displayed on our Platform.\nData Analytics Service: We offer data analytics services to provide insights and analysis based on aggregated and anonymized data collected through our Platform. The analysis is conducted to derive trends, patterns, or insights from the data available. We will ensure that the data is anonymized and aggregated to protect user privacy. However, the accuracy, completeness, or outcomes derived from the data analysis cannot be guaranteed. The data analytics results provided by Veots are for informational purposes only and should not be construed as professional advice or absolute representations. Users are advised to interpret the results with caution and verify them through independent means if required.\nAPI as a Service: We offer API services to facilitate integration and connectivity with our Services. We disclaim any liability for disruptions, interruptions, or errors in API functionality that may occur due to technical issues or external factors beyond our control. The use of our APIs is at the user's own risk and responsibility. We reserve the right to modify, suspend, or terminate API services without prior notice. Users are encouraged to review and comply with the API usage guidelines provided by Us.\nWhite Labelling Service: We offer white labelling services to enable clients to brand and customize our solutions as per their requirements. The white labelling service allows clients to use our technology under their brand name. We disclaim any responsibility or liability for the client's use of the white-labelled solution, including branding, customization, or deployment. The client assumes responsibility for the application, use, and support of the white-labelled solution under their brand. We reserve the right to provide guidelines and support for the white labelling process but does not guarantee the success or outcomes of the white labelling service.\nTHE SERVICES ARE PROVIDED ON AN \"AS IS\" BASIS AND AN \"AS AVAILABLE\" BASIS WITH ALL FAULTS. WE EXPRESSLY DISCLAIM ANY WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT, PERFORMANCE, AND ANY WARRANTIES ARISING OUT OF THE COURSE OF DEALING OR USAGE OF TRADE.	THE ACCESS AND USE OF SERVICES MAY BE SUBJECT TO LIMITATIONS, DELAYS, AND OTHER PROBLEMS INHERENT IN THE USE OF THE INTERNET AND ELECTRONIC COMMUNICATIONS. WE ARE NOT RESPONSIBLE FOR ANY SUCH DELAYS, DELIVERY FAILURES, OR OTHER DAMAGES OR LOSS, OR CLAIMS RESULTING FROM SUCH PROBLEMS. WE DO NOT WARRANT THAT THE SERVICES WILL BE ERROR-FREE OR VIRUS-FREE OR BUG-FREE OR UNINTERRUPTED OR SECURE, OR THAT ANY OF THE SERVICES WILL MEET YOUR REQUIREMENTS OR EXPECTATIONS.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "You shall not hold Veots, its affiliates, subsidiaries and its and their respective owners, owners, employees, employees, officers, directors, contractors, agents, representatives responsible for your breach of contract or terms and conditions with seller or brands or retailer for any quality, warranty, guarantee, refund, coupons and any other issues arising before, during or after purchase of product.\nYou agree to defend, indemnify, and hold Veots, its affiliates, subsidiaries and its and their respective owners, owners, employees, employees, officers, directors, contractors, agents representatives, harmless from and against any claims, damages, costs, causes of actions, liabilities, including without limitation, reasonable attorney fees, resulting or arising from, your use or inability to use any of the Services, your breach of any provisions in this Terms of Use, your violation of any rights (including but not limited to intellectual property rights and privacy rights) of any party including any other user, or your violation of any applicable laws. This provision will survive termination of the Terms of Use.\nIn the event of your breach or threatened or alleged breach of this Terms of Use, Veots will be irreparably harmed and may not have an adequate remedy in money or damages and shall be entitled to an injunction against such a breach from any court of competent jurisdiction. Notwithstanding the foregoing, Veots shall also have the right to obtain other applicable remedies available at law.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "By using our Platform, you agree that Veots is only an online platform that enables you to verify the products you purchase, activate warranty and the like, however, Veots cannot control any 3rd party transaction in any manner and you cannot hold Veots, its affiliates, subsidiaries and its and their respective owners, owners, employees, employees, officers, directors, contractors, agents representatives liable for this.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "VEOTS AND ITS AFFILIATES, SUBSIDIARIES AND ITS AND THEIR RESPECTIVE OWNERS, OWNERS, EMPLOYEES, EMPLOYEES, OFFICERS, DIRECTORS, CONTRACTORS, AGENTS REPRESENTATIVES  SHALL NOT BE LIABLE FOR ANY INDIRECT, PUNITIVE, SPECIAL, EXEMPLARY, INCIDENTAL, CONSEQUENTIAL OR OTHER DAMAGES OF ANY KIND OR ANY DAMAGES FOR EMOTIONAL DISTRESS OR LOST PROFITS OR LOST BUSINESS OPPORTUNITIES, REPUTATION, LOSS OF DATA OR  INFORMATION OR CONTENT ARISING OUT OF OR IN CONNECTION WITH THE SERVICES. VEOTS SHALL NOT BE RESPONSIBLE FOR NON-AVAILABILITY OF THE SERVICES DURING MAINTENANCE. FURTHER USERS SHALL UNDERSTAND THERE MIGHT BE DELAY IN PROCESSING DATA OR UPDATING DUE TO TECHNICAL GLITCHES AND VEOTS SHALL NOT BE RESPONSIBLE FOR THIS. USERS UNDERSTAND AND AGREES THAT ANY DISPUTES AND DISAGREEMENT BETWEEN SELLER AND BUYERS SHALL BE SETTLED BETWEEN THEMSELVES.\nIN NO EVENT SHALL THE AGGREGATE LIABILITY OF VEOTS RELATED TO THESE TERMS OF USE EXCEED THE TOTAL AMOUNT OF FEES RECEIVED BY VEOTS FROM YOU FOR THE USE OF ANY PAID SERVICES DURING THE PAST THREE MONTHS.\n\nTHE LIMITATIONS OF LIABILITY OUTLINED IN THIS SECTION CONSTITUTE THE FUNDAMENTAL ELEMENTS OF THE BASIS OF THE BARGAIN BETWEEN VEOTS AND YOU AND SHALL APPLY TO ALL CLAIMS OF LIABILITY SUCH AS INCLUDING BUT NOT LIMITED TO WARRANTY, TORT, STRICT LIABILITY, AND NEGLIGENCE EVEN IF VEOTS HAS BEEN ADVISED OF THE POSSIBILITY OF ANY SUCH DAMAGES.",
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
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "Veots may without prior notice discontinue your use of any of the Services, block your access to the Services or delete your account, with or without notice, for reasons including but not limited to: a) your breach of any provisions in the Terms of Use, b) as required by any applicable law, c) any security issues, d) our decision to discontinue the Services (or any part thereof).\n\nIn case you or we decide to terminate your account, all the data corresponding to your usage and services might be deleted. If you provide incorrect, false identification, phone numbers or any details to gain access to our Services, Veots reserves all the rights to refuse access, block, delete accounts including the linked accounts without any prior notice to you.\n\nWe may from time to time suspend or terminate access to all or a part of any Services, or limit the availability and accessibility to you as per Our discretion and without any reason.\n\nUpon termination of your account or any part of it, your right to use such Services will automatically terminate immediately. You agree that all suspensions or terminations shall be made at our sole discretion, and we shall not be liable or responsible to you or any third party for any resultant damages or claims arising or resulting to you or any third party due to such termination.",
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
                       "Governing Law:",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "These  Terms and Conditions are governed by laws of India. Disputes arising in relation hereto shall be subject to exclusive jurisdiction of the courts of Bengaluru, India.",
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
                            fontWeight: FontWeight.bold,
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
                       "Third Party Sites",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "The Platform may contain links to third-party websites or resources which are not part of Veots. \nWe do not: Control, review or monitor such sites; Make any warranties or representations concerning such sites; Endorse such sites or any of their products or services.\nVeots shall not be responsible or liable for these websites including but not limited to their resources, content, availability of the content, and information therein. You agree to use all such third-party sites at your own risk.\nSome of the content available from any of the Services may be sourced through third-party sources and you should respect and comply with the terms and conditions of such third-party content as per their license terms.",
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
                       "Privacy Policy",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "The Privacy policy available on our Platform provides information about our collection, use, and disclosure practices related to the personal information of users and is incorporated into this Terms of Use. You agree to use the Services as per the Privacy Policy."
                        ,style: TextStyle(
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
                       "Confidentiality",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "By using the Services, you agree that any and all information, data, algorithms, methodologies, trade secrets, or other proprietary information ('Confidential Information') provided or made accessible to you by us for the purpose of utilizing the Services is strictly confidential. You agree to maintain the utmost confidentiality of this Confidential Information and undertake not to disclose, disseminate, reproduce, or otherwise make accessible any Confidential Information to any third party without the prior written consent of Veots. You shall take reasonable measures to protect the Confidential Information from unauthorized access, disclosure, or use, and you shall not use the Confidential Information for any purposes other than those expressly permitted by Veots. This confidentiality obligation shall survive the termination of your use of the Services.",
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
                       "General",
                        style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                        Text(
                       "You will not transfer your account or access to the Services to any other person or entity without our prior written consent. This Terms of Use, your rights, and obligations hereunder, shall not be assigned, subcontracted, or transferred by you without our prior written consent, and any attempted transfer shall be considered as a violation of these Terms of Use. We reserve the right to assign these Terms of Use to any third party without your consent.\n\nWe may in our sole discretion, make any changes to the Services that we deem necessary or useful to maintain or enhance the quality or delivery of the Services. We will send you to notice to the last email address you provided to us. Our dispatch of the email containing any notice will be considered effective notice to you notwithstanding such notice may not be delivered to you for reasons such as including but not limited to the invalidity of your email address, your inbox being full, or your email being inaccurate. We are not responsible nor liable for any delays or failures in performance from any cause beyond our control, including, but not limited to acts of God, changes to law or regulations, embargoes, war, terrorist acts, acts or omissions of third party technology providers, lockdowns, riots, fires, earthquakes, floods, power blackouts, strikes, weather conditions or acts of hackers, internet service providers or any other third party or acts or omissions of Users. These Terms of Use constitute the entire agreement between you and us as to the subject matter stated herein. If any provision of this Terms of Use is found to be invalid or unenforceable for any reason, the remaining provisions will continue to be valid and enforceable. Your use of any of the Services shall not make you an employee or agent or partner or joint venturer of Veots unless expressly sated otherwise by the parties in writing. You shall at all times comply with all applicable laws while using any of the Services. Nothing in this Terms of Use will provide or accrue any benefit to any third party or entitle any third party to any claim, cause of action, remedy, or right of any kind. Any waiver or failure to enforce any provision of the Terms of Use on one occasion will not be deemed a waiver of any other provision or such provision on any other occasion. Delay in exercising or non-exercise any such right or remedy does not constitute a waiver of that right or remedy, or any other right or remedy. This Terms of Use binds and benefits the parties and their respective permitted successors and assigns."
                        ,style: TextStyle(
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
                        "You can write to us on Customersupport@veots.com or call us on 9632123543.",
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
                        "Last updated: December 15, 2023.",
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
