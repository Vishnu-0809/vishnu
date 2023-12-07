import 'dart:io';
import 'package:flutter/material.dart';
import 'package:Veots/screens/hidden_qr.dart';
// import 'package:Veots/screens/phone_view.dart';
import 'package:Veots/screens/product_details.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../models/class_models.dart';
// import '../screens/Notifications_view.dart';
// import '../screens/constants.dart';
import '../screens/home_page.dart';
import '../screens/psmm_report.dart';
// import '../screens/scanner.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
// import 'package:badges/badges.dart' as badges;
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/scanning_post_sale.dart';
import 'not_icon.dart';
// import 'package:progressive_image/progressive_image.dart';


class GenuinePre extends StatefulWidget {
   GenuinePre({super.key,required this.link, required this.snapshot, required this.keyD});
   final String link;
  final GenuinePreSale snapshot;
  final keyD;
  
  @override
  State<GenuinePre> createState() => _GenuinePreState();
}

class _GenuinePreState extends State<GenuinePre> {
  @override
  String reason  = "postsale mismatch";
  bool scan_hidden_code_loading = false;
  late bool ActiveConnection;
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'wHXZknRQhRc',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        showLiveFullscreenButton: true
    ),
);

// Future CheckUserConnection() async {
//   print("in function");
// 	try {
// 	final result = await InternetAddress.lookup('google.com');
// 	if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
// 		setState(() {
// 		ActiveConnection = true;
// 		});
// 	}
//   else{
//     setState(() {
// 	ActiveConnection = false;
// 	});
//   }
// 	} on SocketException catch (_) {
// 	setState(() {
// 	ActiveConnection = false;
// 	});
// 	}
// }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        color: const Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  Container(
                    // color: Colors.red,
                    child: Image.asset(
                      'assets/veots_logo_wo_tl.png',
                 height: MediaQuery.of(context).size.width * 0.075,
                        width: MediaQuery.of(context).size.width * 0.075,
                    ),
                  ),
                  const Spacer(),
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
                        widget.keyD.currentState?.openDrawer();    },
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
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              "Scanned Product Details",
              style: 
              // Theme.of(context).textTheme.headlineMedium,
              TextStyle(
                  color: const Color(0xff002060),
                  fontSize:16,
                  //  MediaQuery.of(context).size.width * 0.045,
                  fontFamily: "Poppins Medium"
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            if(widget.snapshot.details["prodName"]!=null)
            Text(
              widget.snapshot.details["prodName"],
              textAlign: TextAlign.center,
              style: 
              // Theme.of(context).textTheme.headlineSmall,
              TextStyle(
                color: const Color(0xff00b7ff),
                // fontSize: MediaQuery.of(context).size.width * 0.045,
                fontSize: 12,
                fontFamily: "Poppins Medium"
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

YoutubePlayer(
  width: MediaQuery.of(context).size.width/2,
    controller: _controller,
    showVideoProgressIndicator: true,
    // videoProgressIndicatorColor: Colors.amber,
    // progressColors:Colors.amber,
    // onReady () {
    //     _controller.addListener(listener);
    // },
),
                              ),
                              );
                            });
                      },
                      child: const FittedBox(
                          child: Text(
                        'How to use',
                        style: TextStyle( fontFamily: "Poppins Medium"),
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
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: 
                    Image.network(widget.snapshot.details["imageProd"],
                    loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                    )
                    ),
                Container(
                  // margin: EdgeInsets.only(left: 0),
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width * 0.4,
              child:   ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff002060),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          const EdgeInsets.all(10)), //content padding inside button)
                  onPressed: () async{
                    try {
	                  final result = await InternetAddress.lookup('google.com');
	                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
	                  	Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScanPostSale(),
                    ));
	                  }
                    else{
                      final show_net = SnackBar(
                        duration: Duration(seconds: 1),
                          content:FittedBox(child:Text(
                              'please check your internet connection',
                            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
                            textAlign: TextAlign.center,
                          ),),
                          backgroundColor: Color.fromRGBO(72, 72, 72, 0.9),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.18,
                            right: MediaQuery.of(context).size.width * 0.18,
                            bottom: MediaQuery.of(context).size.height * 0.05,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(show_net);
                    }
	                  } on SocketException catch (_) {
	                  print("no");
	                   }
                  },
                  child: const FittedBox(
                      child: Text(
                    'Scan Hidden Code',
                    style: TextStyle(fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Poppins Medium"
                    ),
                  ))
                  )  ,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            Container(
              // alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.76 ,
              child: Text(
                "Register the product to you by scanning the hidden QR code after purchase",
                style: 
                // Theme.of(context).textTheme.bodySmall,
                TextStyle(
                  color: Color(0xff002060),
                  fontSize: MediaQuery.of(context).size.width * 0.030,
                  // fontSize: 10.2,
                  fontFamily: "Poppins Medium"
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 85,
            ),
            Container(
              // margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width*0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xff003296),
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: 8,
                  ),
                  const SizedBox(width: 10,),
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
                              onPressed: () {
                                if (widget.snapshot.details["expiry"] == null) {
                                  showDialog(
                                      // barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Color(0xff002060),
                                          titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          shape: const RoundedRectangleBorder(
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
                                                        const Text(
                                                          "Expiry Details",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: "Poppins Medium",

                                                              fontSize: 20),
                                                        ),
                                                      ] else
                                                        const Text(
                                                          "Expiry Details",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: "Poppins Medium",
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
                                          content: Text(
                                            'There is no expiry for this product',
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
                                } else {
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
                                          shape: const RoundedRectangleBorder(
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
                                                        const Text(
                                                          "Expiry Details",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: "Poppins Medium",
                                                              fontSize: 20),
                                                        ),
                                                      ] else
                                                        const Text(
                                                          "Expiry Details",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontFamily: "Poppins Medium",
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
                                          res==null?null:
                                           Text(
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
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: FittedBox(
                                child: Text(
                                  'Expiry Check',
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
                        Details temp_class = new Details();
                        temp_class.details["message"] = widget.snapshot.message;
                        temp_class.details["brand"] = widget.snapshot.details["brand"];
                        temp_class.details["serialNo"] = widget.snapshot.details["serialNo"];
                        // temp_class.details["warrantyApp"] = responseData["batchDetails"]["warrantyApp"];
                        temp_class.details["price"] = widget.snapshot.details["price"];
                        temp_class.details["prodName"] = widget.snapshot.details["prodName"];
                        temp_class.details["imageProd"] = widget.snapshot.details["imageProd"];
                        // temp_class.details["QROnProd"] =
                        //     responseData["batchDetails"]["QROnProd"];
                        temp_class.details["expiry"] = widget.snapshot.details["expiry"];
                        temp_class.details["batchNo"] = widget.snapshot.details["batchNo"];
                        temp_class.details["warranty"] = widget.snapshot.details["warranty"];
                         temp_class.details["imageQrOnProd"] = widget.snapshot.details["imageQrOnProd"];
                         temp_class.details["mfgdate"] = widget.snapshot.details["mfgdate"];
                         temp_class.details["shelflife"] = widget.snapshot.details["shelflife"];
                         temp_class.details["manuLicenseNo"] = widget.snapshot.details["manuLicenseNo"];
                         temp_class.details["manuAddress"] = widget.snapshot.details["manuAddress"];
                         temp_class.details["additionalDetails"] =widget.snapshot.details["additionalDetails"];
                         temp_class.details["additionalImages"] = widget.snapshot.details["additionalImages"];
                         print("=====================================");
                         print(widget.snapshot.details["additionalImageDetails"]);
                         print("======================================");
                         
                         temp_class.details["additionalImageDetails"] = widget.snapshot.details["additionalImageDetails"];
                         print(temp_class.details["additionalImageDetails"]);
                         temp_class.details['tracking']=widget.snapshot.details['tracking']; ///changed
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProdDetails(link:widget.link,snapshot: temp_class),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child:  FittedBox(
                                child: Text(
                                  'Product Details',
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 45,
                      ),
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
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HiddenQR(
                                    image: widget.snapshot.details["imageQrOnProd"],
                                  ),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: FittedBox(
                                child: Column(
                                  children:  [
                                    Text(
                                  'Hidden QR',
                                  style:
                                  //  Theme.of(context).textTheme.bodyMedium,
                                  TextStyle(
                                  fontSize: 13.5,
                                  fontFamily: "Poppins Medium",
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                                Text(
                                  '(placement)',
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 9.1,
                                  // fontSize: MediaQuery.of(context).size.width*0.020
                                  ),
                                ),
                                  ],
                                )
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
                                Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  BillUploadcomment(snapshot: widget.snapshot, subLink: widget.link,
                    )));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: FittedBox(
                                child: Column(
                                  children:  [
                                    Text(
                                  'Report',
                                  style:
                                  TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 13.5,
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                                Text(
                                  '(Hidden QR mismatch)',
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 9.1
                                  // fontSize: MediaQuery.of(context).size.width*0.020
                                  ),
                                ),
                                  ],
                                )
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
      ),
    );
  }
}
