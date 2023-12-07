

import 'dart:core';
import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:badges/badges.dart' as badges;
import 'package:Veots/screens/constants.dart';
import 'package:Veots/widgets/send_accept.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:pdf_render/pdf_render_widgets.dart';

import 'package:Veots/screens/warranty.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/class_models.dart';
import '../widgets/not_icon.dart';
import 'Notifications_view.dart';
import 'home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:open_file/open_file.dart';



class  BillUploadcomment extends StatefulWidget {
  const  BillUploadcomment({super.key,required this.snapshot,required this.subLink});
// final String link;
// final warrantyPeriod;
// final Pimage;
// final prodName;
// final cashBackPts;
// final cashBackApp;
// final int i_value;
//   final String clientId;
//   final String batchNo;
final GenuinePreSale snapshot;
final subLink;
  @override
  State< BillUploadcomment> createState() => _MyWidgetState();
}

class _MyWidgetState extends State< BillUploadcomment> {
//   final ImagePicker imgpicker = ImagePicker();
// List<XFile>? imagefiles;


//   openImages() async {
// try {
//     var pickedfiles = await imgpicker.pickMultiImage();
//     //you can use ImageCourse.camera for Camera capture
//     if(pickedfiles != null){
//         imagefiles = pickedfiles;
//         setState(() {
//         });
//     }else{
//         print("No image is selected.");
//     }
// }catch (e) {
//     print("error while picking file.");
// }
//   }
  TextEditingController _Comment = TextEditingController();
  Album_report? token;
  Future<String> getData() async {
    String reason  = "postsale mismatch";
    String postSaleCode = "";
    print(MOB_not_EM);
    print("checking details");
    print(reason);
    print(ID.toString());
    print(widget.subLink);
    print(UDID.toString());
    print(LOCATION);
    print(widget.snapshot.details["batchNo"]);
    print(_Comment.text.toString());
    print(postSaleCode);
    print(myFuture!);
    String type= MOB_not_EM! ? "mobile" :"email"; 
    token = await createAlbum_report(reason
          , ID.toString(), widget.subLink, UDID.toString(),  LOCATION, widget.snapshot.details["batchNo"], _Comment.text.toString(), postSaleCode, myFuture.toString() );
    print(token?.message);
    return token!.message;
  }

//  Future<dynamic> _upload() async {
//             if (file== null) return;
//             String fileName = file.path!.split('/').last;
//            FormData formData = new FormData.fromMap({
//   "name": hospitalNameEng,
//   "Services": servicejson,
//   "Image": {
//       "image": await MultipartFile.fromFile(imageFile.path,
//           filename: imageFileName, contentType: new MediaType('image', 'png')),
//       "type": "image/png"
//   },
// });
//            return await Dio()
//         .post("https://7fd2-61-1-116-149.in.ngrok.io/customer/claim-product",data:formData).
//     then((dynamic result){
//     print(result.toString());
// });
// }

final pdf = pw.Document();
createPDF() async {
    for (var img in imageFileList!) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }
  
  //  savePDF() async {
  //   // await FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  // }


      
      final ImagePicker imagePicker = ImagePicker();
      List<File>? imageFileList = [];

      Future<String?> selectImages() async {
         final PickedFile? selectedImages = (await 
                // ignore: deprecated_member_use
                imagePicker.getImage(source: ImageSource.gallery));
         File selected = File(selectedImages!.path);
              imageFileList!.add(selected);
           
          print("Image List Length:" + imageFileList!.length.toString());
          // final file = imageFileList!.first;
          setState((){
            
          });
          return imageFileList!.first.path;
      }


//image uploader
    var filepath;
String my='nofile';
     var _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Future<String> _calculation() async => Future<String>.delayed(
  //       const Duration(),
  //       () => 'Loaded',
  //     );

  // Future<void> getData() async {
  //   var a = await _pickFile().timeout(
  //     const Duration(),
  //     onTimeout: () => 'Error',
  //   );

  //   setState(() {
  //     myFuture = a;
  //   });
 bool loading=false;
 String? Filename;
 String? myFuture="";
 late PlatformFile file;
 Future<String?> _pickFile() async {
	
	// opens storage to pick files and the picked file or files
	// are assigned into result and if no file is chosen result is null.
	// you can also toggle "allowMultiple" true or false depending on your need
	final result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['png','jpg','jpeg']);

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
bool sub_visibility = false;
  @override 
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
    return SafeArea(child: 
    Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
              // margin: EdgeInsets.only(top: 0),
              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                    // color: Colors.yellow,
                    // alignment: Alignment.bottomRight,
                    height:MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                    child: IconButton(
                      onPressed: () {
                        // Navigator.of(context).pushAndRemoveUntil(
                        //   MaterialPageRoute(
                        //       builder: ((context) => HomeScreen(
                        //             first_time: 0,
                        //           ))),
                        //   (Route<dynamic> route) => false,
                        // );
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width/15,
                  // ),
                  
                  Container(
                    // color: Colors.red,
                    child: Image.asset(
                      'assets/veots_logo_wo_tl.png',
                        height: MediaQuery.of(context).size.width * 0.075,
                        width: MediaQuery.of(context).size.width * 0.075,
                    ),
                  ),
                  
                  Spacer(),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.45,
                  // ),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.07,
                      width: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
                        color: Color(0xff002060),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: FittedBox(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
                                   (context)=>HomeScreen(first_time: 0,
                                   mainLink: '',location_on: true,)), (route) => false);
                                },
                                icon: Icon(
                                  Icons.home,
                                  // size: MediaQuery.of(context).size.width * 0.06,
                                  color: Colors.white,
                                ))),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  Not_icon(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                  Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          width: MediaQuery.of(context).size.width * 0.07,
                          decoration: BoxDecoration(
                            color: Color(0xff002060),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: 
                              InkWell(
                             onTap: (){
                        _scaffoldKey.currentState?.openDrawer();    },
                               child: Icon(
                                  Icons.menu,
                                  size: MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
                            
        ),
                            ),
                          )),
                  SizedBox(width: 12,)
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Text(
              "Upload Bill",
              style: TextStyle(
                  color: Color(0xff011f5f),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: "Poppins Medium",
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            future_builder(),
            
            // SizedBox(
            //   height: MediaQuery.of(context).size.height/20,
            // ),
      //      SizedBox(
      //         height: MediaQuery.of(context).size.height/60,
      //       ),
      //      Container(
      //       height: MediaQuery.of(context).size.height / 17,
      //                       width: MediaQuery.of(context).size.width * 0.8,
      //                       // padding: EdgeInsets.all(15),
      //                      decoration: BoxDecoration(
      //                   // border: Border.all(color: logborder),
      //                   borderRadius: BorderRadius.circular(10),
      //                   color: Color(0xffdfdfdf),
                        
      //                 ),
      //                 child: TextFormField(
      //                   controller: _Comment,
      //     minLines: 6,
      //     maxLines: null,
      //     keyboardType: TextInputType.multiline,
      //     decoration:  InputDecoration(
      //                                                 contentPadding:
      //                                                     EdgeInsets.only(
      //                                                         left: 10,
      //                                                         top:5),
      //                                                 border: InputBorder.none,
      //                                                 labelText: "Enter comments if any",
      //                                                 labelStyle: TextStyle(fontWeight: FontWeight.bold,
      //                             fontFamily: "Poppins Medium",
      //                             fontSize: 9,
      //                             color: Color(0xff003274)
      //                             // fontSize: MediaQuery.of(context).size.width*0.030
      //                             ),
      //                                               ),
      // ),
      //      ),
           SizedBox(height: MediaQuery.of(context).size.height/80,),
          //  Container(
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   child:Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Container(
          //     child: loading==false?
          //      Container(
          //     height: MediaQuery.of(context).size.height / 24,
          //       width: MediaQuery.of(context).size.width * 0.32,
          //       decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //               colors: [
          //                               Color(0xff002060),
          //                               Color(0xffaa2aae)
          //                             ])),
          //       child: ElevatedButton(
          //         onPressed: () async {
                   
          //         },
          //         style: ElevatedButton.styleFrom(
          //             primary: Colors.transparent,
          //             shadowColor: Colors.transparent),
          //         child: Text(
          //           'Submit',
          //           style: TextStyle(fontWeight: FontWeight.bold,
          //           fontFamily: "Poppins Medium",
          //           fontSize: 10,
          //           ),
          //         ),
          //       ),
          //     ):CircularProgressIndicator()
          //    )
          //     ],

          //   ) ,
          //  ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
              "File name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  // fontWeight: FontWeight.bold
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/80,),
            Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: EdgeInsets.all(15),
                           decoration: BoxDecoration(
                        // border: Border.all(color: logborder),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffdfdfdf),
                      ),
                            
                                child: 
                                    Text( Filename==null?
                                  'Attach bill copy for us to analyse':'${Filename}',
                                  style: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 9,
                                  color: Color(0xff003274)
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                 softWrap: false,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          
                          SizedBox(height: MediaQuery.of(context).size.height/80,),
                      Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                              onPressed: () async{
                                 myFuture= (await _pickFile()) ;
                                setState(() {
                                  print(myFuture);
                                  print(myFuture.toString());
                                  if (myFuture==null)
                                  {
                                    sub_visibility = false;
                                    Filename = null;
                                    my='nofile';
                                  }
                                  else{
                                    my='hasfile';
                                    sub_visibility = true;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                                  primary: Color(0xff01b050)),
                              child: FittedBox(
                                child: 
                                    Text(
                                  'Upload',
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 14,
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            Container(
            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width * 0.8,
                            // padding: EdgeInsets.all(15),
                           decoration: BoxDecoration(
                        // border: Border.all(color: logborder),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffdfdfdf),
                        
                      ),
                      child: TextFormField(
                        controller: _Comment,
          minLines: 6,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration:  InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 10,
                                                              top:5),
                                                      border: InputBorder.none,
                                                      labelText: "Enter comments if any",
                                                      labelStyle: TextStyle(
                                  fontFamily: "Poppins Medium",
                                  fontSize: 9,
                                  color: Color(0xff003274)
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                                    ),
      ),
           ),
            SizedBox(
              height: MediaQuery.of(context).size.height/60,
            ),
                 Container(
              // child: loading==false?
               child:Container(
              height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                                        Color(0xff00b7ff),
                                        Color(0xffaa2aae)
                                      ])),
                child: ElevatedButton(
                  onPressed: () async {
                    print("out");
                    if(Filename == null)
                    {
                      showDialog(context: context, builder:(context){
                     return AlertDialog(
                                          backgroundColor: Color(0xff002060),
                                          titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          shape: const RoundedRectangleBorder(
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
                                                 height:
                                                      50,
                                                  width:
                                                      MediaQuery.of(context).size.width,
                                                  decoration: const BoxDecoration(
                                                      gradient: LinearGradient(colors: [
                                                    Color(0xff003296),
                                                    Color(0xff662da4)
                                                  ])),
                                                  // color: Colors.blue,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      if (MediaQuery.of(context)
                                                              .size
                                                              .width <
                                                          600) ...[
                                                        const Text(
                                                          "Cannot Report",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 20),
                                                        ),
                                                      ] else
                                                        const Text(
                                                          "Cannot Report",
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
                                                      Navigator.pop(context);
                                                    }),
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                    iconSize: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          content: Text(
                                            'Please choose a bill copy',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    MediaQuery.of(context).size.width *
                                                        0.05),
                                          ),
                                        );
                      });
                    }
                    else{
                    showDialog(context: context, builder:(context){
                     return
                     FutureBuilder<String>(
                                                future: getData(),
                                                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                  if(snapshot.data == null)
                                                  {
                                                    return
                                                    Center(
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xff002060))),
                                                      ),
                                                    );
                                                  }
                                                  if (snapshot.data == "Successfull") {
                                                    return 
                                                      AlertDialog(
                                          backgroundColor: Color(0xff002060),
                                          titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          shape: const RoundedRectangleBorder(
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
                                                 height:
                                                      50,
                                                  width:
                                                      MediaQuery.of(context).size.width,
                                                  decoration: const BoxDecoration(
                                                      gradient: LinearGradient(colors: [
                                                    Color(0xff003296),
                                                    Color(0xff662da4)
                                                  ])),
                                                  // color: Colors.blue,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      if (MediaQuery.of(context)
                                                              .size
                                                              .width <
                                                          600) ...[
                                                        const Text(
                                                          "Confirmation",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 20),
                                                        ),
                                                      ] else
                                                        const Text(
                                                          "Confirmation",
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
                                                      Navigator.pop(context);
                                                    }),
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                    iconSize: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          content: Text(
                                            'Successfully Reported',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    MediaQuery.of(context).size.width *
                                                        0.05),
                                          ),
                                        );
                                                  }  
                                                  else {
                                                    return  AlertDialog(
                                          backgroundColor: Color(0xff002060),
                                          titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                          shape: const RoundedRectangleBorder(
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
                                                 height:
                                                      50,
                                                  width:
                                                      MediaQuery.of(context).size.width,
                                                  decoration: const BoxDecoration(
                                                      gradient: LinearGradient(colors: [
                                                    Color(0xff003296),
                                                    Color(0xff662da4)
                                                  ])),
                                                  // color: Colors.blue,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      if (MediaQuery.of(context)
                                                              .size
                                                              .width <
                                                          600) ...[
                                                        const Text(
                                                          "Confirmation",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 20),
                                                        ),
                                                      ] else
                                                        const Text(
                                                          "Confirmation",
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
                                                      Navigator.pop(context);
                                                    }),
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                    iconSize: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          content: Text(
                                            'Failed to report',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    MediaQuery.of(context).size.width *
                                                        0.05),
                                          ),
                                        );
                                                  }
                                                },
                                           ) ;
                    }
                    );}
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'Report',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                    fontFamily: "Poppins Medium",
                    fontSize: 13.6,
                    ),
                  ),
                ),
              )
              // :CircularProgressIndicator()
             )
          ],
        ),
      ),
      bottomNavigationBar: poweredby(context),
      drawer: HamWidget()
    )
    );
  }
  Widget future_builder(){
return FutureBuilder(
  //  future: myFuture,
  builder: (context, snapshot) {
 if (my=='nofile'){

    return Container(
              color: Color(0xff00b7ff),
              height: 300,
              width: 250,
             child: Center(child: Text("Preview", style: TextStyle(fontFamily: "Poppins Medium",)),),
            );

  }
   else if(my=='hasfile')
  { print("hello");
      return   Container(
        width:300,
        height: 250,
        // child: GridView.builder(
        //                 itemCount: imageFileList!.length,
        //                gridDelegate: 
        //                   SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 2,crossAxisSpacing: 2,
        //                       crossAxisCount: 3),
        //                   itemBuilder: (BuildContext context, int index) {
        //                    return Image.file(File(imageFileList![index].path), 
        //                 fit: BoxFit.cover,);
        //              }),
        child: Center(child: Image.file(File(myFuture.toString()), )),
      );
  }

else {
   return Container(
              color: Color(0xff00b7ff),
              height: 300,
              width: 250,
            
            );
}

});
  }
  }
// class FileHandleApi {
//   // save pdf file function
//   static Future<File> saveDocument({
//     required String name,
//     required pw.Document pdf,
//   }) async {
//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');
//     await file.writeAsBytes(bytes);
//     return file;
//   }

//   // open pdf file function
//   static Future openFile(File file) async {
//     final url = file.path;

//     await OpenFile.open(url);
//   }
// }