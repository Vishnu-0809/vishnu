import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:Veots/screens/cash_back.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


import 'home_page.dart';


class Warranty extends StatefulWidget {
  const Warranty({super.key, required this.warrantyPeriod, required this.Pimage, required this.prodName, required this.cashBackPts, required this.cashBackApp, required this.claim_token});
final warrantyPeriod;
final Pimage;
final prodName;
final cashBackPts;
final cashBackApp;
final claim_token;
  @override
  State<Warranty> createState() => _WarrantyState();
}

class _WarrantyState extends State<Warranty> {
       var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Container poweredby(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Powered By",
              style: TextStyle(
                  color: const Color(0xff002060),
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: "Poppins Medium"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.008,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/veots_logo_wo_tl.png',
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.055,
                      ),
                    ),
                    Text(
                      "Veots",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontFamily: "Montserrat-SemiBold"),
                    ),
                  ],
                )),
          ]),
    );
  }
  void initState() {
    // TODO: implement initState
    super.initState();
     Timer(
      Duration(seconds: 4),
      () { 
        if(widget.claim_token!.couponDetails != null){
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CashBack(cashBackPts: widget.cashBackPts,),
        ),
      );
        }
        else
        {
         Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: ((context) =>  const HomeScreen(
                        first_time: 0,mainLink: '',location_on: true,
                      ))),
              (Route<dynamic> route) => false,
            );
        }
      }
    ); 
  }
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'jY1nvK2wIX0',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        showLiveFullscreenButton: true
    ),
);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
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
                    height:MediaQuery.of(context).size.width * 0.08,
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
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  
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
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
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
                                  // size: MediaQuery.of(context).size.width * 0.06,
                                  color: Colors.white,
                                ))),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  Container(
                          height: MediaQuery.of(context).size.width * 0.08,
                          width: MediaQuery.of(context).size.width * 0.08,
                          decoration: BoxDecoration(
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
                  SizedBox(width: 12,)
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              "Scanned Product Details",
              style: TextStyle(
                  color: Color(0xff002060),
                  fontFamily: "Poppins Medium",
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  // fontWeight: FontWeight.bold
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Text(
              widget.prodName,
              style: TextStyle(
                fontFamily: "Poppins Medium",
                color: Color(0xff00b7ff),
                fontSize: MediaQuery.of(context).size.width * 0.045,
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
                  margin: EdgeInsets.only(right: 30),
                  child: 
                    SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff493979),
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
                      child: FittedBox(
                          child: Text(
                        'How to use',
                        style: TextStyle(
                          fontFamily: "Poppins Medium",
                          fontSize: 8,
                           ),
                      )
                      )),
                          ),
                ),
              ],
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
                    child: 
                    Image.network(widget.Pimage,
                    loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                    )
                    ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                // children: [
                Container(
                  // margin: EdgeInsets.only(left: 0),
                  alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Image.asset('assets/authentic_sticker.png'),
                ),
                //   ],
                // )
              ]),
            ),
            Container(
              // color: Colors.red,
              child: Text(
              "Congratulations!",
              style: TextStyle(
                color: Color(0xff002060),
                fontSize: MediaQuery.of(context).size.width * 0.0715,
                fontFamily: "Poppins Medium",
                height: 1.2, 
              ),
            ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/100,),
            // Container(
            //     // alignment: Alignment.center,
            //     width: MediaQuery.of(context).size.width*0.85,
            //     child: Text("Paperless warranty of ${widget.warrantyPeriod} days activated",style: TextStyle(
            //       color: Color(0xff01b050),
            //       fontSize: MediaQuery.of(context).size.width * 0.035,
            //       fontFamily: "Poppins Medium"
            //     ),textAlign: TextAlign.center,),
            //   ),
              AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                      TyperAnimatedText('Paperless warranty of ${widget.warrantyPeriod} days activated',
                      speed: const Duration(milliseconds: 40), 
                      textStyle: TextStyle(color: Color(0xff01b050),
                      fontFamily: "Poppins Medium",
                      fontSize:MediaQuery.of(context).size.width*0.041,)               
                      ),                 
                     ],
                 ),
          ],
        ),
      ),
      bottomNavigationBar: poweredby(context),
      drawer: HamWidget()
    )
    );
  }
}