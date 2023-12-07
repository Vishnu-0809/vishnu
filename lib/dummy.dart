import 'dart:convert';
import 'dart:io';

import 'package:Veots/dummy2.dart';
import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/track_history.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Veots/widgets/send_accept.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:geolocator/geolocator.dart';

import 'models/class_models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void fun(context1) {
  BuildContext context = context1;
  Scaffold.of(context).openDrawer();
}

class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin {
  String? Filename;
 String? myFuture="";
 late PlatformFile file;
 Album_reupload? reupload;

Future<String?> _pickFile() async {
	
	// opens storage to pick files and the picked file or files
	// are assigned into result and if no file is chosen result is null.
	// you can also toggle "allowMultiple" true or false depending on your need
	final result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['png','pdf']);

	// if no file is picked


	// we get the file from result object
  if(result == null)
  {
    return null;
  }
	  file = result.files.first;
   setState(() {
                Filename=file.name;
              });
      return file.path;
	// _openFile(file);
}
  String? myData;

  Future<String> _calculation() async => Future<String>.delayed(
        const Duration(seconds: 3),
        () => 'Loaded',
      );

  Future getData() async {
    String url =
        "http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/verify/" +
            '77852045121605230614app280400000' +
            "/" +
            UDID.toString();
    print(url);
    print("udid: ${UDID}");
    print('-----------');
    print(LOCATION);
    print(ID);
    print('----------');
    final response = await createAlbum_verify(url,LOCATION,ID.toString(),COMNAME.toString(),'86667547731605230614app280400000');
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
       temp_class.details["imageQrOnProd"] = responseData["details"]["imageQrOnProd"];
       temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
       temp_class.details["shelflife"] = responseData["details"]["shelflife"];
       temp_class.details["manuLicenseNo"] = responseData["details"]["manuLicenseNo"];
       temp_class.details["manuAddress"] = responseData["details"]["manuAddress"];
       temp_class.details["additionalDetails"] = responseData["details"]["addtionalDetails"];
       temp_class.details["additionalImages"] = responseData["details"]["addtionalImages"];
       temp_class.details['tracking']=responseData['tracking'];
      print("returning object");
      return temp_class;
    } else if (responseData["message"] == "Expired") {
      Expired temp_class = new Expired();
      temp_class.message = responseData["message"];
      temp_class.imageProd = responseData["image"];
      temp_class.prodName = responseData["name"];
      return temp_class;
    } else if (responseData["message"] == "Fake") {
      Fake temp_class = new Fake();
      temp_class.message = responseData["message"];
      temp_class.image = responseData["image"];
      temp_class.name = responseData["name"];
      temp_class.batchNo = responseData["batchNo"];
      temp_class.reason = responseData["reason"];
      temp_class.preSaleCode = responseData["preSaleCode"];
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
      temp_class.details["warrantyApp"] = responseData["batchDetails"]["warrantyApp"];
      temp_class.details["warrantyPeriod"] = responseData["batchDetails"]["warrantyPeriod"];
      temp_class.details["cashBackApp"] = responseData["batchDetails"]["cashBackApp"];
      temp_class.details["cashBackPts"] = responseData["batchDetails"]["cashBackPts"];
      temp_class.details["id"] = responseData["batchDetails"]["id"];
      temp_class.details["QROnprod"] = responseData["batchDetails"]["QROnprod"];
      temp_class.details["mfgDate"] = responseData["batchDetails"]["mfgDate"];
      temp_class.details["manuLicenseNo"] = responseData["batchDetails"]["manuLicenseNo"];
      temp_class.details["manuAddress"] = responseData["batchDetails"]["manuAdd"]; // changed.....
      temp_class.details["additionalDetails"] = responseData["batchDetails"]["addDetails"]; ///changed
      temp_class.details["additionalImages"] = [responseData["batchDetails"]["extraImages"]]; // changed 
      temp_class.details["shelflife"] = responseData["batchDetails"]["shelfLife"];
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
       temp_class.details["imageQrOnProd"] = responseData["details"]["imageQrOnProd"];
       temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
       temp_class.details["shelflife"] = responseData["details"]["shelflife"];
       temp_class.details["manuLicenseNo"] = responseData["details"]["manuLicenseNo"];
       temp_class.details["manuAddress"] = responseData["details"]["manuAddress"];
       temp_class.details["additionalDetails"] = responseData["details"]["addtionalDetails"];
       temp_class.details["additionalImages"] = responseData["details"]["addtionalImages"];
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
       temp_class.details["imageQrOnProd"] = responseData["details"]["imageQrOnProd"];
       temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
       temp_class.details["shelflife"] = responseData["details"]["shelflife"];
       temp_class.details["manuLicenseNo"] = responseData["details"]["manuLicenseNo"];
       temp_class.details["manuAddress"] = responseData["details"]["manuAddress"];
       temp_class.details["additionalDetails"] = responseData["details"]["addtionalDetails"];
       temp_class.details["additionalImages"] = responseData["details"]["addtionalImages"];
        temp_class.bill = responseData["bill"]; // chnage billl 
      return temp_class;
    }
    else if (responseData["message"] == "Info" || responseData["message"] == "Tracking") {
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
       temp_class.details["imageQrOnProd"] = responseData["details"]["imageQrOnProd"];
       temp_class.details["mfgdate"] = responseData["details"]["mfgdate"];
       temp_class.details["shelflife"] = responseData["details"]["shelflife"];
       temp_class.details["manuLicenseNo"] = responseData["details"]["manuLicenseNo"];
       temp_class.details["manuAddress"] = responseData["details"]["manuAddress"];
       temp_class.details["additionalDetails"] = responseData["details"]["addtionalDetails"];
       temp_class.details["additionalImages"] = responseData["details"]["addtionalImages"];
       
      return temp_class;
    }
  }
 late  AnimationController _controller;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );
    getData();
  }
  Widget buildThis() {
    return FutureBuilder(
        // future,
        builder: (context, snapshot) {
      if (myData == 'Loaded') {
        return Text(myData!);
        } else if (myData == 'Error') {
        return Text(myData!);
      }
      return Text('Loading');
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body:
       FutureBuilder(
              future: getData(),
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
                    return  Center(
                      child:ElevatedButton(
                        child:Text('next'),
                      onPressed: () {
                        print(snapshot.data.details['tracking']);
                      //   List tracking= snapshot.data.details['tracking'];
                      //   tracking.insert(0, {'manuAddress':snapshot.data.details['manuAddress']});
                      //   print(tracking);
                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  Tracking_history(tracking: tracking)),
                      // );
                       
                      },),

                    );
                    
                  }
                }
                 return Center(
                      child: Text(
                        'not recieved',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                }
              }
    //         ), Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
            
    //           TextButton(onPressed: getData,child: Text("hello")),

              
                                  
                                
    // // AnimatedIcon(icon: AnimatedIcons., progress: _controller)
    // // AnimatedHeartIcon()
    
   
              
    //         ],
    //       ),
    //     ],
    //   ),
    )
    );
  }
}



// class AnimatedHeartIcon extends StatefulWidget {
//   @override
//   _AnimatedHeartIconState createState() => _AnimatedHeartIconState();
// }

// class _AnimatedHeartIconState extends State<AnimatedHeartIcon>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     // _controller = AnimationController(
//     //   vsync: this,
//     //   duration: Duration(seconds: 1),
//     // )..repeat(reverse: true);
//     // _animation = Tween<double>(
//     //   begin: 0.0,
//     //   end: 1.0,
//     // ).animate(_controller);
//     Animation _animation = Tween<double>(begin: 0, end: 1)
//   .animate(CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeInOutCirc)
//   );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (BuildContext context, Widget ) {
//         return Icon(
//           Icons.check_circle_outline_outlined,
//           color: Colors.green,
//           size: 30.0 + (10.0 * _animation.value),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

              
           