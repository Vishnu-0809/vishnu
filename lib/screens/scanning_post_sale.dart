import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';
import 'package:Veots/screens/Invalid_postQR.dart';

import 'package:Veots/screens/scan_post_sale.dart';

import 'CompanyNameScreen.dart';
import 'constants.dart';
import 'display_product_main.dart';
import 'invalid_link.dart';
// import 'invalid_link.dart';


class ScanPostSale extends StatefulWidget {
  const ScanPostSale({super.key});

  @override
  State<ScanPostSale> createState() => _ScanPostSaleState();
}

class _ScanPostSaleState extends State<ScanPostSale> {
  String image = 'unknown';
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrcontroller;
  String? result = '';

  final text = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    storage_permission();
  }

  @override
  void reassemble() {
    qrcontroller!.pauseCamera(); //<------ reassemble is different for ios
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

    qrcontroller.scannedDataStream.listen((barcode) {
      qrcontroller.pauseCamera();
      setState(() {
        this.result = barcode.code;
      });
      if (this.result.toString().length <= 32 || this.result.toString().substring(0,32)!="http://customer.veots.in/verify/") {
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => InvalidPostQR())),
        );
      }
      else if((this.result.toString().substring(32).length==30 ||this.result.toString().substring(32).length==29) && COMNAME==null) 
      {
        print("inside 29");
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => CompanyNameScreen(
                    sublink: this.result.toString().substring(32),
                  ))),
        );

          }
      else if (  this.result.toString().substring(63) == "1" ) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => DisplayProdMain(
                    subLink: this.result.toString().substring(32),
                  ))),
        );
        print(this.result.toString().substring(63));
      }
       else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => ScanPost())),
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
        if (str != null) {
          setState(() {
            this.image = str;
          });
          if (this.image.toString().length <= 32 || this.image.toString().substring(0,32)!="http://customer.veots.in/verify/") {
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => InvalidPostQR())),
        );
      }
         else  if (this.image.toString().substring(63) == "1") {
            print(this.image.toString());
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => DisplayProdMain(
                    subLink: this.image.toString().substring(32),
                  ))),
        );
        print(this.image.toString().substring(63));
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => ScanPost())),
        );
      }
        }
      }
    }
  }
}
