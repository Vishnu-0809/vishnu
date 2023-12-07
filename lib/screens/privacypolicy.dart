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
                        "Use of Cookies: ",
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
                        "Veots uses cookies to deliver a smooth experience to our customers/visitors when they are trying to use our services, and also to understand how our visitors are using our platform. We do not identify you personally and will not use any personal data for advertising. ",
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
                      ),
                       Text(
                        "Its user’s discretion to either accept or reject cookies on our platform.",
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
                      ), Text(
                        "Accepting and using cookies would help you stay logged in on our platform if not you will be prompted to login each time, in order to avoid such annoying experience, we encourage accepting cookies to make the experience smooth. ",
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
                      ), Text(
                        "Cookies also helps us to understand our user/visitor behaviour on what interests them the most on our platform.",
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
                      ), Text(
                        "Collection ",
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
                        "When you use our platform as a user or visitor, we shall collect your personal information including but not limited to your identity and demographics such as name, email, phone, location, gender and also some of the sensitive information such as bank UPI id to credit cash backs (if applicable). We also collect products details, shopping behaviour, preferences, device location, browsing history. This provides us with the information to provide you with the services which best suits you. You will have to download our app in order to start using our services and you cannot use it anonymously; this is because if you are claiming the product, we would need your product details to block the digital signature of the product. We as a company or our employees would never ask for any password or pin number which is highly confidential, please do not disclose that with anybody. We may track your buying patterns, preferences, and other information that you choose to provide on our Platform. We use this information to do research on our users. We may use your contact number to send you offers and discounts when you use our platform. ",
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
                      ), Text(
                        "Use",
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
                        "We may use your personal information to provide you with the best services. We may use your buying behaviour, purchases history, device location and the like to help our business partners to understand the market better, enhance your buying experience, to resolve any disputes, to troubleshoot any problems, to understand the customer choices and to improve the products range in market. We do not sell any personal information or any data pertaining to customer to 3rd party. We will ask for your permissions to send you promotional messages, discounts, you may at any time unsubscribe to it at your own discretion. We use your IP address to identify you and to gather information, we may use this for market research. We may ask for you permission to gain access to your messages, camera , photo gallery, device location information , we use this to scan and verify products, send you messages, block digital signature while you claim the product, find the demographics of where the products are scanned and reported for fakes and the like. ",
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
                      ), Text(
                        "Sharing",
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
                        "We would share your personal information with our employees, corporate entities, affiliates, partners and the like to provide you the services offered by Veots such as verification, discounts, cashback, reporting, trouble shooting, helping you with your queries, investigate fraudulent or illegal activities, facilitate our marketing and advertising activities. We may disclose your personal data/confidential data to government entities or agencies or any other authorised law enforcements if required to do so by law. We might share your personal data in case of amalgamation, restructuring of business , acquired by any business entity, organization or the like.",
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
                      ), Text(
                        "Links to Other Sites",
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
                        "Veots may contains links to other websites during advertisements, which may collect your personal information. Veots holds no responsibility on this and it is user’s responsibility to read 3rd party privacy policies, terms of use and conditions before clicking on linked websites. ",
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
                      ), Text(
                        "Security Precautions",
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
                        "While we take almost caution to protect our users data and secure them, the transmission of information is not 100% secure for reasons beyond our control, however our team would be updating our systems frequently to protect your personal information against any virus or hacking. By using our mobile app, you accept that there might be certain security risks and you agree to it that its not completely secure. Its user’s responsibility to ensure protecting their login password and not share it with any body to protect their account from misuses.",
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
                      ), Text(
                        "Use of Children Information",
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
                        "Our platform can be used by anybody who is 13+. We do not knowingly collect any personal information from children under the age of 13 years, if you have shared any personal information of children under the age of 13 years, you take complete responsibility of it and permit us to use the information in accordance with this Privacy Policy. If you feel you have shared the details of anybody under the age of 13 years, you may go ahead and delete the account or call our customer support for assistance.",
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
                      ), Text(
                        "Data Retention",
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
                        "We shall retain customers personal data for period no longer than it is intended or required for the purpose of business. We may retain certain data if bound by legal obligation to comply with regulatory retention requirement by law. We may also retain your data anonymously only for research and analytical purposes. ",
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
                      ), Text(
                        "Your Rights",
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
                      ), Text(
                        "We shall take utmost care and responsibility to ensure your personal data/information we process is accurate and true. However, at any point of time if you feel the data processed is inaccurate, incomplete or not true,  you may contact our customer service to get the data rectified or you may access your account and correct or update you personal information directly using our platform. You may also delete your account if you wish to stop using our services, however you can register back when you wish to; unless, we as a company have blocked or blacklisted by finding you guilty or illegal or for breach of our terms of use or privacy policy.",
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
                      ), Text(
                        "Consent",
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
                        "By using our platform or by providing your personal information you provide us with the consent to collect, use, store, disclose your data including but not limited to your sensitive personal data in accordance with privacy policy. If you provide us with personal information relating to others, then you take complete responsibility of it and provide us the consent to use the information, Veots or KSJ Rudh(P) Ltd, its employees, affiliates or the like cannot be held responsible for it. When you provide your personal information on our platform, you provide your consent to sent you emails, SMS, advertisements and the like from us or from our business partners. ",
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
                      ), Text(
                        "Changes to this Privacy Policy",
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
                        "We may update policies from time to time if necessary. Its user’s responsibility to check our Privacy policy for periodical changes.  By using our platform, you agree to check for changes and updates.",
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
                      ), Text(
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
                      ), Text(
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
          
           drawer:  HamWidget()
        )));
  }
}
