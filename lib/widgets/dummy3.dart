import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


class dummy3 extends StatefulWidget {
  const dummy3({super.key});

  @override
  State<dummy3> createState() => _dummy3State();
}

class _dummy3State extends State<dummy3> {
  void fun(){
//    DateTime today = DateTime.now(); // get today's date
// DateTime specificDate = DateTime(2023, 5, 15); // specify the specific date

// // calculate the difference in days between today and the specific date
// Duration difference = specificDate.difference(today);
// int days = difference.inDays;

// print('Days between today and specific date: $days');
print(Platform.isIOS);
launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );

  }
  final url = Uri.parse("https://play.google.com/store/apps/details?id=com.Veots");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(child: 
      ElevatedButton(onPressed: ()async{
        try {
	final result = await InternetAddress.lookup('google.com');
	if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
		print("yes");
	}
  else{
    print("no");
  }
	} on SocketException catch (_) {
	print("no");
	}
      }, child: Text("check"))
            )
    );
  }
}