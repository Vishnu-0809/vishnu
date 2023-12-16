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

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                      "Privacy Policy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                         color: Color(0xff003274),
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
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
                   
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                     
                      Text(
                        "This Privacy Policy (“Privacy Policy”) describes the policies of KSJ Rudh Private Limited (“we”, “us”, “our”, or “Veots”) regarding the collection, use, disclosure and processing of your personal data when you access or use the Anti-Counterfeiting Solution, Platform, and/or the Services. The term “personal data” refers to data that could be used, alone or in combination with other data, to identify you as an individual.\n\nThis Privacy Policy is a part of and incorporated with the Terms and Conditions. Any term not defined herein shall have the same meaning as provided in the Terms and Conditions. \n\nYou are requested to read this Privacy Policy and the Terms and Conditions carefully before accessing or using the Anti-Counterfeiting Solution, Platform, and/or the Services or submitting your personal information to us. If you do not agree with the Privacy Policy, please do not use or access the Anti-Counterfeiting Solution, Platform, and/or the Services.",
                        style: TextStyle(
                            // 
                            //  
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                     
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ), SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                       Text(
                       "Information Collection-What and How?",
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
                       "We collect the following personal information about you when you register and use our services using Veots web app, mobile app or any of our platform or services."
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
                       "From the Buyers: "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "•	Name\n•	Entity Name (if applicable)\n•	Contact Phone Number\n•	Contact Email Address\n•	Customer Gender \n•	Customer Date of Birth \n•	Client Purchase history, Purchase Date, Copy of the purchase receipt or invoice.\n•	Enrolment Details: Information related to the enrolment process, program participation, rewards earned, redeemed, or pending.\n•	Preferences: Information related to preferred products, shopping habits, or any preferences specified by you.\n•	Report Details: Information about the suspected fake product(s), including details of the encounter or purchase.\n•	UPI ID, Bank details"
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
                       "From the Retailers: "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "•	Name\n•	Entity/shop Name\n•	Address\n•	Contact phone Number\n•	Contact Email address\n•	Location"
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
                       "From the Manufacturer:  "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "•	Name\n•	Entity Name\n•	Address\n•	Contact Phone number\n•	Contact Email address\n•	Location\n•	Manufacturer License no\n•	Product Details\n•	Staff Phone number\n•	Staff Email Address\n•	Incorporation Certificate (if applicable)\n•	PAN number (if applicable)\n•	GST Number (if applicable)\n•	When using white labelling services, we may collect:\n   -	Branding Information: Logo, brand identity elements, or other brand-related materials provided for white labelling purposes.\n   -  Contact Information: If applicable, contact details shared for communication related to the white labelling service\n   - 	Bank A/c or Payment Gateway details: If applicable for Cash back services\n•	When using our API services, we may collect:\n  -	Usage Information: Details of API requests, usage patterns, and interactions.\n -	Account Information: If applicable, account credentials, contact details, or any information shared for API access."
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
                       "Collection "
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "When you use our Platform as a user or visitor, we shall collect your personal information including but not limited to your identity and demographics such as name, email, phone, location, gender and also some of the sensitive information such as bank UPI id to credit cash backs (if applicable). We also collect products details, shopping behaviour, preferences, device location, browsing history. This provides us with the information to provide you with the services which best suits you. You will have to download our app or log into our app web app or mobile app, in order to start using our Services and you cannot use it anonymously; this is because if you are claiming the product, we would need your product details to block the digital signature of the product. We as a company or our employees would never ask for any password or pin number which is highly confidential, please do not disclose that with anybody. We may track your buying patterns, preferences, and other information that you choose to provide on our Platform. We use this information to do research on our users. We may use your contact number to send you offers and discounts when you use our platform, you are free to unsubscribe to any of these notifications, if you wish not to receive any offers or discounts notifications."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                      Text(
                       "Use"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We may use your personal information to provide you with the Services including managing and administering the Services. In case of Loyalty/Cashback program, we will use the information for awarding and tracking earned rewards or cashback, analyzing program performance and trends to enhance user experience, communicating program updates, offers, or relevant information. We will use the information for verifying and validating warranty claims, contacting you for warranty-related communication. We may use your buying behaviour, purchases history, device location and the like to help our business partners to understand the market better, enhance user experience, to resolve any disputes, to troubleshoot any problems, to understand the customer choices and to improve the products range in market. We use the information for analyzing aggregated data to derive insights, trends, and patterns for analytical purposes and improving our services. We use the information for analyzing usage patterns to optimize API performance and user experiences. We do not sell any personal information or any data pertaining to you to 3rd party. By consenting to this Privacy Policy, you agree that will be send you promotional emails, messages, SMS, or message related to discounts and like, you may at any time unsubscribe to it at your own discretion by using the unsubscribe link in your email. We use your IP address to identify you and to gather information, we may use this for market research. We may ask for you permission to gain access to your messages, camera , photo gallery, device location information, we use this to scan and verify products, send you messages, block digital signature while you claim the product, find the demographics of where the products are scanned and reported for fakes and the like. We may use the information for investigating and analyzing reported instances of suspected fake products, contacting you for further details or updates regarding the reported products and taking necessary actions as per our policies against reported counterfeit products."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                           
                            fontSize: 13),
                      ), 
                      Text(
                       "Sharing"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We would share your data with our affiliates, subsidiaries and our and their respective owners, employees, partners, officers, directors, contractors, agents representatives and the like to provide you the Services offered by Veots such as verification, discounts, cashback, program administration, reporting, trouble shooting, helping you with your queries, investigate fraudulent or illegal activities, facilitate our marketing and advertising activities. We may disclose your personal data/confidential data to government entities or agencies or any other authorised law enforcement agencies if required to do so by law. We might share your personal data in case of amalgamation, restructuring of our company or the like by deleting your account with us and by refraining yourself from using our services, you can also contact us at the contact details below:"
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
                       "Consent given by: Retailer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : names, contact details, locations,\n\nUsers with whom data shared : Manufacturers.\n\nPurposes : anti-counterfeiting efforts including for enabling the manufacturers to track the product movement across all the distributors and retailers involved in the supply chain"
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
                       "Consent given by: Retailer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : names, contact details, locations,\n\nUsers with whom data shared : Buyer.\n\nPurposes : To enable the buyers to see the movement of the product in the supply chain"
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
                       "Consent given by: Manufacturer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : Manufacturer license number, address, and all the details pertaining to product.\n\nUsers with whom data shared : Buyer.\n\nPurposes : To enable the buyers to understand the origin of the product manufactured and to know about the manufacturer and product they are purchasing"
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
                       "Consent given by: Buyer."
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Type of Data shared : names, contact details, purchase history.\n\nUsers with whom data shared : Manufacturers.\n\nPurposes : enhance product quality, provide support, etc."
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
                       "Links to Other Sites"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Veots may contains links to other websites during advertisements, which may collect your personal information. Veots holds no responsibility on this and it is user’s responsibility to read 3rd party privacy policies, terms of use and conditions before clicking on linked websites. "
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
                       "Security Precautions"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "While we take almost caution to protect our users data and secure them, the transmission of information is not 100% secure for reasons beyond our control, however our team would be updating our systems frequently to protect your personal information against any virus or hacking. By using our Services, you accept that there might be certain security risks and you agree to it that your data is not completely secure. Its user’s responsibility to ensure protecting their login password and not share it with anybody to protect their account from misuses. "
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
                       "Use of Children Information"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "Our Services can be used by anybody who is 13+. We do not knowingly collect any personal information from children under the age of 13 years, if you have shared any personal information of children under the age of 13 years, you take complete responsibility of it and permit us to use the information in accordance with this Privacy Policy. If you feel you have shared the details of anybody under the age of 13 years, you may go ahead and delete the account or call our customer support for assistance. "
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
                       "Data Retention"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We shall retain your data for period no longer than it is intended or required for the purpose for which it is collected, or as long as your relationship with us continues. We may retain certain data if bound by legal obligation to comply with regulatory retention requirement by law or as otherwise required to be retained by any applicable law. We may also retain your data anonymously only for research and analytical purposes. On the expiry of above stated periods, as applicable, we will either permanently delete, destroy, or de-identify your personal data. "
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
                       "Transfer of Data"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We may act as controller or processor depending on the applicable scenarios. For instance, if we collect the data directly from individuals (e.g., customers, retailers), we may determine the purposes for processing (e.g., for our own analytics or marketing), and we will likely act as a data controller. However, if we process the data strictly based on the instructions provided by the manufacturers without determining the purposes or means of processing, we may be considered a data processor in that specific context.\n\nWe hereby inform users that in connection with the provision of Services, personal data may be transferred to and processed in India. By using our Services, you expressly consent to the transfer of your personal data to India, understanding that data protection laws and regulations in India may differ from those in your country of residence. The data transfer to India is primarily for the purposes outlined in our Privacy Policy. We commit to implementing appropriate safeguards and security measures to ensure the protection and confidentiality of transferred data, adhering to applicable data protection laws and regulations."
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
                       "Lawful Basis:"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We process personal data based on one or more lawful bases as defined under applicable data protection laws.\n\n•	Consent: We may process personal data provided by users based on explicit consent obtained for purposes such as account management, service provision, reporting, fraud prevention and communication.\n•	Contractual Necessity: Processing of personal data is necessary for fulfilling contractual obligations, ensuring the provision of anti-counterfeiting solutions and associated services, ensuring access to anti-counterfeiting solutions and associated services\n•	Legitimate Interests: Veots processes relevant data to address legitimate interests, such as improving product security measures or conducting analytics to enhance services, without compromising manufacturers' rights, address legitimate interests, such as analyzing product authenticity reports, providing support, and enhancing service quality for retailers.\n•	Legal Compliance: Data processing may occur to comply with legal obligations applicable to the services provided by Veots ensuring adherence to relevant laws and regulations.\n•	Vital Interests: In exceptional situations involving the protection of vital interests of individuals related to anti-counterfeiting measures, data may be processed to prevent harm or unauthorized use of products.\n•	Contractual Necessity: Processing of personal data is essential for fulfilling contractual agreements between Veots and retailers, ensuring access to anti-counterfeiting solutions and associated services."
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
                      "Your Rights"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We shall take utmost care and responsibility to ensure your personal data we process is accurate and true. However, at any point of time if you feel the data processed is inaccurate, incomplete or not true,  you may contact our customer service to get the data rectified or you may access your account and correct or update you personal information directly using our Platform. You may also delete your account if you wish to stop using our Services, however you can register back when you wish to; unless, we have blocked or blacklisted by finding you guilty or illegal or for breach of our Terms of Use or Privacy Policy or any other reason.\n\nAlso, in accordance with applicable law, you may have the following rights related to your personal data: \b•	The right to access your personal data. \n•	The right to request for erasing your personal data under certain conditions.\n•	The right to restrict processing under certain conditions. That means you have the right to limit the way that we use your personal data. \n•	The right to data portability. You have the right to obtain your personal data from us in a format that makes it easier to reuse your information in another context, and to transmit your personal data to another data controller of your choice.\n•	The right to object to processing. You have the right to object to our processing of your personal information under certain conditions.\n•	The right to revoke your consent any time.\nYou may exercise your rights by contacting us as per stated herein. We will process your requests in accordance with applicable laws. We may verify your identity before fulfilling any of your request. We may also charge any administrative fee as per applicable law and will notify you of the same."
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
                       "Consent"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "By using our Services or by providing your personal data you provide us with the consent to collect, use, process, store, disclose your data including but not limited to your sensitive personal data in accordance with Privacy Policy. If you provide us with personal information relating to others, then you take complete responsibility of it and provide us the consent to use the information. Veots and its affiliates, subsidiaries and its and their respective owners, employees, partners, officers, directors, contractors, agents representatives cannot be held responsible for any claims or liabilities related to the same. "
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
                       "Changes to this Privacy Policy"
                        ,style: TextStyle(
                            // 
                             
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ), 
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      
                      Text(
                       "We may update this Privacy Policy from time to time if necessary. Its user’s responsibility to check our Privacy policy for periodical changes.  To the extent permitted under the applicable law, your continued use of any of the Services after any change is made in this Privacy Policy will constitute your acceptance of such change. By using any of our Services, you agree to be bound by the updated policy."
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
                            
                         fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                            color: Colors.black,
                            // fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ), Text(
                        "If you have any query, concerns or complaint in relation to collection or usage of your personal information under this privacy policy, you can write to us on Customersupport@veots.com or call us on 9632123543",
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
                      
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ), Text(
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
          
           drawer:  HamWidget()
        )));
  }
}
