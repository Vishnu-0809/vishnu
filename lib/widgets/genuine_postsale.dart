import 'dart:io';
// import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:Veots/screens/cash_back.dart';
import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/no_CB_War.dart';
import 'package:Veots/screens/phone_view.dart';
import 'package:Veots/screens/warranty_bill_upload.dart';

import 'package:Veots/widgets/send_accept.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/class_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;

import '../screens/Notifications_view.dart';
import '../screens/home_page.dart';
import '../screens/product_details.dart';
import 'not_icon.dart';


class GenuinePost extends StatefulWidget {
  const GenuinePost(
      {super.key,
      required this.link,
      required this.snapshot,
      required this.i_value,
      required this.clientId,
      required this.batchNo,
      required this.keyD,
      required this.sublink
      });
  final String link;
  final ClaimProd snapshot;
  final int i_value;
  final String clientId;
  final String batchNo;
  final String sublink;
  final keyD;
  @override
  State<GenuinePost> createState() => _GenuinePostState();
}

class _GenuinePostState extends State<GenuinePost> {
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
  YoutubePlayerController _controllerCovert = YoutubePlayerController(
    initialVideoId: 'wHXZknRQhRc',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        showLiveFullscreenButton: true
    ),
);
YoutubePlayerController _controllerOvert = YoutubePlayerController(
    initialVideoId: 'MhIWv_EZDhI',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        showLiveFullscreenButton: true
    ),
);
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
  Future getData() async {
  //   final Directory directory = await getApplicationDocumentsDirectory();
  // final file = File('${directory.path}/my_file.txt');
  // await file.writeAsString("x");
  
    print(widget.i_value);
    print(widget.clientId);
    print(widget.batchNo);
    String type= MOB_not_EM! ? "mobile" :"email"; 
    token = await createAlbum56(
        widget.i_value.toString(), ID!, widget.clientId, widget.batchNo,File(""),LOCATION,widget.link,type);
        print(token);
    print(token?.message);
    print(token?.couponDetails);
    print("cccccccccccccccccccccccccccccccc");
    if(token?.couponDetails == null)
    print("no coupon details");
    print("ccccccccccccccccccccccccccccccccc");
    return token;
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

  late ClaimProd temp;
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
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              child: Row(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                    child: IconButton(
                      onPressed: () {
                        int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  Container(
                    child: Image.asset(
                      'assets/veots_logo_wo_tl.png',
                     height: MediaQuery.of(context).size.width * 0.075,
                        width: MediaQuery.of(context).size.width * 0.075,
                    ),
                  ),
                  Spacer(),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.07,
                      width: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
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
                                icon: Icon(
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
                          decoration: BoxDecoration(
                            color: Color(0xff002060),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: 
                              InkWell(
                             onTap: (){
                        widget.keyD.currentState?.openDrawer();    },
                               child: Icon(
                                  Icons.menu,
                                  size: MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
        ),
                            ),
                          )),
                  SizedBox(width: 12,)
                ],
              ),
            ),
              SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              "Scanned Product Details",
              style: 
              // Theme.of(context).textTheme.headlineMedium,
              TextStyle(
                  color: const Color(0xff002060),
                  fontSize: 16,
                  fontFamily: "Poppins Medium",
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
              Text(
                widget.snapshot.details["prodName"],
                textAlign: TextAlign.center,
                style: 
                // Theme.of(context).textTheme.headlineSmall,
                TextStyle(
                  color: Color(0xff00b7ff),
                  fontFamily: "Poppins Medium",
                  // fontSize: MediaQuery.of(context).size.width * 0.055,
                  fontSize: 12,
                ),
              ),
              
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 35,
              // ),
               Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width * 0.1),
                  margin: const EdgeInsets.only(right: 30),
                  child: 
                    SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff493979),
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(10)),
                          // padding:
                          //     EdgeInsets.all(10)), //content padding inside button)
                      ),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return WillPopScope(
                         onWillPop: () async => false,
                         child: AlertDialog(
                                backgroundColor: const Color(0xff002060),
                                titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                shape: const RoundedRectangleBorder(
                                    //<-- SEE HERE
                                    // side: BorderSide(
                                    //   color: Colors.greenAccent,
                                    // ),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                title: Stack(
                                  children: [
                                    Container(
                                        height:
                                            50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                         Color(0xff003296), Color(0xff662da4)
                                        ])),
                                        // color: Colors.blue,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (MediaQuery.of(context)
                                                    .size
                                                    .width <
                                                600) ...[
                                              const FittedBox(
                                                child: Text(
                                                "How to use",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    // fontWeight: FontWeight.w400,
                                                    fontFamily: "Poppins Medium",
                                                    fontSize: 20),
                                              ),
                                              )
                                            ] else
                                              const FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: Text(
                                                "How to use",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    // fontWeight: FontWeight.w400,
                                                    fontFamily: "Poppins Medium",
                                                    fontSize: 30),
                                              ),
                                              )
                                          ],
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: (() {
                                            Navigator.pop(context);
                                            SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
                                            
                                          }),
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                          iconSize: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                content: 
widget.sublink.length==32 ?
YoutubePlayer(
  width: MediaQuery.of(context).size.width/2,
    controller: _controllerCovert,
    showVideoProgressIndicator: true,
    // videoProgressIndicatorColor: Colors.amber,
    // progressColors:Colors.amber,
    // onReady () {
    //     _controller.addListener(listener);
    // },
) : YoutubePlayer(
  width: MediaQuery.of(context).size.width/2,
    controller: _controllerOvert,
    showVideoProgressIndicator: true,
    // videoProgressIndicatorColor: Colors.amber,
    // progressColors:Colors.amber,
    // onReady () {
    //     _controller.addListener(listener);
    // },
)
                              ),
                              );
                            });
                      },
                      child: const FittedBox(
                          child: Text(
                        'How to use',
                        style: TextStyle( 
                          // fontWeight: FontWeight.bold
                          fontFamily: "Poppins Medium",
                          fontSize: 8,
                        ),
                      )
                      )),
                          ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
              Container(
                child: Stack(children: [
                  Container(
                    // color: Colors.red,
                    // decoration: BoxDecoration(
                    // border: Border.all(width: 1,
                    // color: Color(0xff003296)
                    // ),
                    // borderRadius: BorderRadius.circular(50), //<-- SEE HERE
                    //                         ),
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Image.network(widget.snapshot.details["imageProd"], 
                       loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                      )),
                     Container(
                    // margin: EdgeInsets.only(left: 0),
                    // color: Colors.yellow,
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Image.asset('assets/authentic_sticker.png'),
                  ),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),
              Container(
                // margin: EdgeInsets.only(left: 10, right: 10),
                // width: MediaQuery.of(context).size.width*0.9,
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Color(0xff003296),
                        width: 8,
                        height: MediaQuery.of(context).size.height / 16,
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.065,
                      // ),
                      SizedBox(width: 7,),
                      Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget.snapshot.details["expiry"] != null) {
                              String temp =
                                      widget.snapshot.details["expiry"].substring(0, 10);
                                  String res = temp.substring(8, 10) +
                                      "-" +
                                      temp.substring(5, 7) +
                                      "-" +
                                      temp.substring(0, 4);
                              showDialog(
                                  // barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Color(0xff002060),
                                      titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                      shape: RoundedRectangleBorder(
                                          //<-- SEE HERE
                                          // side: BorderSide(
                                          //   color: Colors.greenAccent,
                                          // ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10))),
                                      title: Stack(
                                        children: [
                                          Container(
                                              height:
                                                50,
                                              width:
                                                  MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                Color(0xff003296),
                                                Color(0xff662da4)
                                              ])),
                                              // color: Colors.blue,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      600) ...[
                                                    Text(
                                                      "Expiry Details",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: "Poppins Medium",
                                                          // fontWeight:
                                                              // FontWeight.w400,
                                                          fontSize: 20),
                                                    ),
                                                  ] else
                                                    Text(
                                                      "Expiry Details",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: "Poppins Medium",
                                                          // fontWeight:
                                                          //     FontWeight.w400,
                                                          fontSize: 30),
                                                    ),
                                                ],
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: (() {
                                                  // Navigator.of(context).pushAndRemoveUntil(
                                                  //   MaterialPageRoute(
                                                  //       builder: ((context) =>
                                                  //           HomeScreen(first_time: 0,))),
                                                  //   (Route<dynamic> route) => false,
                                                  // );
                                                  Navigator.pop(context);
                                                }),
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ),
                                                iconSize: 20,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      
                                      content: Text(
                                        'The product is good to be used until $res',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                MediaQuery.of(context).size.width *
                                                    0.05),
                                      ),
                                    );
                                  });
                            } else {
                              showDialog(
                                  // barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Color(0xff002060),
                                      titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                      shape: RoundedRectangleBorder(
                                          //<-- SEE HERE
                                          // side: BorderSide(
                                          //   color: Colors.greenAccent,
                                          // ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10))),
                                      title: Stack(
                                        children: [
                                          Container(
                                              height:
                                                50,
                                              width:
                                                  MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                Color(0xff003296),
                                                Color(0xff662da4)
                                              ])),
                                              // color: Colors.blue,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      600) ...[
                                                    Text(
                                                      "Expiry Details",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: "Poppins Medium",
                                                          // fontWeight:
                                                          //     FontWeight.w400,
                                                          fontSize: 20),
                                                    ),
                                                  ] else
                                                    Text(
                                                      "Expiry Details",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: "Poppins Medium",
                                                          // fontWeight:
                                                          //     FontWeight.w400,
                                                          fontSize: 30),
                                                    ),
                                                ],
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: (() {
                                                  // Navigator.of(context).pushAndRemoveUntil(
                                                  //   MaterialPageRoute(
                                                  //       builder: ((context) =>
                                                  //           HomeScreen(first_time: 0,))),
                                                  //   (Route<dynamic> route) => false,
                                                  // );
                                                  Navigator.pop(context);
                                                }),
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ),
                                                iconSize: 20,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      content: Text(
                                        "There is no expiry for this product",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Poppins Medium",
                                            fontSize:
                                                MediaQuery.of(context).size.width *
                                                    0.05),
                                      ),
                                    );
                                  });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Expiry Check',
                            style:
                            //  Theme.of(context).textTheme.bodyMedium,
                            TextStyle(
                            fontFamily: "Poppins Medium",
                            fontSize: 10.8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width * 0.36,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                        child: ElevatedButton(
                          onPressed: () {
                           Details temp_class = new Details();
                          //  if(widget.sublink.length == 32)
                          //  print("===============================covert===========================");
                          //  else if(widget.sublink.length == 31)
                          //  print("=============================overt==============================");
                           temp_class.details["message"] = widget.snapshot.message;
                          temp_class.details["brand"] = widget.snapshot.details["brand"];
                          temp_class.details["serialNo"] = widget.snapshot.details["serialNo"];
                          temp_class.details["price"] = widget.snapshot.details["mrp"];
                          temp_class.details["prodName"] = widget.snapshot.details["prodName"];
                          temp_class.details["imageProd"] = widget.snapshot.details["imageProd"];
                          // temp_class.details["QROnProd"] =
                          //     responseData["batchDetails"]["QROnProd"];
                          temp_class.details["expiry"] = widget.snapshot.details["expiryDate"];
                          temp_class.details["batchNo"] = widget.snapshot.details["batchNo"];
                          temp_class.details["clientId"] = widget.snapshot.details["clientId"];
                          temp_class.details["warrantyApp"] = widget.snapshot.details["warrantyApp"];
                          temp_class.details["warrantyPeriod"] = widget.snapshot.details["warrantyPeriod"];
                          temp_class.details["cashBackApp"] =widget.snapshot.details["cashBackApp"];
                          temp_class.details["cashBackPts"] = widget.snapshot.details["cashBackPts"];
                          temp_class.details["id"] = widget.snapshot.details["id"];
                          temp_class.details["QROnprod"] = widget.snapshot.details["QROnprod"];
                          temp_class.details["mfgDate"] = widget.snapshot.details["mfgDate"];
                          temp_class.details["manuLicenseNo"] = widget.snapshot.details["manuLicenseNo"];
                          temp_class.details["manuAddress"] = widget.snapshot.details["manuAddress"]; 
                          temp_class.details["additionalDetails"] =widget.snapshot.details["additionalDetails"];  
                          temp_class.details["additionalImages"] = widget.snapshot.details["additionalImages"]; 
                          temp_class.details["shelfLife"] = widget.snapshot.details["shelflife"];
                          temp_class.details['tracking']=widget.snapshot.details['tracking']; ///changed
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProdDetails(link:widget.link,snapshot: temp_class),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Text(
                            'Product Details',
                            textAlign: TextAlign.center,
                            style: 
                            // Theme.of(context).textTheme.bodyMedium,
                            TextStyle(
                            fontFamily: "Poppins Medium",
                            fontSize: 10.8,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
             Container(
              child: loading==false?
               Container(
              height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                                       Color(0xff00b7ff), Color(0xffaa2aae)
                                      ])),
                child: ElevatedButton(
                  onPressed: () async {
                   setState(() {
                                  loading=true;
                                });
                  //   CheckUserConnection();
                  // if( ActiveConnection){
                  
                  if(widget.snapshot.details["warrantyApp"] == true)
                  {
                  Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BillUpload(link:widget.link,warrantyPeriod: widget.snapshot.details["warrantyPeriod"], Pimage: widget.snapshot.details["imageProd"], prodName: widget.snapshot.details["prodName"], cashBackPts: widget.snapshot.details["cashBackPts"], cashBackApp: widget.snapshot.details["cashBackApp"], i_value: widget.i_value, clientId: widget.clientId, batchNo: widget.batchNo,)
                        ));
                  }

                  else{
                  await  getData();
                    if (token!.message == "successfull") {
                       setState(() {
                                  loading=false;
                                });
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                          return WillPopScope(
                         onWillPop: () async => false,
                         child:AlertDialog(   
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          // bool warranty_res=false;
                                          bool cash_res=false;
                                          setState(() {
                                          //  if(widget.snapshot.details["warrantyApp"] == true)
                                          //  {
                                          //  warranty_res=true;
                                          //  }
                                            if(token?.couponDetails != null)
                                          {
                                            cash_res=true;
                                          }
                                         });
                                         Navigator.pop(context,cash_res);
                                        //  if (warranty_res)
                                        //  {
                                        //     Navigator.of(context).push(MaterialPageRoute(
                                        //      builder: (context) => BillUpload(warrantyPeriod: widget.snapshot.details["warrantyPeriod"], Pimage: widget.snapshot.details["Pimage"], prodName: widget.snapshot.details["prodName"], cashBackPts: widget.snapshot.details["cashBackPts"], cashBackApp: widget.snapshot.details["cashBackApp"],)
                                        //    ));
                                        //  }
                                          if(cash_res)
                                          {
                                            Navigator.of(context).push(MaterialPageRoute(
                                             builder: (context) => CashBack( cashBackPts: widget.snapshot.details["couponDetails"], )
                                           ));
                                          }
                                          else{

                                          Navigator.of(context)
                                              .push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                   NoCBWar()
                                                    )
                                                    ),
                                            
                                          );
                                          }
                                          // if(widget.snapshot.details["warrantyApp"] == true)
                                          // {
                                           
                                          //  Navigator.of(context).push(MaterialPageRoute(
                                          //    builder: (context) => Warranty(warrantyPeriod: widget.snapshot.details["warrantyPeriod"], Pimage: widget.snapshot.details["Pimage"], prodName: widget.snapshot.details["prodName"], cashBackPts: widget.snapshot.details["cashBackPts"], cashBackApp: widget.snapshot.details["cashBackApp"],)
                                          //  ));
                                          
                                          // }
                                          // else if(widget.snapshot.details["cashBackApp"] == true)
                                          // {
                                          //   Navigator.of(context).push(MaterialPageRoute(
                                          //    builder: (context) => CashBack( cashBackPts: widget.snapshot.details["cashBackPts"], )
                                          //  ));
                                          // }
                                          // else{
                                          // Navigator.of(context)
                                          //     .pushAndRemoveUntil(
                                          //   MaterialPageRoute(
                                          //       builder: ((context) =>
                                          //           HomeScreen(
                                          //             first_time: 0,
                                          //           ))),
                                          //   (Route<dynamic> route) => false,
                                          // );}
                                        }
                                        ),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Product Registered to you Successfully',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            ));
                          });
                    } else if (token!.message ==
                        "Timeout!!! please Rescan the qr codes") {
                           setState(() {
                                  loading=false;
                                });
                      showDialog
                      (
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Already Claimed/Timeout. Please try again with first QR code',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          }
                          );
                    } else if (token!.message ==
                        "This Product has been claimed by someone already.") {
                           setState(() {
                                  loading=false;
                                });
                      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'This Product is already claimed by somebody else. Please try to scan again',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          });
                    } else  {
                       setState(() {
                                  loading=false;
                                });    
                      showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color(0xff002060),
                              titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                              shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  // side: BorderSide(
                                  //   color: Colors.greenAccent,
                                  // ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              title: Stack(
                                children: [
                                  Container(
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff003296),
                                        Color(0xff662da4)
                                      ])),
                                      // color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              600) ...[
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Registration",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 30),
                                            ),
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                        }),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              content: Text(
                                'Something went wrong!!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                            );
                          });
                    }
                  }
                  // else{
                  //     final show_net = SnackBar(
                  //       duration: Duration(seconds: 1),
                  //         content:FittedBox(child:Text(
                  //             'please check your internet connection',
                  //           style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
                  //           textAlign: TextAlign.center,
                  //         ),),
                  //         backgroundColor: Color.fromRGBO(72, 72, 72, 0.9),
                  //         behavior: SnackBarBehavior.floating,
                  //         margin: EdgeInsets.only(
                  //           left: MediaQuery.of(context).size.width * 0.18,
                  //           right: MediaQuery.of(context).size.width * 0.18,
                  //           bottom: MediaQuery.of(context).size.height * 0.05,
                  //         ),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(15.0),
                  //         ));
                  //     ScaffoldMessenger.of(context).showSnackBar(show_net);
                  //   }
                    
                    // if(_isUserAuthorized)
                    // {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => ClaimButt(i_value: widget.i_value, clientId: widget.clientId, batchNo: widget.batchNo,),
                      //   ));
                    // }

                    //     else{
                    //       showDialog(
                    //     context: context,
                    //     builder: (context){
                    //     return AlertDialog(
                    //         title: Text("Error!!!",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    //         content: Text("Authentication Failure"),
                    //     );
                    //     }
                    // );
                  
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'Claim Product',
                    style: 
                    // Theme.of(context).textTheme.bodyMedium,
                    TextStyle(
                    fontFamily: "Poppins Medium",
                    fontSize: 13.6,
                    ),
                  ),
                ),
              ):CircularProgressIndicator()
             )
            ],
          ),
        )));
  }
}
