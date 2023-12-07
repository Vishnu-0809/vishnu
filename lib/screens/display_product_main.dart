import 'package:Veots/screens/scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/not_icon.dart';
import '../widgets/scan_pre_first.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/phone_view.dart';
import 'package:Veots/widgets/actual_genuine_post_sale.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:Veots/widgets/send_accept.dart';
import 'dart:convert';
import '../models/class_models.dart';
import '../widgets/genuine_postsale.dart';
import '../widgets/genuine_presale.dart';
import '../widgets/expired_product.dart';
import '../widgets/info.dart';
import '../widgets/invalid_product.dart';
import '../widgets/fake_product.dart';
import '../widgets/scan_pre_first.dart';
import 'constants.dart';

import 'package:uni_links/uni_links.dart';

import 'login.dart';

String? udid;

// Album_verify? verify;
class DisplayProdMain extends StatefulWidget {
   const DisplayProdMain({super.key, required this.subLink});
  final String subLink;
  @override
  State<DisplayProdMain> createState() => _DisplayProdMainState();
}

class _DisplayProdMainState extends State<DisplayProdMain> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  String link = "";
  late final Future _getDataFuture;
  @override
  void initState() {
    super.initState();
    _getDataFuture = getData();
    print(LOCATION);
    // _getDataFuture = getData();
  }
  
  String dummy = "qwe";
  int requestCount = 1;
  Future getData() async {
      requestCount = requestCount + 1;
    String url =
        "http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/verify/" +
            widget.subLink +
            "/" +
            UDID.toString();
    print(url);
    print("udid: ${UDID}");
    print('-----------');
    print(" loc: ${LOCATION}");
    print(ID);
    print('----------');
    LOCATION = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final response = await createAlbum_verify(
        url, LOCATION, ID.toString(), COMNAME.toString(), widget.subLink);
    var responseData = json.decode(response.body);
    print(responseData);
    if (responseData["message"] == "Invalid Product") // invalid
    {
      InvalidResponse temp_class = new InvalidResponse();
      temp_class.message = responseData["message"];
      return temp_class;
    } else if (responseData["message"] == "Genuine Pre Sale") {
      GenuinePreSale temp_class = new GenuinePreSale();
      temp_class.message = responseData["message"];
      temp_class.details["brand"] = responseData["details"]["brand"];
      temp_class.details["serialNo"] = responseData["details"]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["batchDetails"]["warrantyApp"];
      temp_class.details["price"] = responseData["details"]["price"];
      temp_class.details["prodName"] = responseData["details"]["name"];
      temp_class.details["imageProd"] = responseData["details"]["imageProd"];
      // temp_class.details["QROnProd"] =
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["details"]["expiry"];
      temp_class.details["batchNo"] = responseData["details"]["batchNo"];
      temp_class.details["warranty"] = responseData["details"]["warranty"];
      temp_class.details["imageQrOnProd"] =
          responseData["details"]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
      temp_class.details["shelflife"] = responseData["details"]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["details"]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["details"]["manuAddress"];
      temp_class.details["additionalDetails"] =
          responseData["details"]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["details"]["addtionalImages"];
      temp_class.details['tracking'] = responseData['tracking'];
      temp_class.details["additionalImageDetails"] =
          responseData["details"]["additionalImageDetails"];
        print("wdhbweifuhqwofijqeofnweoviwekfjwcwnociwefnwelf");
        print(temp_class.details["additionalImageDetails"]);

      return temp_class;
    } else if (responseData["message"] == "Expired") {
      Expired temp_class = new Expired();
      temp_class.message = responseData["message"];
      temp_class.imageProd = responseData["image"];
      temp_class.prodName = responseData["name"];
      // temp_class.details['tracking']=responseData['tracking'];
      return temp_class;
    } else if (responseData["message"] == "Fake") {
      Fake temp_class = new Fake();
      temp_class.message = responseData["message"];
      temp_class.image = responseData["image"];
      temp_class.name = responseData["name"];
      temp_class.batchNo = responseData["batchNo"];
      temp_class.reason = responseData["reason"];
      temp_class.preSaleCode = responseData["preSaleCode"];
      // temp_class.details['tracking']=responseData['tracking'];
      // print(temp_class.message);
      return temp_class;
    } else if (responseData["message"] == "claim product") {
      ClaimProd temp_class = new ClaimProd();
      temp_class.message = responseData["message"];
      temp_class.i = responseData["i"];
      temp_class.details["brand"] = responseData["batchDetails"]["brand"];
      temp_class.details["serialNo"] = responseData["batchDetails"]["serialNo"];
      temp_class.details["price"] = responseData["batchDetails"]["mrp"];
      temp_class.details["prodName"] = responseData["batchDetails"]["prodName"];
      temp_class.details["imageProd"] = responseData["batchDetails"]["Pimage"];
      // temp_class.details["QROnProd"] =
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["batchDetails"]["expiryDate"];
      temp_class.details["batchNo"] = responseData["batchDetails"]["batchNo"];
      temp_class.details["clientId"] = responseData["batchDetails"]["clientId"];
      temp_class.details["warrantyApp"] =
          responseData["batchDetails"]["warrantyApp"];
      temp_class.details["warrantyPeriod"] =
          responseData["batchDetails"]["warrantyPeriod"];
      temp_class.details["cashBackApp"] =
          responseData["batchDetails"]["cashBackApp"];
      temp_class.details["cashBackPts"] =
          responseData["batchDetails"]["cashBackPts"];
      temp_class.details["id"] = responseData["batchDetails"]["id"];
      temp_class.details["QROnprod"] = responseData["batchDetails"]["QROnprod"];
      temp_class.details["mfgDate"] = responseData["batchDetails"]["mfgDate"];
      temp_class.details["manuLicenseNo"] =
          responseData["batchDetails"]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["batchDetails"]["manuAdd"]; // changed.....
      temp_class.details["additionalDetails"] =
          responseData["batchDetails"]["addDetails"];

      ///changed
      temp_class.details["additionalImages"] = [
        responseData["batchDetails"]["extraImages"]
      ]; // changed
      temp_class.details["shelflife"] =
          responseData["batchDetails"]["shelfLife"];
      temp_class.details['tracking'] = responseData['tracking'];
      print(temp_class.details);
      // print(responseData);
      return temp_class;
    } else if (responseData["message"] == "Scan pre sale first") {
      ScanPreFirst temp_class = new ScanPreFirst();
      temp_class.message = responseData["message"];
      temp_class.details["brand"] = responseData["details"]["brand"];
      temp_class.details["serialNo"] = responseData["details"]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["batchDetails"]["warrantyApp"];
      temp_class.details["price"] = responseData["details"]["price"];
      temp_class.details["prodName"] = responseData["details"]["name"];
      temp_class.details["imageProd"] = responseData["details"]["imageProd"];
      // temp_class.details["QROnProd"] =
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["details"]["expiry"];
      temp_class.details["batchNo"] = responseData["details"]["batchNo"];
      temp_class.details["warranty"] = responseData["details"]["warranty"];
      temp_class.details["imageQrOnProd"] =
          responseData["details"]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
      temp_class.details["shelflife"] = responseData["details"]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["details"]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["details"]["manuAddress"];
      temp_class.details["additionalDetails"] =
          responseData["details"]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["details"]["addtionalImages"];
      temp_class.details['tracking'] = responseData['tracking'];
      print(responseData["message"]);
      return temp_class;
    } else if (responseData["message"] == "Genuine Post Sale") {
      GenuinePostSale temp_class = new GenuinePostSale();
      temp_class.message = responseData["message"];
      temp_class.details["brand"] = responseData["details"]["brand"];
      temp_class.details["serialNo"] = responseData["details"]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["batchDetails"]["warrantyApp"];
      temp_class.details["price"] = responseData["details"]["price"];
      temp_class.details["prodName"] = responseData["details"]["name"];
      temp_class.details["imageProd"] = responseData["details"]["imageProd"];
      // temp_class.details["QROnProd"] =
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["details"]["expiry"];
      temp_class.details["batchNo"] = responseData["details"]["batchNo"];
      temp_class.details["warranty"] = responseData["details"]["warranty"];
      temp_class.details["imageQrOnProd"] =
          responseData["details"]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
      temp_class.details["shelflife"] = responseData["details"]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["details"]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["details"]["manuAddress"];
      temp_class.details["additionalDetails"] =
          responseData["details"]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["details"]["addtionalImages"];
      temp_class.details['tracking'] = responseData['tracking'];
      temp_class.bill = responseData["bill"]; // chnage billl
      return temp_class;
    } else if (responseData["message"] == "Info" ||
        responseData["message"] == "Tracking") {
      InfoQR temp_class = new InfoQR();
      temp_class.message = responseData["message"];
      temp_class.details["brand"] = responseData["details"]["brand"];
      temp_class.details["serialNo"] = responseData["details"]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["batchDetails"]["warrantyApp"];
      temp_class.details["price"] = responseData["details"]["price"];
      temp_class.details["prodName"] = responseData["details"]["name"];
      temp_class.details["imageProd"] = responseData["details"]["imageProd"];
      // temp_class.details["QROnProd"] =
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["details"]["expiry"];
      temp_class.details["batchNo"] = responseData["details"]["batchNo"];
      temp_class.details["warranty"] = responseData["details"]["warranty"];
      temp_class.details["imageQrOnProd"] =
          responseData["details"]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
      temp_class.details["shelflife"] = responseData["details"]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["details"]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["details"]["manuAddress"];
      temp_class.details["additionalDetails"] =
          responseData["details"]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["details"]["addtionalImages"];
      temp_class.details['tracking'] = responseData['tracking'];
      return temp_class;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: ((context) => const HomeScreen(
                        first_time: 0,
                        mainLink: '',
                        location_on: true,
                      ))),
              (Route<dynamic> route) => false,
            );
            return true;
          },
          child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              body: FutureBuilder(
                future: _getDataFuture,
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Image.asset('assets/loading.gif'),
                      ),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    } else {
                      if (snapshot.data.message == "Genuine Pre Sale") {
                        return GenuinePre(
                          link: widget.subLink,
                          snapshot: snapshot.data,
                          keyD: _scaffoldKey,
                        );
                      } else if (snapshot.data.message == "Expired") {
                        return ExpiredProd(
                            link: widget.subLink,
                            snapshot: snapshot.data,
                            keyD: _scaffoldKey);
                      } else if (snapshot.data.message == "Invalid Product") {
                        return InvalidProd(
                          snapshot: snapshot.data,
                          keyD: _scaffoldKey,
                        );
                      } else if (snapshot.data.message == "Fake") {
                        return FakeProduct(
                            snapshot: snapshot.data,
                            keyD: _scaffoldKey,
                            subLink: widget.subLink);
                      } else if (snapshot.data.message == "claim product") {
                        return GenuinePost(
                          link: widget.subLink, // change
                          snapshot: snapshot.data,
                          i_value: snapshot.data.i,
                          clientId: snapshot.data.details["clientId"],
                          batchNo: snapshot.data.details["batchNo"],
                          keyD: _scaffoldKey,
                          sublink:  widget.subLink,
                        );
                      } else if (snapshot.data.message ==
                          "Scan pre sale first") {
                        return ScanPreFirstScreen(
                          link: "",
                          keyD: _scaffoldKey,
                          snapshot: snapshot.data,
                        );
                        // return const Center(
                        //   child: Text(
                        //     "Scan pre sale first",
                        //     style: TextStyle(
                        //         color: Color(0xff003274),
                        //         fontSize: 30,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // );
                      } else if (snapshot.data.message == "Genuine Post Sale") {
                        return ActualGPSale(
                          link: widget.subLink,
                          snapshot: snapshot.data,
                          keyD: _scaffoldKey,
                        );
                      } else if (snapshot.data.message == "Info" ||
                          snapshot.data.message == "Tracking") {
                        return Info(
                          snapshot: snapshot.data,
                          keyD: _scaffoldKey,
                          link: widget.subLink,
                        );
                      } else {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occurred',
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        } else {
                          if (snapshot.data.message == "Genuine Pre Sale") {
                            return GenuinePre(
                              link: widget.subLink,
                              snapshot: snapshot.data,
                              keyD: _scaffoldKey,
                            );
                          } else if (snapshot.data.message == "Expired") {
                            return ExpiredProd(
                                link: widget.subLink,
                                snapshot: snapshot.data,
                                keyD: _scaffoldKey);
                          } else if (snapshot.data.message == "Invalid Product") {
                            return InvalidProd(
                              snapshot: snapshot.data,
                              keyD: _scaffoldKey,
                            );
                          } else if (snapshot.data.message == "Fake") {
                            return FakeProduct(
                                snapshot: snapshot.data,
                                keyD: _scaffoldKey,
                                subLink: widget.subLink);
                          } else if (snapshot.data.message == "claim product") {
                            return GenuinePost(
                              link: widget.subLink, // change
                              snapshot: snapshot.data,
                              i_value: snapshot.data.i,
                              clientId: snapshot.data.details["clientId"],
                              batchNo: snapshot.data.details["batchNo"],
                              keyD: _scaffoldKey,
                              sublink:  widget.subLink,
                            );
                          } else if (snapshot.data.message ==
                              "Scan pre sale first") {
                            return ScanPreFirstScreen(
                              link: "",
                              keyD: _scaffoldKey,
                              snapshot: snapshot.data,
                            );
                          } else if (snapshot.data.message == "Genuine Post Sale") {
                            return ActualGPSale(
                              link: widget.subLink,
                              snapshot: snapshot.data,
                              keyD: _scaffoldKey,
                            );
                          } else if (snapshot.data.message == "Info" ||
                              snapshot.data.message == "Tracking") {
                            return Info(
                              snapshot: snapshot.data,
                              keyD: _scaffoldKey,
                              link: widget.subLink,
                            );
                          }
                          return Center(
                            child: Text(
                              dummy,
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }
                      }
                    }
                  }}
                  ),
              bottomNavigationBar: poweredby(context),
              drawer: HamWidget())),
    );
  }
}
