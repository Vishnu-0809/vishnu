import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:Veots/models/class_models.dart';
import 'package:Veots/screens/InfoQR_prod_details.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:badges/badges.dart' as badges;
import '../screens/Notifications_view.dart';
import '../screens/constants.dart';
import '../screens/home_page.dart';
import '../screens/product_details.dart';
import '../screens/scanner.dart';
import 'not_icon.dart';

class Info extends StatelessWidget {
   Info({super.key, required this.snapshot, required this.keyD, required this.link});
  final String link;
  final InfoQR snapshot;
  final keyD;
  // State<ActualGPSale> createState() => _ActualGPSaleState();


// class _ActualGPSaleState extends State<ActualGPSale> {
  @override
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'SGZXHpGsCSk',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        showLiveFullscreenButton: true
    ),
);
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
                    Image.asset(
                      'assets/veots_logo_wo_tl.png',
                        height: MediaQuery.of(context).size.width * 0.075,
                        width: MediaQuery.of(context).size.width * 0.075,
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
                        keyD.currentState?.openDrawer();    },
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
              //  Theme.of(context).textTheme.headlineMedium,
              TextStyle(
                  color: const Color(0xff002060),
                  fontSize: 16,
                 
                  fontFamily: "Poppins Medium"
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
              // Text(
              //   widget.snapshot.details["prodName"],
              //   style: TextStyle(
              //     color: Color(0xff0b53be),
              //     fontSize: MediaQuery.of(context).size.width * 0.055,
              //   ),
              // ),
          if(snapshot.details["prodName"]!=null)...[
          Text(
            snapshot.details["prodName"],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff00b7ff),
                  // fontSize: MediaQuery.of(context).size.width * 0.055,
                  fontSize: 12,
                  fontFamily: "Poppins Medium"
            ),
          ),]
          else...[
            Text(
            "null",
            style: TextStyle(
              color: const Color(0xff0b53be),
                  fontSize: MediaQuery.of(context).size.width * 0.055,
            ),
          ),
          ],
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
                        style: TextStyle( 
                          // fontWeight: FontWeight.bold
                          fontFamily: "Poppins Medium",
                          fontSize: 8
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
          Stack(children: [
                  Container(
                    // color: Colors.red,
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Image.network(snapshot.details["imageProd"], 
                       loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                      )),
                  //     Positioned(
                  //       top: 30,
                  //       left: 20,
                  //       child: Container(
                  //   // margin: EdgeInsets.only(left: 0),
                  //   // color: Colors.yellow,
                  //   // alignment: Alignment.bottomRight,
                  //   height: MediaQuery.of(context).size.height / 8,
                  //   width: MediaQuery.of(context).size.width * 0.3,
                  //   child: Image.asset('assets/authentic_sticker.png'),
                  // ),),
                ]),
              
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 45,
          // ),
           SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            if(link.length==30||link.length==29)...
            [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline_outlined,
                  color: Colors.green,),
                
                  AnimatedTextKit(
                  totalRepeatCount: 1,
               
                  animatedTexts: [
                      TyperAnimatedText('Location captured for Tracking',
                      speed: const Duration(milliseconds: 40), 
                      textStyle: TextStyle(color: Color(0xff003274),
                      fontFamily: "Poppins Medium",
                      fontSize:MediaQuery.of(context).size.width*0.041,)
                                              
                      ),                 
                     ],
                 ),
                ],
              ),
                  TextButton(
                    onPressed: (){
                                          Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Scanner2()
                  ));
                                        },
                    child: Container(
                             
                                    width: MediaQuery.of(context).size.width*0.36,
                                    height: MediaQuery.of(context).size.height / 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular((5)),
                                      color:const Color(0xFF002060),
                                    ),
                                    
                                      child: Center(
                                        child: Text(
                                            "SCAN NEXT QR",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize:MediaQuery.of(context).size.width *
                                                  0.03 ,
                                            letterSpacing: 2),
                                          ),
                                      ),
                                      ),
                  ),
            ],
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.065,
              // ),
              Container(
                        color: const Color(0xff003296),
                        width: 8,
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      const SizedBox(width: 8,),
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                    child: ElevatedButton(
                      onPressed: () {
                        if (snapshot.details["expiry"] == null) {
                            showDialog(
                                // barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xff002060),
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
                                                MediaQuery.of(context).size.height /
                                                    13,
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
                                                        // fontWeight: FontWeight.w400,
                                                        fontFamily: "Poppins Medium",
                                                        fontSize: 18),
                                                  ),
                                                ] else
                                                  const Text(
                                                    "Expiry Details",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        // fontWeight: FontWeight.w400,
                                                        fontFamily: "Poppins Medium",
                                                        fontSize: 18),
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
                                              18),
                                    ),
                                  );
                                });
                          } else {
                            String temp =
                                snapshot.details["expiry"].substring(0, 10);
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
                                                MediaQuery.of(context).size.height /
                                                    13,
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
                                                        // fontWeight: FontWeight.w400,
                                                        fontFamily: "Poppins Medium",
                                                        fontSize: 18),
                                                  ),
                                                ] else
                                                  const Text(
                                                    "Expiry Details",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        // fontWeight: FontWeight.w400,
                                                        fontFamily: "Poppins Medium",
                                                        fontSize: 18),
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
                                      'This product is good to be used untill $res',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins Medium",
                                          fontSize:
                                              18),
                                    ),
                                  );
                                });
                          }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const FittedBox(
                        child: Text(
                          'Expiry Check',
                          style: TextStyle(
                          fontFamily: "Poppins Medium",
                          fontSize: 13.5
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                    child: ElevatedButton(
                      onPressed: () {
                        // InfoQR temp = new InfoQR();
                        // // temp.Purchase_date = "no";
                        // // if (widget.snapshot.details["brand"] != null)
                        //   temp.details["brand"] = snapshot.details["brand"];
                        // // else
                        // //   temp.brand = "null";
                        // // if(snapshot.details["warranty"] != null)
                        // // temp.duration = snapshot.details["warranty"];
                        // // else
                        // // temp.duration = 0;
                        // // if (widget.snapshot.details["price"] != null)
                        //   temp.details["price"] = snapshot.details["price"];
                        // // else
                        // //   temp.price = 0;
                        //  if (snapshot.details["serialNo"] != null)
                        //     temp.details["serialNo"] = snapshot.details["serialNo"];
                        //   else
                        //     temp.details["serialNo"] = "null";
                        // // if (widget.snapshot.details["imageProd"] != null)
                        // if (snapshot.details["imageProd"] != null)
                        //   temp.details["imageProd"] = snapshot.details["imageProd"];
                        // else
                        //   temp.details["imageProd"] = "null";
                        // // if (snapshot.details["prodName"] != null)
                        //   temp.details["prodName"] = snapshot.details["prodName"];
                        // // else
                        // //   temp.name = "null";
                        // if (snapshot.details["expiry"] != null)
                        // temp.details[""]
                        Details temp_class = new Details();
                        temp_class.details["message"] = snapshot.message;
                        temp_class.details["brand"] = snapshot.details["brand"];
                        temp_class.details["serialNo"] = snapshot.details["serialNo"];
                        // temp_class.details["warrantyApp"] = responseData["batchDetails"]["warrantyApp"];
                        temp_class.details["price"] = snapshot.details["price"];
                        temp_class.details["prodName"] = snapshot.details["prodName"];
                        temp_class.details["imageProd"] = snapshot.details["imageProd"];
                        // temp_class.details["QROnProd"] =
                        //     responseData["batchDetails"]["QROnProd"];
                        temp_class.details["expiry"] =snapshot.details["expiry"];
                        temp_class.details["batchNo"] = snapshot.details["batchNo"];
                        temp_class.details["warranty"] =snapshot.details["warranty"];
                         temp_class.details["imageQrOnProd"] = snapshot.details["imageQrOnProd"];
                         temp_class.details["mfgdate"] =snapshot.details["mfgdate"];
                         temp_class.details["shelflife"] = snapshot.details["shelflife"];
                         temp_class.details["manuLicenseNo"] = snapshot.details["manuLicenseNo"];
                         temp_class.details["manuAddress"] = snapshot.details["manuAddress"];
                         temp_class.details["additionalDetails"] =snapshot.details["additionalDetails"];
                         temp_class.details["additionalImages"] = snapshot.details["additionalImages"];
                         temp_class.details['tracking']=snapshot.details['tracking']; ///changed
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>InfoQRProdDet(snapshot: temp_class),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const FittedBox(
                        child: Text(
                          'Product Details',
                          style: TextStyle(
                          fontFamily: "Poppins Medium",
                          fontSize: 13.5
                          ),
                        ),
                      ),
                    ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
