import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

class NoCBWar extends StatefulWidget {
  const NoCBWar({super.key});

  @override
  State<NoCBWar> createState() => _NoCBWarState();
}

class _NoCBWarState extends State<NoCBWar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
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
    return SafeArea(child: 
    
    Scaffold(body: Center(child: Text(
              "This product doesn't have warranty and cash back",
              style: TextStyle(
                  color: Color(0xff0b53be),
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
            ),),));
  }
  }



// class NoCBWar extends StatelessWidget {
//   @override
//   const NoCBWar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: 
    
//     Scaffold(body: Center(child: Text(
//               "This product doesn't have warranty and cash back",
//               style: TextStyle(
//                   color: Color(0xff0b53be),
//                   fontSize: MediaQuery.of(context).size.width * 0.045,
//                   fontWeight: FontWeight.bold),
//             ),),));
//   }
// }
