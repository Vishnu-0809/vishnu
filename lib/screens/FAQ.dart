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


class FAQ extends StatefulWidget {
  const FAQ(
      {super.key,
      
      });
  
  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
  _write() async {
  
}

  //  File filenull=ile.writeAsString('');
  bool loading=false;
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
              SizedBox(height: MediaQuery.of(context).size.height/50,),
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
                                          builder: ((context) =>HomeScreen(first_time: 0,
                                          mainLink: '',location_on: true,))),
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
                      "FAQs",
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
                
                child:Container(
                  // height:  MediaQuery.of(context).size.height * 0.72,
                // color: Colors.blue,
                margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.08,
                        left: MediaQuery.of(context).size.width * 0.08),
                  child:  SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                      "Q. How does Veots help in identifying genuine/fake products?",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ),
                     SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase. ",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ),
                    SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. How to locate the QR code? ",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ),
                     SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. What should the customer do after purchasing the product that has Veots protection? ",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. ",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Option 1:",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Option 2: ",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "After scanning the QR code if it is asking you to scan the 2nd /Hidden QR code, you’ll have to scan the 2nd /Hidden QR code to get the claim button and click the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. What is a need for claiming after scanning the QR code? ",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. Upon scanning the QR code and clicking on Claim button, the customer registers the product. Once the claim is made, all the other products with same QR codes are digitally marked as fake. Thereby discouraging the counterfeiters to reuse the same codes.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. What does the customer get by claiming the product? ",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. Upon claiming the product, the customer can activate warranty if applicable and might also win rewards/coupons. Most importantly, the customer plays a part in eliminating the counterfeiting menace.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. How to contact Veots in case of disputes/ Queries?",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. Please write to us on info@veots.com, we’ll get back to you at the earliest",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. As an end-user do I have to pay for Veots solution.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. No, Veots solution is absolutely free for end-users.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. Why am I not able to see the expiry /warranty notifications.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. Veots would notify twice in the warranty/expiry context; First, when the end of warranty/expiry is nearby and second, on the day of expiry/ warranty end. These notifications persist in the notification inbox only for a week and would disappear after that.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. What should I do if the product reads as Fake.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. When it reads as fake, please click on the Report button on the app screen, this captures the location of where the fake product is getting sold, there by you are contributing towards Anti-Counterfeiting.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. Can I contact Veots for any product disputes.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. If you have any disputes or queries, please contact Manufacturer directly, using the contact number or email address mentioned on the product. You can contact Veots only if you have any issues with the verification of the product.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. Is it possible to transfer the coupons I have gained when I change my phone no./email address?",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. No, you will not be able to transfer the coupons, however you can copy the codes before changing the email ID/phone number and use it or share it with your friends/family.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. Why am I asked to upload bill while claiming.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. Veots helps you to save your bill on cloud which is accessible anytime on your account, this helps you and the Warranty provider to verify your purchase and provide warranty services.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. Can I verify products which are imported?",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. While Veots enables global verification, if the products you have imported comes with Veots Security you can surely verify the products.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. Why am I not able to find a 2nd QR code.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. In some cases Veots solution comes with 1 QR code in such case you’ll not find 2nd QR code. However, when you have already scanned the 1st QR and it’s asking you to scan the 2nd QR and if its not available, its possible that the Product might be fake, in such case please click on “Report Hidden code” button and return the product.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. Can I have 2 accounts with same number",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. No, Veots does not support 2 accounts with same phone number/email address",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. My product read as Genuine when scanned the outer box, but after scanning the hidden QR its reading as fake.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. Its a clear scenario that the product you have purchased is already claimed by somebody else, hence please report fake by clicking on report button and ask the vendor for a replacement.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "Q. I’m unable to find the 2nd /hidden QR code, what should I do to claim the product.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "A. “Hidden QR code” button will assist to find the 2nd /hidden QR code, if you are not able to find the 2nd QR please report it as fake.",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ), SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Text(
                      "",
                      style: TextStyle(
                        // 
                         
                                                          fontFamily:
                                                              "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: 13
                      ),
                    ),
                    
              
                    ],
                  ),
                  // child: Text("Q. How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2: How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:How does Veots help in identifying genuine/fake products A. Customer can authenticate a product by scanning the QR code on the outer box or on the product directly if accessible even before purchase.Q. How to locate the QR code? A. The code will normally be printed on the outer box or on the product directly, if you have already scanned the QR code on the outer box or on wrapper, on the app you can click on hidden code button to know the placement of 2nd QR code.Q. What should the customer do after purchasing the product that has Veots protection? A. Option 1:After scanning the QR code if you get claim button option, you can click on the button to register the product to your user account. If the product comes with a warranty, the bill needs to be uploaded before claiming.Option 2:"),
                ),
                )
              ),
             
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
