import 'dart:io';
import 'package:Veots/screens/track_history.dart';
import 'package:Veots/widgets/not_icon.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:Veots/screens/info_animations.dart';

import 'package:Veots/widgets/ham.dart';
import 'package:Veots/widgets/view_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/class_models.dart';
import '../widgets/NetworkCheck.dart';
import '../widgets/send_accept.dart';
import 'Notifications_view.dart';
import 'home_page.dart';
import 'constants.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:file_picker/file_picker.dart';

enum MenuItem{
  item1,
  item2,
  item3
}
class ProdDetails extends StatelessWidget {
   ProdDetails(
      {super.key,required this.link, required this.snapshot});
  final String link;
  final Details snapshot;
  @override

          
       var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
     _launchURL(String url) async {
      
  final String link;
  final Details snapshot;
  FileDownloader.downloadFile(
    url: url,
    name: "Bill",
    onProgress: (name, progress) {
      print('FILE fileName HAS PROGRESS $progress');
      
    },
    onDownloadCompleted: (String path) {
      print('FILE DOWNLOADED TO PATH: $path');
    },
    onDownloadError: (String error) {
      print('DOWNLOAD ERROR: $error');
    });
}
  

  String temp="";
  String temp2="";
  String mfgdate="";
  String expdate="";

  int warranty_left = 0;

  print("PURCHASE DATE");
  print(snapshot.details["purchaseDate"]);
  if (snapshot.details["purchaseDate"]!=null)
  {

    print("CHECKING WARRANTY LEFT");
  DateTime today = DateTime.now();

  DateTime providedDate = DateTime.parse(snapshot.details["purchaseDate"]);

  Duration difference = today.difference(providedDate);
  print("difference");
  

  int differenceInDays = difference.inDays;
  print(difference);

  warranty_left = snapshot.details["warranty"] - differenceInDays;

  print("warranty left");
  print(warranty_left);

  if(warranty_left < 0)
  warranty_left = 0;

  }

  if(snapshot.details["mfgDate"] != null)    {
                
if( snapshot.details["mfgDate"] == "not available")
mfgdate = "Please refer to product";
else{

  print("going to mfgDate");
                
                temp =
                                snapshot.details["mfgDate"].substring(0, 10);
                           mfgdate = temp.substring(8, 10) +
                                "-" +
                                temp.substring(5, 7) +
                                "-" +
                                temp.substring(0, 4);
}
                
  }

if(snapshot.details["expiry"] != null){
  if( snapshot.details["expiry"] == "not available")
expdate = "Please refer to product";
else{
   print("going to enddate");
   print(snapshot.details["expiry"]);
   print(snapshot.details["expiry"]);
                                temp2 =
                                snapshot.details["expiry"].substring(0, 10);
                            expdate = temp2.substring(8, 10) +
                                "-" +
                                temp2.substring(5, 7) +
                                "-" +
                                temp2.substring(0, 4);
}
                        
}

 
 String? Filename;
 String? myFuture="";
 late PlatformFile file;
 Album_reupload? reupload;
Future<String?> _pickFile() async {
	
	// opens storage to pick files and the picked file or files
	// are assigned into result and if no file is chosen result is null.
	// you can also toggle "allowMultiple" true or false depending on your need
	final result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['png','jpg', 'jpeg']);

	// if no file is picked


	// we get the file from result object
  if(result == null)
  {
    return null;
  }
	  file = result.files.first;
      return file.path;
	// _openFile(file);
}

reupload_bill() async
 {
                            final path = await _pickFile();
                            final codeType= link[link.length-1]=='0'? 'presale':'postsale';
                            String contactType= MOB_not_EM! ? 'mobile':"email";
                            reupload=await createAlbum_reupload(link, ID!,  codeType,contactType, File(path.toString()));
                            // print("reeeeeeeeeeeeeeeeeeeee");
                           if(reupload?.message=="successfull")
                           {
                             final show_net= Show_snack(context,"New bill is uploaded please scan the qr again to view the new results");
                    ScaffoldMessenger.of(context).showSnackBar(show_net);
                           }
 }

  
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
      body: Column(
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
                        //       builder: ((context) => const HomeScreen(
                        //             first_time: 0,
                        //           ))),
                        //   (Route<dynamic> route) => false,
                        // );
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: const Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width/15,
                  // ),
                  
                  Container(
                    // color: Colors.red,
                    child: Image.asset(
                      'assets/veots_logo_wo_tl.png',
                       height: MediaQuery.of(context).size.width * 0.09,
                        width: MediaQuery.of(context).size.width * 0.09,
                    ),
                  ),
                  const Spacer(),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.45,
                  // ),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                      decoration: const BoxDecoration(
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
                                icon: const Icon(
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
                          height: MediaQuery.of(context).size.width * 0.08,
                          width: MediaQuery.of(context).size.width * 0.08,
                          decoration: const BoxDecoration(
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
                  const SizedBox(width: 12,)
                ],
              ),
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          if(snapshot.details["message"] == "Genuine Post Sale")
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton<MenuItem>(
                onSelected: (value) async{
                  if(value==MenuItem.item1)
                  {
                    showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xff002060),
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
                                         Color(0xff003296), Color(0xff662da4)
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
                                              const FittedBox(
                                                child: Text(
                                                "Previous Bill Preview",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20),
                                              ),
                                              )
                                            ] else
                                              const FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: Text(
                                                "Previous Bill Preview",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 30),
                                              ),
                                              )
                                          ],
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: (() {
                                            Navigator.pop(context);
                                            SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
                                            
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
                                content: 
                                SingleChildScrollView(
                                  child: Image.network(snapshot.bill,
                    loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the bill image',
              style:TextStyle(color: Colors.white))),
                    )
                                )
                              );
                            });
                    print("show billllllll");
                  }
                  else if(value==MenuItem.item2)
                  {
                    	final result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['png','jpg', 'jpeg']);
                      	  file = result!.files.first;
                          final path = file.path;
                            final codeType= link[link.length-1]=='0'? 'presale':'postsale';
                            String contactType= MOB_not_EM! ? 'mobile':"email";
                            reupload=await createAlbum_reupload(link, ID!,  codeType,contactType, File(path.toString()));
                            // print("reeeeeeeeeeeeeeeeeeeee");
                           if(reupload?.message=="successfull")
                           {
                             final show_net= Show_snack(context,"New bill is uploaded please scan the qr again to view the new results");
                    ScaffoldMessenger.of(context).showSnackBar(show_net);
                           }
                    // reupload_bill();
                    // print("upload billllllll");
                    // final show_net= Show_snack(context,"New bill is uploaded");
                    // ScaffoldMessenger.of(context).showSnackBar(show_net);
                   
                  }
                  else if(value==MenuItem.item3)
                  {
                     print("before download billllllll");
                    _launchURL(snapshot.bill);
                    final show_net= Show_snack(context,"Bill has been downloaded");
        ScaffoldMessenger.of(context).showSnackBar(show_net);
                    print("download billllllll");
                  }
                },
                
                itemBuilder:(context)=>
              [
                PopupMenuItem(
                  value: MenuItem.item1,
                  child: Text("Show Bill")
                
                ),
                PopupMenuItem(
                  value: MenuItem.item2,
                  child: 
                   
                   Text("Upload Bill")
                
                ),
                PopupMenuItem(
                  value: MenuItem.item3,
                  child: 
                   
                   Text("Download Bill")
                
                )
              ],)
              ,
            ],
          ),
          
          if (snapshot.details["message"] == "Genuine Post Sale")...[
            Text(
                    "Warranty left",
                    style: TextStyle(
                        color: Colors.red,
                          fontSize: 16,
                        fontFamily: "Poppins Medium",
                        ),
                  ),
                  snapshot.details["warranty"] != null ?
          Text(
            "${warranty_left} days",
            style: TextStyle(
                color: const Color(0Xff002060),
                  fontSize: 12,
                fontFamily: "Poppins Medium",
               ),
          ) : 
          Text(
            "Not Applicable",
            style: TextStyle(
                color: const Color(0Xff002060),
                  fontSize: 12,
                fontFamily: "Poppins Medium",
               ),
          ),
        ],
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          // Text(
          //           "Warranty left",
          //           style: TextStyle(
          //               color: Colors.red,
          //                 fontSize: MediaQuery.of(context).size.width * 0.030,
          //               fontFamily: "Poppins Medium",
          //               fontWeight: FontWeight.bold),
          //         ),
          // if(snapshot.duration == 0)...[
          // Text(
          //   "NA",
          //   style: TextStyle(
          //       color: const Color(0Xff002060),
          //         fontSize: MediaQuery.of(context).size.width * 0.025,
          //       fontFamily: "Poppins Medium",
          //       fontWeight: FontWeight.bold),
          // ),]
          // else...[
          //   Text(
          //   snapshot.duration.toString(),
          //   style: TextStyle(
          //       color: const Color(0Xff002060),
          //         fontSize: MediaQuery.of(context).size.width * 0.025,
          //       fontWeight: FontWeight.bold),
          // ),
          // ],
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          if(snapshot.details["imageProd"] == null)...[
            const Text("null")
          ]
          else...[
            Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.network(snapshot.details["imageProd"],
                 loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                )),],

                if(snapshot.details["prodName"] != null)...[
            Text(
              "${snapshot.details["prodName"]}",
              style: TextStyle(
                  fontSize: 
                  12,
                  fontFamily: "Poppins Medium",
                  color: const Color(0xff002060),
                  ),
            ),],
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                  ),
                  margin: EdgeInsets.zero,
                  color: const Color(0xff002060),
                  child: SingleChildScrollView(
                      child: 
                     Container(
                  // height: MediaQuery.of(context).size.height * 0.9,
                
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(bottom: 20, top: 8, left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.013,
                                  ),
                                  Text("Product Info",
                                      style: TextStyle(
                                          fontFamily: "Poppins Medium",
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.031,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2)),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.002,
                                  ),
                                if(snapshot.details["brand"] != null)
                                
                              Text(
                                
                                  "Brand Name: ${snapshot.details["brand"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                           MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ),
                            
                            if(snapshot.details["prodName"] != null)    
                              Text(
                                  "Product Name: ${snapshot.details["prodName"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ),       
                               
                              
                                
                                
                                ],
                              ),
                              // Spacer(),
                              // IconButton(
                              //   padding: EdgeInsets.all(0),
                              //   onPressed: () {
                              //     Navigator.pop(context);
                                
                              //   },
                              //   icon: Icon(
                              //     Icons.close,
                              //     size:
                              //         MediaQuery.of(context).size.width * 0.08,
                              //     color: Colors.white,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(snapshot.details["price"] != null)    
                              Text(
                                  "MRP: ${snapshot.details["price"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ),
                                if(mfgdate == "Please refer to product")...[
                                Text(
                                  "MFG Date: "+mfgdate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ), ]
                                 else if(temp!="")    
                              Text(
                                  "MFG Date: "+mfgdate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ), 
                                 if(snapshot.details["shelflife"] != null && snapshot.details["shelflife"] != 0)    
                              Text(
                                  "Shelf life: ${snapshot.details["shelflife"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ), 
                                if(expdate == "Please refer to product")...[
                                Text(
                                  "Expiry Date: "+expdate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ), ]
                              else if(temp2!="")    
                              Text(
                                  "Expiry Date: "+expdate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ), 
                                if(snapshot.details["batchNo"] != null)    
                              Text(
                                  "Batch No: ${snapshot.details["batchNo"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ),
                              if(snapshot.details["serialNo"] != null)    
                              Text(
                                  "Serial No: ${snapshot.details["serialNo"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ),
                                if(snapshot.details["warranty"] != null )    
                              Text(
                                  "Warranty: ${snapshot.details["warranty"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ),
                        if(snapshot.details["manuLicenseNo"] != null)
                                  
                              Container(
                                child: Text(
                                    "Manufacturer License no: ${snapshot.details["manuLicenseNo"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins Medium",
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.026,
                                        ),
                                  ),
                              ),
                       
                        if(snapshot.details["manuAddress"] !="" && snapshot.details["manuAddress"]!=null )...[
                            
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        // if(widget.snapshot.details["manuAddress"] != null) 
                        Text("Manufacturer Address",
                            style: TextStyle(
                                fontFamily: "Poppins Medium",
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.031,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2)),
                        // if(widget.snapshot.details["manuAddress"] != null) 
                       SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.002,
                                  ),
                        // if(widget.snapshot.details["manuAddress"] != null)    
                              Text(
                                  "${snapshot.details["manuAddress"]}",
                                  
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                              ),
                              // Text('hello ${widget.snapshot.details["additionalImages"][0][0]["url"]}'),
                             

                      ],
                       if(snapshot.details["additionalDetails"] != ""  && snapshot.details["additionalDetails"]!=null  ) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        
                        Text("Additional Details",
                            style: TextStyle(
                                fontFamily: "Poppins Medium",
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.031,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2)),
                            
                        SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.002,
                                  ),
                        // if(widget.snapshot.details["addtionalDetails"] != null)    
                              Text(
                                  "${snapshot.details["additionalDetails"]}",
                                   
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.026,
                                      ),
                                ),
                                // Text(widget.snapshot.details["addtionalImages"]),
                                ],
                        
                        if(snapshot.details["additionalImages"]!=null && snapshot.details["additionalImageDetails"]!=null) ...[
                        if(snapshot.details["additionalImages"][0].length!=0) ...[
                          if(snapshot.details["additionalImages"][0][0]["url"]!="")...[
                                SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                  
                            Text(snapshot.details["additionalImageDetails"],
                            style: TextStyle(
                                fontFamily: "Poppins Medium",
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.031,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2)),
                            
                        SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.002,
                                  ),
                    
                        Row(
                          children: [
                            Container(
                               height:MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width*0.35,
                              decoration: BoxDecoration(
                                  // color: Color(0xff00b7ff),
                                  borderRadius: BorderRadius.circular(5)),
                              child:  snapshot.details["additionalImages"][0][0]["url"]!=""?
                              Image.network(  snapshot.details["additionalImages"][0][0]["url"]
                              , fit: BoxFit.fill,): null,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Container(
                              height:MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width*0.35,
                              decoration: BoxDecoration(
                                  // color: Color(0xff00b7ff),
                                  borderRadius: BorderRadius.circular(5)),
                              child: snapshot.details["additionalImages"][0].length ==1 ? 
                              null : snapshot.details["additionalImages"][0][1]["url"]!="" ? 
                              Image.network( snapshot.details["additionalImages"][0][1]["url"] ,
                               fit: BoxFit.fill,) : null,
                            ),
                        
                          
                        ]),
                        ]
                        ]
                        ]
                        ,
                         SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                        Padding(
                          padding: const EdgeInsets.only(left:20.0,right: 20),
                          child: Row(
                            
                            children: [
                            SizedBox(
                               height:MediaQuery.of(context)
                                                    .size
                                                    .height *0.03 ,
                                width:MediaQuery.of(context)
                                                    .size
                                                    .width *0.25 ,
                                                    
                              child: ElevatedButton(
                                style:  ElevatedButton.styleFrom(
                                primary: Color(0xFFD1DEFF),
                                ),
                                onPressed: (){final Uri web_url = Uri.parse(
                                                  'https://veots.com/');
                                              launchUrl(web_url);}, 
                                child: Text('Web Link',
                                style: TextStyle(
                                              fontFamily: "Poppins Medium",
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.032,
                                              fontWeight: FontWeight.w600,
                                              )
                                              )),
                            ),
                              Spacer(),
                              SizedBox(
                                height:MediaQuery.of(context)
                                                    .size
                                                    .height *0.03 ,
                                width:MediaQuery.of(context)
                                                    .size
                                                    .width *0.23 ,
                                child: ElevatedButton(
                                style:  ElevatedButton.styleFrom(
                                primary: Color(0xFFD1DEFF),
                                shadowColor: Colors.transparent),
                                onPressed: (){
                                      // tracking=[];                   
                                    // if(widget.snapshot.details['tracking']!=null)
                                    // {
                                    //   tracking=[]; 
                                    // tracking= widget.snapshot.details['tracking'];
                                    // tracking.insert(0, {'manuAddress':widget.snapshot.details['manuAddress']});
                                    // print("hi");
                                    // }
                                    // else
                                    // {
                                    //   tracking=[]; 
                                    // tracking.insert(0, {'manuAddress':widget.snapshot.details['manuAddress']});
                                    // }
                                    // print(tracking);
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Tracking_history(tracking: snapshot.details['tracking'], manuAddress:snapshot.details['manuAddress'])),
                                  );
                                //  tracking.removeAt(0);
                                }, 
                                child: Text('Track',
                                style: TextStyle(
                                              fontFamily: "Poppins Medium",
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.032,
                                              fontWeight: FontWeight.w600,
                                              )
                                              )),
                              )
                          ],),
                        )
                          ]) ,
                        ),
                         
                      ]
                      ),
                )
                      ),
                )),
          )
        ],
      ),
      drawer:  HamWidget()
    )
    );
  }
}


