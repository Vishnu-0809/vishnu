import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:Veots/screens/rewards_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
// import 'package:Veots/screens/Notifications_view.dart';
// import 'package:Veots/screens/hammburger.dart';
import 'package:Veots/screens/phone_view.dart';
// import 'package:intl/intl.dart';
import 'package:Veots/screens/purchase_history.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Veots/screens/profile_new.dart';
import 'package:Veots/screens/scanner.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:workmanager/workmanager.dart';
// import '../widgets/NetworkCheck.dart';

import '../widgets/not_icon.dart';
// import '../widgets/send_accept.dart';
import 'constants.dart';

// import 'package:badges/badges.dart' as badges;

var credentials;
// bool notification =false;
// OverlayEntry? overlayEntry;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.first_time,required this.mainLink,required this.location_on});
  final int first_time;
  final String mainLink;
    final bool location_on;
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

   var _scaffoldKey = new GlobalKey<ScaffoldState>();
   
   late bool ActiveConnection;


late Timer timer;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loggedin();
    setState(() {
    });
    print('--------------');
    print(widget.mainLink);
    print(widget.location_on);
    print('----------------');
  if(!widget.location_on && widget.mainLink!='' )
      {
      WidgetsBinding.instance.addPostFrameCallback((_)=>locationdialog(context));
      }
  
  }

  Future locationdialog (context)
 {
  return
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
                                              "Warning",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Warning",
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
                                'To access this feature enable Location services',
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

  final pages = [];
  int currentIndex = 0;
  int pageIndex = 0;
  Container BuildNavBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 11,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xffebebeb),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
            child: 
            Column(
              children: [
                Container(
                  height: 30,
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex != 0
                    ? const Icon(
                        Icons.home_outlined,
                        color: Color(0xff002060),
                      )
                    : const Icon(
                        Icons.home,
                        color: Color(0xff002060),
                      )),
                ),
                      const Text(
                        "Home",
                        style: TextStyle(
                            color: Color(0xff003274),
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
              ],
            )
          ),
          FittedBox(
            child: Column(
            children: [
              
              Container(
                height: 30,
                child: IconButton(
                onPressed: ()async {
                  // initState();
                 
                  setState(() {
                    
                    pageIndex = 1;
                  });
                },
                icon: pageIndex != 1
                    ? const Icon(
                        Icons.shopping_cart_outlined,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )
                    : const Icon(
                        Icons.shopping_cart,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )),
              ),
              const Text(
                        "Purchases",
                        style: TextStyle(
                            color: Color(0xff003274),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
            ],
          ),
          ),

          //   Container(
          //     margin: EdgeInsets.only(bottom: 32),
          //     width:  MediaQuery.of(context).size.width*0.1,
          //   decoration: BoxDecoration(
          //       color: Colors.blue,
          //       border: Border.all(
          //         width: 2,
          //         color: Colors.white,
          //       ),
          //       // Make rounded corners
          //       borderRadius: BorderRadius.circular(40)
          // ),
          //       child: IconButton(icon: Icon(Icons.qr_code_scanner, size: MediaQuery.of(context).size.width*0.1,), onPressed: () {},),
          // ),
          FittedBox(
            child: Column(
            children: [
              Container(
                height: 30,
                child: IconButton(
                onPressed: () async {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex != 2
                    ? const Icon(
                        Icons.qr_code_scanner_outlined,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )
                    : const Icon(
                        Icons.qr_code_scanner_rounded,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      ),)
              ),
                      const Text(
                        "Scan Now",
                        style: TextStyle(
                            color: Color(0xff003274),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
            ],
          )
          ),
          FittedBox(
            child: Column(
            children: [
              Container(
                height: 30,
                child: IconButton(
                onPressed: () {
                 
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex != 3
                    ? const Icon(
                        Icons.currency_rupee_outlined,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )
                    : const Icon(
                        Icons.currency_rupee_rounded,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )),
              ),
                      const Text(
                        "Cashback",
                        style: TextStyle(
                            color: Color(0xff003274),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
            ],
          )
          ),
          FittedBox(
            child:Column(
            children: [
              Container(
                height: 30,
                child:
                IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 4;
                  });
                },
                icon: pageIndex != 4
                    ? const Icon(
                        Icons.person_outline,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )
                    : const Icon(
                        Icons.person,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      ))
              ),
                      const Text(
                        "Profile",
                        style: TextStyle(
                            color: Color(0xff003274),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
            ],
          )
          ),
          
        ],
      ),
    );
  }
  void loggedin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() { 
    ID=preferences.getString("id");
    custId_coupon=preferences.getString("custId_coupon");
    
    UDID=preferences.getString("udid");
    NAME=preferences.getString('name');
    GENDER=preferences.getString('gender');
    COMNAME=preferences.getString('companyName');

    DOB=preferences.getString('dob');
    RegExp reg = RegExp(r'^[0-9]{10}$');
    if (
          (ID!.length == 10 && reg.hasMatch(ID.toString()) ))
           {
        MOB_not_EM=true;
      }
      else
      {
        MOB_not_EM=false;
      }
    });
    print(ID);
    print(UDID);
    print(NAME);
    print(MOB_not_EM);
    print(COMNAME);
    print(GENDER);
    print(DOB);
    print(preferences.getString('dob'));
  }
Future<Null> _onrefresh()
{
  
          // insert_overlay(context);
        Not_icon();
          return Future.delayed(Duration(seconds: 0));
        
}
 bool getting_coupons_data = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:WillPopScope(
      onWillPop:null,
      child: Scaffold(
        key: _scaffoldKey,
          body: RefreshIndicator(
            onRefresh:_onrefresh,
            child: SingleChildScrollView(
               physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Image.asset(
                              'assets/veots_logo_wo_tl.png',
                                height: MediaQuery.of(context).size.width * 0.09,
                          width: MediaQuery.of(context).size.width * 0.09,
                            ),
                          ),
                          Container(
                            child: Text("Veots",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Montserrat-SemiBold",fontSize:  MediaQuery.of(context).size.width * 0.042, fontStyle: FontStyle.italic,),),
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                          "Welcome ",
                          style:
                          //  Theme.of(context).textTheme.headlineMedium,
                          TextStyle(
                              color: const Color(0xff002060),
                              fontSize: MediaQuery.of(context).size.width * 0.042,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins Medium" 
                              ),
                        ),
                        if(widget.first_time == 0)
                        Text(
                          "Back, ",
                          style: 
                          // Theme.of(context).textTheme.headlineMedium,
                          TextStyle(
                              color: const Color(0xff002060),
                              fontSize: MediaQuery.of(context).size.width * 0.042,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins Medium"
                              ),
                        ),
                        Text(
                          NAME.toString(),
                          style: 
                          // Theme.of(context).textTheme.headlineMedium,
                          TextStyle(
                              color: const Color(0xff002060),
                              fontSize: MediaQuery.of(context).size.width * 0.042,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins Medium"
                              ),
                        ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 500,
                        ),
                         Text(
                          "Verify your products even before buying",
                          style: 
                          // Theme.of(context).textTheme.bodySmall,
                          TextStyle(
                              color: Color(0xff3b3b3b),
                              // fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * 0.032,
                              fontFamily: "Mont"
                              ),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 400,
                        // ),
                        // Text(
                        //   "Verify your products even",
                        //   style: TextStyle(
                        //       color: const Color(0xff003274),
                        //       fontSize: MediaQuery.of(context).size.width * 0.040,
                        //       fontWeight: FontWeight.bold,
                        //       fontFamily: "Montserrat"),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 400,
                        // ),
                        // Text(
                        //   "before buying",
                        //   style: TextStyle(
                        //       color: const Color(0xff003274),
                        //       fontSize: MediaQuery.of(context).size.width * 0.040,
                        //       fontWeight: FontWeight.bold,
                        //       fontFamily: "Montserrat"),
                        // ),
                        
                       

                      ],
                    ),
                  ),
                  SizedBox(
                          height: MediaQuery.of(context).size.height / 200,
                        ),
                    
 Stack(
      children: [
        CarouselSlider.builder(
          // carouselController: _carouselController,
          
          itemCount: 9,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.24,
            disableCenter: true,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3, milliseconds: 50),
            reverse: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, i, id) {
            String Advertisement = "assets/Frame" + (i + 1).toString() + ".png";
            return GestureDetector(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      final Uri web_url = Uri.parse('https://veots.com/');
                      launchUrl(web_url);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.22,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          Advertisement,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                var url = imgList[i];
                print(url.toString());
              },
            );
          },
        ),
        Positioned(
          bottom: 20.0, // Adjust the position of the dots as needed
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(9, (index) {
              return Container(
                width: 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // color: Colors.red,
                          height: MediaQuery.of(context).size.height / 3.5,
                          width: MediaQuery.of(context).size.width * 0.98,
                          child: Image.asset('assets/qr_cropped.png'),
                        ),
                        Container(
                          // color: Colors.yellow,
                          height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset('assets/home_page_pic.png'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar:
              // ResponsiveBottomBar(
              //     items: const [
              //       BottomBarItem(
              //           title: "Home",
              //           iconData: Icons.home),
              //       BottomBarItem(title: "Purchases", iconData: Icons.shopping_cart),
              //       BottomBarItem(title: "Scan Now", iconData: Icons.qr_code_scanner),
              //       BottomBarItem(title: "Cashback", iconData: Icons.currency_rupee),
              //       BottomBarItem(
              //           title: "Profile", iconData: Icons.person),
              //     ],
              //     currentIndex: currentIndex,
              //     onTap: (int index) {
              //       setState(() {
              //         currentIndex = index;
              //       });
              //     })

              // BuildNavBar(context)),


              CircleNavBar(
        activeIcons:  [
          Icon(Icons.favorite, color: Colors.deepPurple),
          Icon(Icons.person, color: Colors.deepPurple),
          // Icon(Icons.home, color: Colors.deepPurple),
                 FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // height: 40,
                // color: Color(0xff002060),
                decoration: BoxDecoration(
                  color:  Color(0xff002060),
                  border: Border.all(
                    // width: 2,

                  ),
                  borderRadius:BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),

                ),
                child: IconButton(
                onPressed: () async{
                  // CheckUserConnection();
                
	                connectivityResult = await InternetConnectionChecker().hasConnection;
	               if (connectivityResult) {
                  // print(result);
		              //  setState(() {
		              //  ActiveConnection = true;
		              //  });
                   bool result_location =true;
                  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
                  print(serviceEnabled);
                  if (!serviceEnabled) {
                    // Location services are not enabled, request user to enable it.
                     result_location = await dialog(context, "To access this feature enable Location services");
                     serviceEnabled = await Geolocator.isLocationServiceEnabled();
                   
                  }
                   if (serviceEnabled) {
                      
                     Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Scanner2()
                  ));
                    }
                   
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => Scanner2()
                  // ));
	               }
                 else{
                //    setState(() {
	              //  ActiveConnection = false;
	              //  });
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
	              // / if( ActiveConnection){
                  // // setState(() {
                  // //   pageIndex = 2;
                  // // });

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => Scanner2()
                  // ));
                  // }
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
                },
                icon: pageIndex != 2
                    ? Icon(
                        Icons.qr_code_scanner_outlined,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.qr_code_scanner_rounded,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Colors.white,
                      ),)
              ),
              
                      // Text(
                      //   "Scan Now",
                      //   style: TextStyle(
                      //       color: Color(0xff003274),
                      //       // fontSize: MediaQuery.of(context).size.width * 0.040,
                      //       fontSize: 8,
                      //       fontWeight: FontWeight.bold,
                      //       fontFamily: "Montserrat"),
                      // ),
            ],
          )
          ),
          Icon(Icons.favorite, color: Colors.deepPurple),
          Icon(Icons.person, color: Colors.deepPurple),
        ],
        inactiveIcons:  [
          FittedBox(
            child: 
            Column(
              children: [
                Container(
                  // color: Colors.red,
                  height: 30,
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex != 0
                    ? Icon(
                        Icons.home_outlined,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )
                    : Icon(
                        Icons.home,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )),
                ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: Color(0xff002060),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                             fontFamily: "Poppins Medium"),
                      ),
              ],
            )
          ),
          FittedBox(
            child: Column(
            children: [
              Container(
                height: 30,
                child: IconButton(
                onPressed: ()async{
                  // date=DateTime.now();
                  //   SharedPreferences shref= await SharedPreferences.getInstance();
                  //   setState(() {
                      
                  //   });
                    
                  //   print("000000000"); 
                         
                  //   print(await shref.remove("not_len"));            
                  //   print(shref.remove("notification"));
                  //   print(shref.remove('data'));
                  //   print(shref.remove("expiredData"));
                  //   print(shref.remove("weekexpired"));
                  //   // shref.setString('notification', 'show');
                  print("------------------");
                  setState(() {
                    pageIndex = 1;
                  });




                   Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PurchaseHistory()
                  ));

                  
                },
                icon: pageIndex != 1
                    ? Icon(
                        Icons.shopping_cart_outlined,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )
                    : Icon(
                        Icons.shopping_cart,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )),
              ),
              Text(
                        "Purchases",
                        style: TextStyle(
                            color: Color(0xff002060),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                             fontFamily: "Poppins Medium"),
                      ),
            ],
          ),
          ),
          Text("Like"),
           FittedBox(
            child: Column(
            children: [
              Container(
                height: 30,
                child: IconButton(
                onPressed: ()async  {
                  print("rewardssssssssssssssssssssssssssssssssssssssssssss");
                  setState(() {
                         getting_coupons_data = true;
                      });
                    SharedPreferences pref= await SharedPreferences.getInstance();
                    print(LOCATION);
                    //  int? expiryLength=shref.getInt("expiryLength");
                    // print(pref.getStringList("data"));
                    // print( pref.getStringList('expiredData'));
                    // print(   pref.getStringList('weekexpired'));
                    // print(   pref.getStringList("datawarranty"));
                    // print( pref.getStringList('expiredDatawarranty'));
                    // print(  pref.getStringList('weekexpiredwarranty'));
                  // pref.remove("data");
                  // pref.remove('expiredData');
                  // pref.remove('weekexpired');
                  // pref.remove("datawarranty");
                  // pref.remove('expiredDatawarranty');
                  // pref.remove('weekexpiredwarranty');

                      // trycalback();
                    // loginNotification();
                    // loginWarranty();
                    // await shref.setString('notification',"show");
        //             int? expiryLength= await shref.getInt("expiryLength");
        //           int? warrntyLength= await  shref.getInt("warrantyLength");
        // print((expiryLength! + warrntyLength!).toString());
     
        // date=DateTime.now();
        // print(date.day==25);
        print(custId_coupon);
        String url = 'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3005/api/clients/customer/'+custId_coupon!+'/coupons/';
        print("------------------------------");
        print(url);
        print("------------------------------");
 final response = await http.get(Uri.parse(url));
//  print("asd");
                  //  print(response);
                   final jsonData = json.decode(response.body);
                   print("-----------------------------------------");
                   print("coupons details");
                   print(jsonData);                    setState(() {
                         getting_coupons_data = false;
                      });
                   Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => Rewards(coupons_details: jsonData, customerId: custId_coupon.toString())
                  )),
                );
                  setState(() {
                    
                    pageIndex = 3;
                  });
                },
                icon: getting_coupons_data == true ?
                    // ? Icon(
                    //     Icons.currency_rupee_outlined,
                    //     // size: MediaQuery.of(context).size.width * 0.09,
                    //     color: Color(0xff002060),
                    //   )
                    Container(
                      height: 15,
                      width: 13,
                      child: CircularProgressIndicator())
                    : Icon(
                        Icons.currency_rupee_rounded,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )),
              ),
                      Text(
                        "Rewards",
                        style: TextStyle(
                            color: Color(0xff002060),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins Medium"),
                      ),
            ],
          )
          ),
          FittedBox(
            child:Column(
            children: [
              Container(
                height: 30,
                child:IconButton(
                onPressed: () {
                 print("clicked edit");
              // print(DOB);
                  String? hi;
                  print(hi);
                  print(File(hi.toString())==null);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile_new()));
                  setState(() {
                    pageIndex = 4;
                  });
                },
                icon: pageIndex != 4
                    ? Icon(
                        Icons.person_outline,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      )
                    : Icon(
                        Icons.person,
                        // size: MediaQuery.of(context).size.width * 0.09,
                        color: Color(0xff002060),
                      ))
              ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Color(0xff002060),
                            // fontSize: MediaQuery.of(context).size.width * 0.040,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins Medium"),
                      ),
            ],
          )
          ),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 62,
        circleWidth: 62,
        // initIndex: 1,
        // onChanged: (v) {
        //   // TODO
        // },
        // tabCurve: ,
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
        // cornerRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(8),
        //   topRight: Radius.circular(8),
        //   bottomRight: Radius.circular(24),
        //   bottomLeft: Radius.circular(24),
        // ),
        shadowColor: Colors.deepPurple,
        circleShadowColor: Colors.deepPurple,
        // elevation: 10,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [  const Color(0xffebebeb), const Color(0xffebebeb) ],
        ),
        circleGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ const Color(0xffebebeb), const Color(0xffebebeb) ],  
        ), activeIndex: 2,
      ),
      drawer:  HamWidget()
    )
      ));
  }
}

 Future dialog (context,String text)
 {
  return showDialog(
                           
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
                                              "Warning",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Warning",
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
                                           Navigator.of(context).pop(false);                                      }
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
                              content:Container(
                                 height: MediaQuery.of(context).size.height*0.23,
                                child: Column(
                                  
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                 Text(
                                text,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                   Container(
              height: MediaQuery.of(context).size.height / 24,
                width: MediaQuery.of(context).size.width /4.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                                       Color(0xff00b7ff), Color(0xffaa2aae)
                                      ])),
                child: ElevatedButton(
                  onPressed: () async {
                    
                     await Geolocator.openLocationSettings();
                    // openAppSettings();
                 Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'open settings',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontFamily: "Poppins Medium",
                    fontSize: 8,
                    ),
                  ),
                ),
              ),
               Container(
              height: MediaQuery.of(context).size.height / 24,
                width: MediaQuery.of(context).size.width /4.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                                        Color(0xff00b7ff), Color(0xffaa2aae)
                                      ])),
                child: ElevatedButton(
                  onPressed: () async {
                   Navigator.of(context).pop(false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'back',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontFamily: "Poppins Medium",
                    fontSize: 8,
                    ),
                  ),
                ),
              )

                                ],
                              )
                              ],),
                              )
                            )
                            );
                          });
}