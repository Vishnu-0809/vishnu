import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../models/class_models.dart';
import '../screens/home_page.dart';
import '../screens/product_details.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';




class ExpiredProd extends StatefulWidget {
   ExpiredProd({super.key, required this.link, required this.snapshot, required this.keyD});
   final String link;
  final Expired snapshot;
  final keyD;
  @override
  State<ExpiredProd> createState() => _ExpiredProdState();
}

class _ExpiredProdState extends State<ExpiredProd> {

void initState() {
    // TODO: implement initState
    () async {
      _startAnimation();
    }();

    super.initState();
  }
   void _startAnimation() {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _isContainerBig = true;
      });
    });
  }

bool _isContainerBig = false;

YoutubePlayerController _controller_info = YoutubePlayerController(
    initialVideoId: 'SGZXHpGsCSk',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        showLiveFullscreenButton: true
    ),
);

YoutubePlayerController _controllerCovert = YoutubePlayerController(
    initialVideoId: 'wHXZknRQhRc',
    flags: YoutubePlayerFlags(
        autoPlay: true,
       
        showLiveFullscreenButton: true
    ),
);
YoutubePlayerController _controllerOvert = YoutubePlayerController(
    initialVideoId: 'MhIWv_EZDhI',
    flags: YoutubePlayerFlags(
        autoPlay: true,
      
        showLiveFullscreenButton: true
    ),
);

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
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: const Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  Container(
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
                                  // size: MediaQuery.of(context).size.width * 0.06,
                                  color: Colors.white,
                                ))),
                      )),
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
            widget.snapshot.details["batchType"] == "Manufacturer" ?
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
            ):
            Text(
              "Scanned Details",
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
          //   if(widget.snapshot.details["batchType"] == "Retailer")...[
          //     if(widget.snapshot.details["brand"] != null)
          //   Text(
          //   widget.snapshot.details["brand"],
          //   style:
          //   //  Theme.of(context).textTheme.headlineSmall,
          //   TextStyle(
          //     color: const Color(0xff00b7ff),
          //     fontSize: 12,
          //         // fontSize: MediaQuery.of(context).size.width * 0.055,
          //         fontFamily: "Poppins Medium",
          //   ),
          // )]
          // else...[
          // if(widget.snapshot.details["prodName"]!=null)...[
          // Text(
          //   widget.snapshot.details["prodName"],
          //   style:
          //   //  Theme.of(context).textTheme.headlineSmall,
          //   TextStyle(
          //     color: const Color(0xff00b7ff),
          //     fontSize: 12,
          //         // fontSize: MediaQuery.of(context).size.width * 0.055,
          //         fontFamily: "Poppins Medium",
          //   ),
          // ),]
          // else...[
          //   Text(
          //   "unable to display name",
          //   style: TextStyle(
          //     color: const Color(0xff0b53be),
          //         fontSize: MediaQuery.of(context).size.width * 0.055,
          //   ),
          // ),
          // ]],
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
                                                    fontWeight: FontWeight.w400,
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
                                                    fontWeight: FontWeight.w400,
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
    controller: widget.snapshot.details["type"] == 1 ? _controller_info :  (widget.snapshot.details["type"] == 2 ? _controllerOvert : _controllerCovert) ,
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
                        style: TextStyle( fontWeight: FontWeight.bold),
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
                  //   border: Border.all(width: 1,
                  //   color: Color(0xff003296)
                  //   ),
                  //   borderRadius: BorderRadius.circular(50), //<-- SEE HERE
                  //                           ),
                    height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width * 0.9,
                    child: Image.network(widget.snapshot.imageProd,
                     loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                    )),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                // children: [
               AnimatedContainer(
                          height: _isContainerBig==true ? 130 : 300,
          duration: Duration(milliseconds: 200),
          width: _isContainerBig==true ? 130 : 300,
          alignment: Alignment.topLeft,
          child: Image.asset(
                        'assets/expired_sticker.png',
                      ),
        ),
                //   ],
                // )
              ]),
            ),

             SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                      TyperAnimatedText(widget.snapshot.details["prodName"],
                      speed: const Duration(milliseconds: 70), 
                      textStyle: TextStyle(color: Color(0xff003274),
                      fontFamily: "Poppins Medium",
                      fontSize:MediaQuery.of(context).size.width*0.041,)
                      ),                 
                     ],
                 ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            Container(
              // color: Colors.red,
              child: Text(
              "This Product is",
              style: TextStyle(
                color: const Color(0xff002060),
                fontSize: MediaQuery.of(context).size.width * 0.040,
                fontFamily: "Montserrat",
                height: 1.2, 
              ),
            ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 65,
            // ),
            Container(
              // color: Colors.yellow,
              child: Text(
              "Expired",
              style: TextStyle(
                color: const Color(0xffff0000),
                fontSize: MediaQuery.of(context).size.width * 0.085,
                height: 1.2, 
                fontFamily: "Montserrat",
              ),
            ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 65,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                        color: Color(0xff003296),
                        width: 8,
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      SizedBox(width: 10,),
                Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                  child: ElevatedButton(
                    onPressed: () {
                      Details temp_class = new Details();
                      // temp.Purchase_date = "no";
                      // // temp.brand = widget.snapshot.details["brand"];
                      // temp.brand = "no";
                      // temp.duration = 0;
                      // // temp.price = widget.snapshot.details["price"];
                      // // if (widget.snapshot.details["serialNo"] != null)
                      // //   temp.serialNo = widget.snapshot.details["serialNo"];
                      // // else
                      // temp.price = 0;
                      // temp.serialNo = "no";
                      // temp.imageProd = snapshot.image;
                      // // temp.imageProd = "null";
                      // temp.name = snapshot.name;
                      // temp.name = "null";
                      // if (widget.snapshot.details["warranty"] != null)
                      //   temp.warranty = widget.snapshot.details["warranty"];
                      // else
                      temp_class.details["message"] = widget.snapshot.message;
                      temp_class.details["image"] = widget.snapshot.imageProd;
                      temp_class.details["prodName"] = widget.snapshot.prodName;
                      temp_class.details["brand"] = widget.snapshot.details["brand"];
                        temp_class.details["serialNo"] = widget.snapshot.details["serialNo"];
                        temp_class.details["warrantyApp"] = widget.snapshot.details["warrantyApp"];
                        temp_class.details["price"] = widget.snapshot.details["price"];
                        temp_class.details["prodName"] = widget.snapshot.details["prodName"];
                        temp_class.details["imageProd"] = widget.snapshot.details["imageProd"];
                        // temp_class.details["QROnProd"] =
                        //     responseData["batchDetails"]["QROnProd"];
                        temp_class.details["expiry"] = widget.snapshot.details["expiry"];
                        temp_class.details["batchNo"] = widget.snapshot.details["batchNo"];
                        temp_class.details["warrantyPeriod"] = widget.snapshot.details["warrantyPeriod"];
                         temp_class.details["imageQrOnProd"] = widget.snapshot.details["imageQrOnProd"];
                         temp_class.details["mfgDate"] = widget.snapshot.details["mfgDate"];
                         temp_class.details["shelflife"] = widget.snapshot.details["shelflife"];
                         temp_class.details["manuLicenseNo"] = widget.snapshot.details["manuLicenseNo"];
                         temp_class.details["manuAddress"] = widget.snapshot.details["manuAddress"];
                         temp_class.details["additionalDetails"] =widget.snapshot.details["additionalDetails"];
                         temp_class.details["additionalImages"] = widget.snapshot.details["additionalImages"];
                        temp_class.details['productVedio']=widget.snapshot.details['productVedio'];
                        temp_class.details['batchType']=widget.snapshot.details['batchType'];
                        temp_class.details['manuWebsiteLink']=widget.snapshot.details['manuWebsiteLink'];
                         print("=====================================");
                         print(widget.snapshot.details["additionalImageDetails"]);
                         print("======================================");
                         
                         temp_class.details["additionalImageDetails"] = widget.snapshot.details["additionalImageDetails"];
                         print(temp_class.details["additionalImageDetails"]);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProdDetails(link: widget.link,snapshot:temp_class),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: FittedBox(
                      child: 
                      widget.snapshot.details["batchType"] == "manufacturer" ?
                                Text(
                                  'Product Details',
                                  style: 
                                  // Theme.of(context).textTheme.bodyMedium,
                                  TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 13.5
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ):
                                 Text(
                          'Details',
                          style: 
                          // Theme.of(context).textTheme.bodyMedium,
                          TextStyle(
                            // fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          fontSize: 12
                          ),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
