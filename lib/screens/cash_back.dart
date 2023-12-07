import 'dart:async';

import 'package:flutter/material.dart';

import 'package:Veots/widgets/ham.dart';


import 'home_page.dart';
import 'login.dart';

class CashBack extends StatefulWidget {
  const CashBack({super.key, required this.cashBackPts});
  final cashBackPts;
  @override
  State<CashBack> createState() => _CashBackState();
}

class _CashBackState extends State<CashBack> {
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
      Duration(seconds: 4,),
      () { 
        
          Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: ((context) => const HomeScreen(
                                    first_time: 0,mainLink: '',location_on: true,
                                  ))),
                          (Route<dynamic> route) => false,
                        );
      }
    );
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                          //       builder: ((context) => const HomeScreen(
                          //             first_time: 0,
                          //           ))),
                          //   (Route<dynamic> route) => false,
                          // );
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: const Color(0xff002060),
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
                         height: MediaQuery.of(context).size.width * 0.075,
                        width: MediaQuery.of(context).size.width * 0.075,
                    ),
                  ),
                  const Spacer(),
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
                        _scaffoldKey.currentState?.openDrawer();    },
                               child: Icon(
                                  Icons.menu,
                                  size: MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),   
        ),
                            ),
                          )),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Stack(
              children: [
                Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/coupon_gift.gif',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.17,
                  top: MediaQuery.of(context).size.height/30,
                  child: Text(
                    "Congratulations",
                    style: TextStyle(
                      color: const Color(0xff002060),
                      fontSize: MediaQuery.of(context).size.width * 0.068,
                      fontFamily: "Poppins Medium",
                      // height: 1.2,
                    ),
                  ),
                ),
                Positioned(
                left:MediaQuery.of(context).size.width*0.26,
                top: MediaQuery.of(context).size.height/2.15,
                child: 
                Text(
                  "You won a reward!",
                  style: TextStyle(
                    color: const Color(0xff008037),
                    fontSize: MediaQuery.of(context).size.width * 0.050,
                    fontFamily: "Poppins Medium",
                    // height: 1.2,
                  ),
                ),
                ),
                // Positioned(
                // top: MediaQuery.of(context).size.height/2,
                // left: MediaQuery.of(context).size.width*0.38,
                // child: 
                // Text(
                //   "received",
                //   style: TextStyle(
                //     color: const Color(0xff008037),
                //     fontSize: MediaQuery.of(context).size.width * 0.050,
                //     fontFamily: "Poppins Medium",
                //     // height: 1.2,
                //   ),
                // ),
                // ),
              ],
            )
          ],
        ),
      ),
       bottomNavigationBar: poweredby(context),
       drawer:  HamWidget()
    )
    );
  }
}
