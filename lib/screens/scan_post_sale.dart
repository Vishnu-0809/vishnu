import 'package:flutter/material.dart';

class ScanPost extends StatelessWidget {
  const ScanPost({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: 
    WillPopScope(
          onWillPop: () async {
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
            return true;
          },
    child: Scaffold(
      body: Center(child: Text("Please scan hidden QR", style: TextStyle(color: Color(0xff002060), fontSize: 14, fontFamily: "Poppins Medium"),)),
    )
    ));
  }
}