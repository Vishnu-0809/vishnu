import 'package:flutter/material.dart';
import 'package:Veots/screens/info_animations.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/class_models.dart';
import '../widgets/not_icon.dart';
import 'Notifications_view.dart';
import 'home_page.dart';
import 'constants.dart';

import 'package:badges/badges.dart' as badges;

class InfoQRProdDet extends StatelessWidget {
   InfoQRProdDet(
      {super.key, required this.snapshot});
  final Details snapshot;
  @override


       var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //         Container(
          //           margin: const EdgeInsets.only(right: 23),
          //           child: SizedBox(
          //             height: MediaQuery.of(context).size.height / 30,
          //             width: MediaQuery.of(context).size.width * 0.2,
          //             child: ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                     primary: const Color(0xff002060),
          //                     shape: RoundedRectangleBorder(
          //                         //to set border radius to button
          //                         borderRadius: BorderRadius.circular(10)),
          //                     // padding:
          //                     //     EdgeInsets.all(10)), //content padding inside button)
          //                 ),
          //                 onPressed: () {},
          //                 child: const FittedBox(
          //                     child: Text(
          //                   'Show Bill',
          //                   style: TextStyle( fontWeight: FontWeight.bold),
          //                 )
          //                 )),
          //                     ),
          //         ),
          //   ],
          // ),
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
            "${snapshot.details["warranty"]} days",
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
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
            // else...[
            //   const Text("null")
            // ],
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
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 33,
                            left: MediaQuery.of(context).size.height / 50),
                        child:
                      Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                        0.005,
                                  ),
                                if(snapshot.details["brand"] != null)
                                
                              Text(
                                  "Brand Name: ${snapshot.details["brand"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                                  // Text("Brand Name",
                                  //     style: TextStyle(
                                  //         fontFamily: "Poppins Medium",
                                  //         color: Colors.white,
                                  //         fontSize: MediaQuery.of(context)
                                  //                 .size
                                  //                 .width *
                                  //             0.023,
                                  //         // fontWeight: FontWeight.bold,
                                  //         letterSpacing: 1.2)),
                            if(snapshot.details["prodName"] != null)    
                              Text(
                                  "Product Name: ${snapshot.details["prodName"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),       
                                  // Text("Product Name",
                                  //     style: TextStyle(
                                  //         fontFamily: "Poppins Medium",
                                  //         color: Colors.white,
                                  //         fontSize: MediaQuery.of(context)
                                  //                 .size
                                  //                 .width *
                                  //             0.023,
                                  //         // fontWeight: FontWeight.bold,
                                  //         letterSpacing: 1.2)),
                               if(snapshot.details["price"] != null)    
                              Text(
                                  "MRP: ${snapshot.details["price"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                                  if(snapshot.details["mfgdate"] != null)    
                              Text(
                                  "MFG Date: ${snapshot.details["mfgdate"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ), 
                                 if(snapshot.details["shelflife"] != null)    
                              Text(
                                  "Shelf life: ${snapshot.details["shelflife"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ), 
                              if(snapshot.details["expiry"] != null)    
                              Text(
                                  "Expiry Date: ${snapshot.details["expiry"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
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
                                              0.023,
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
                                              0.023,
                                      ),
                                ),
                                if(snapshot.details["warranty"] != null)    
                              Text(
                                  "Warranty: ${snapshot.details["warranty"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                                if(snapshot.details["manuLicenseNo"] != null)    
                              Text(
                                  "Manufacturer License no: ${snapshot.details["manuLicenseNo"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                                SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                         if(snapshot.details["manuAddress"] != null && snapshot.details["manuAddress"]!="") ...[
                        Text("Manufacturer Address",
                            style: TextStyle(
                                fontFamily: "Poppins Medium",
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.031,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2)),
                        //  if(snapshot.details["manuAddress"] != null) 
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        // if(snapshot.details["manuAddress"] != null)    
                              Text(
                                  "${snapshot.details["manuAddress"]}",
                                  
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                             
                    ],
                    TextButton(onPressed: (){
                      Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => Product_info_Ani(snapshot: snapshot)
                  )),
        );
                    }, child:Center(
                      child: Icon(
                                    Icons.arrow_drop_down,
                                    size:
                                        MediaQuery.of(context).size.width * 0.15,
                                    color: Colors.white,
                                  ),
                    ),
                 
                    )
                    ],
                  
                  
                  
                  )
                  )),
                )),
          )
        ],
      ),
      drawer:  HamWidget()
    )
    );
  }
}
