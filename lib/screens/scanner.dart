import 'package:Veots/screens/CompanyNameScreen.dart';
import 'package:Veots/screens/scan_post_sale.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';
import '../widgets/send_accept.dart';
import 'Invalid_postQR.dart';
import 'constants.dart';
import 'display_product_main.dart';
import 'invalid_link.dart';

final companyName = TextEditingController();

class Scanner2 extends StatefulWidget {
  const Scanner2({super.key});

  @override
  State<Scanner2> createState() => _Scanner2State();
}

class _Scanner2State extends State<Scanner2> {
  String image = 'unknown';
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrcontroller;
  String? result = '';
  void camerapermission() async {
    var serviceEnabled;

    var status = await Permission.camera.status;
    if (!status.isGranted) {
      if (status.isDenied) {
        await Permission.camera.request();
        status = await Permission.camera.status;
      }
      if (status.isDenied ||
          status == PermissionStatus.denied ||
          status == PermissionStatus.permanentlyDenied) {
        await dialog(context, 'Please provide camera to access this feature');
        status = await Permission.camera.status;
        if (status.isDenied ||
            status == PermissionStatus.denied ||
            status == PermissionStatus.permanentlyDenied) {
          Navigator.of(context).pop();
        }
      }
    }
  }

  final text = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    check_loaction();
    storage_permission();
    camerapermission();

    print('--------------------');
  }

  @override
  void reassemble() {
    qrcontroller!.pauseCamera(); //<------ reassemble is different for ios
  }

  void check_loaction() async {
    bool serviceEnabled = true;
    var status = await Permission.location.status;
    print(status);
    print("---------");
    if (status.isDenied ||
        status == PermissionStatus.denied ||
        status == PermissionStatus.permanentlyDenied) {
      print("---------");
      await Permission.location.request();
      print("permission");
      status = await Permission.location.status;
      print(status);
      if (status == PermissionStatus.denied ||
          status == PermissionStatus.permanentlyDenied) {
        serviceEnabled = await dialog(
            context, 'Please provide location to access this feature');
      }
      if (serviceEnabled == false ||
          status == PermissionStatus.permanentlyDenied ||
          status == PermissionStatus.denied) {
        Navigator.of(context).pop();
      }
    }
    grant_location(status.isGranted && serviceEnabled);
  }

  void grant_location(loc) async {
    print('jjjjjj');
    print(loc);
    if (loc) {
      LOCATION = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
  }

  void storage_permission() async // storage acces permission
  {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
  }

  @override
  void dispose() {
    qrcontroller?.dispose(); // <--- to use qrcontroller again
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BuildQr(context),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.02,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(80, 0, 0, 0),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.03),
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flash(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    IconButton(
                        iconSize: MediaQuery.of(context).size.height * 0.035,
                        color: Colors.white,
                        icon: Icon(Icons.image),
                        onPressed: (() => {PickImage()})),
                  ],
                ),
              )),
        ],
      )),
    );
  }

  Widget BuildQr(BuildContext context) => QRView(
        key: qrkey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: MediaQuery.of(context).size.width * 0.8,
            borderColor: Colors.white,
            borderWidth: MediaQuery.of(context).size.width * 0.021,
            borderRadius: MediaQuery.of(context).size.width * 0.07,
            borderLength: MediaQuery.of(context).size.width * 0.12),
      );
  void onQRViewCreated(QRViewController qrcontroller) {
    qrcontroller.resumeCamera();
    setState(() {
      this.qrcontroller = qrcontroller;
    });
    this.qrcontroller = qrcontroller;

    qrcontroller.scannedDataStream.listen((barcode) async {
      qrcontroller.pauseCamera();
      setState(() {
        this.result = barcode.code;
      });
      if (this.result.toString().length < 29 ||
          this.result.toString().substring(0, 32) !=
              "http://customer.veots.in/verify/") {
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => InvalidLink())),
        );
      } else if ((this.result.toString().substring(32).length == 30 ||
              this.result.toString().substring(32).length == 29) &&
          (COMNAME == null || COMNAME == "")) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => CompanyNameScreen(
                    sublink: this.result.toString().substring(32),
                  ))),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => DisplayProdMain(
                    subLink: this.result.toString().substring(32),
                  ))),
        );
      }
    });
  }

  Widget Flash() {
    return IconButton(
        color: Colors.white,
        iconSize: MediaQuery.of(context).size.height * 0.035,
        icon: FutureBuilder<bool?>(
          future: qrcontroller?.getFlashStatus(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Icon(snapshot.data! ? Icons.flash_on : Icons.flash_off);
            }
            return Icon(Icons.flash_off);
          },
        ),
        onPressed: () async {
          qrcontroller?.toggleFlash();
          setState(() {});
        });
  }

  PickImage() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      List<Media>? res = await ImagesPicker.pick(
        count: 1,
        pickType: PickType.image,
      );
      if (res != null) {
        String? str = await Scan.parse(res[0].path);
        print(str);
        if (str != null) {
          setState(() {
            this.image = str;
          });
          print(this.image.toString());
          if (this.image.toString().length <= 31 ||
              this.image.toString().substring(0, 32) !=
                  "http://customer.veots.in/verify/") {
            Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => InvalidLink())),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) => DisplayProdMain(
                        subLink: this.image.toString().substring(32),
                      ))),
            );
          }
        }
      }
    }
  }
}

Future dialog(context, String text) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
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
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xff003296),
                          Color(0xff662da4)
                        ])),
                        // color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (MediaQuery.of(context).size.width < 600) ...[
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
                            Navigator.of(context).pop(false);
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
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 24,
                            width: MediaQuery.of(context).size.width / 4.5,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xff00b7ff),
                              Color(0xffaa2aae)
                            ])),
                            child: ElevatedButton(
                              onPressed: () async {
                                await openAppSettings();
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: Text(
                                'open settings',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 24,
                            width: MediaQuery.of(context).size.width / 4.5,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xff00b7ff),
                              Color(0xffaa2aae)
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )));
      });
}
