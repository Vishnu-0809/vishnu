import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class QRScanner extends StatefulWidget {
  QRScanner({Key? key,}) ;
  
 
  @override
  _QRScannerState createState() => _QRScannerState();
}
 
class _QRScannerState extends State<QRScanner> {
  String link = "";
 
 
  @override
  void initState() {
    initUniLinks().then((value) => this.setState(() {
      link = value!;
    }));
    super.initState();
  }
 
  Future<String?> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialLink();
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      return initialLink;
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Qrscanner"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}