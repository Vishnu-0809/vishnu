import 'package:flutter/material.dart';

import 'home_page.dart';

class InvalidLink extends StatelessWidget {
  const InvalidLink({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: ((context) =>  const HomeScreen(
                        first_time: 0,mainLink: '',location_on: true,
                      ))),
              (Route<dynamic> route) => false,
            );
            return true;
          },
    child: Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
                "Scanned Product Details",
                style: TextStyle(
                    color: const Color(0xff0b53be),
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width ,
                child: Image.asset('assets/invalid_cropped.gif', fit: BoxFit.fitWidth,),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),
              Text(
                "Invalid Product",
                style: TextStyle(
                    color: const Color(0xff011f5f),
                    fontSize: MediaQuery.of(context).size.width * 0.060,
                    fontFamily: "Poppins Medium",
                    ),
              ),
        ],)
        // Text("Invalid Link", style: TextStyle(color: Color(0xff002060), fontSize: 14, fontFamily: "Poppins Medium"),)
      ),
    )
      )
    );
  }
}