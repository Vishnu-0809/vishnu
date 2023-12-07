import 'dart:io';

import 'package:Veots/widgets/send_accept.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/class_models.dart';
import '../screens/Notifications_view.dart';
import '../screens/constants.dart';
import '../screens/home_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
// import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'not_icon.dart';


class FakeProduct extends StatelessWidget {
   FakeProduct({super.key, required this.snapshot, required this.keyD, required this.subLink});
  final Fake snapshot;
  final keyD;
  final subLink;


  
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'jY1nvK2wIX0',
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        showLiveFullscreenButton: true
    ),
);
  @override
  Album_report? token;
  String comment = "";
  String? fakebill;
  String postSaleCode = ""; 
   Future<String> getData() async {
    if( subLink.length==32 && subLink[31] == "1")
    postSaleCode = subLink;
    print(snapshot.reason);
    print(ID.toString());
    print(snapshot.preSaleCode);
    print('helo');
    print(UDID.toString());
    print('---------------------------');
    print(LOCATION);
    print('---------------------------');
    print(snapshot.batchNo);
    print('---------------------------');
    print(comment);
    print('---------------------------');
    print(postSaleCode);
    print('---------------------------');
    print(File(fakebill.toString()));
    print(fakebill);
    print('---------------------------');
     token = await createAlbum_report(snapshot.reason
          , ID.toString(), snapshot.preSaleCode, UDID.toString(),  LOCATION, snapshot.batchNo, comment, postSaleCode, fakebill );
    print(token?.message);
    return token!.message;
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child:
        SingleChildScrollView(
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
              style: TextStyle(
                  color: const Color(0xff002060),
                  fontSize: 16,
                  // fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontFamily: "Poppins Medium",
                  // fontWeight: FontWeight.bold
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
              Text(
                snapshot.name,
                style: TextStyle(
                  color: const Color(0xff00b7ff),
                  fontFamily: "Poppins Medium",
                // fontSize: MediaQuery.of(context).size.width * 0.045,
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
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image.network(snapshot.image,
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
                      Container(
                        // margin: EdgeInsets.only(left: 0),
                        alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width * 0.3,
                    child: Image.asset('assets/alert.png'),
                  ),
                  //   ],
                  // )
                ]),
              ),
               SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 45,
              // ),
              Container(
                // alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.85,
                child: Text("This might be a fake product, as it is claimed by somebody else",style: TextStyle(
                  color: Color(0xff002060),
                  // fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontSize: 12,
                  fontFamily: "Poppins Medium",
                ),textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Container(
                // alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.85,
                child: Text("Please click on report button below to help trace fake products.",style: TextStyle(
                  color: const Color(0xffff0000),
                  // fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontFamily: "Poppins Medium",
                  fontSize: 12
                ),textAlign: TextAlign.center,),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                        color: const Color(0xff003296),
                        width: 8,
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      const SizedBox(width: 8,),
                  Container(
  height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width * 0.4,
  decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
  child: ElevatedButton(
        onPressed: () async {
         showDialog(context: context, builder:(context){
                     return
                     FutureBuilder<String>(
                                                future: getData(),
                                                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                  if(snapshot.data == null)
                                                  {
                                                    return
                                                    Center(
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xff002060))),
                                                      ),
                                                    );
                                                  }
                                                  if (snapshot.data == "Successfull") {
                                                    return 
                                                      AlertDialog(
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
                                                          "Confirmation",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 20),
                                                        ),
                                                      ] else
                                                        const Text(
                                                          "Confirmation",
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
                                            'Successfully Reported',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    MediaQuery.of(context).size.width *
                                                        0.05),
                                          ),
                                        );
                                                  }  
                                                  else {
                                                    return  AlertDialog(
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
                                                          "Confirmation",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 20),
                                                        ),
                                                      ] else
                                                        const Text(
                                                          "Confirmation",
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
                                            'Failed to report',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    MediaQuery.of(context).size.width *
                                                        0.05),
                                          ),
                                        );
                                                  }
                                                },
                                           ) ;
                    }
                    );
        },
        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor: Colors.transparent),
        child: const FittedBox(child: Text('Report', style: TextStyle(
          // fontWeight: FontWeight.bold,
        fontFamily: "Poppins Medium",
        fontSize: 15,
        ),),)
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
