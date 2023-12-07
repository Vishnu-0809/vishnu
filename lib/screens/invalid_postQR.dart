import 'package:flutter/material.dart';
import 'home_page.dart';

class InvalidPostQR extends StatelessWidget {
  const InvalidPostQR({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      child: Scaffold(
        body: Center(
            child: Text(
          "Invalid post sale QR please scan the correct post sale QR again",
          style: TextStyle(
              color: Color(0xff002060),
              fontSize: 14,
              fontFamily: "Poppins Medium"),
        )),
      ),
      onWillPop: () async {
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(
        //       builder: ((context) =>  const HomeScreen(
        //             first_time: 0,
        //           ))),
        //   (Route<dynamic> route) => false,
        // );
        return true;
      },
    ));
  }
}
