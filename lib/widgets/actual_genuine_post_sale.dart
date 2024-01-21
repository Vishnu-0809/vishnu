import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:Veots/models/class_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:badges/badges.dart' as badges;
import '../screens/Notifications_view.dart';
import '../screens/constants.dart';
import '../screens/home_page.dart';
import '../screens/product_details.dart';
import 'not_icon.dart';

class ActualGPSale extends StatefulWidget {
  const ActualGPSale({super.key,required this.link, required this.snapshot, required this.keyD});
  final String link;
  final GenuinePostSale snapshot;
  final keyD;
  // State<ActualGPSale> createState() => _ActualGPSaleState();
  State<ActualGPSale> createState() => _ActualGPSaleState();
}

class _ActualGPSaleState extends State<ActualGPSale> {

void initState() {
    // TODO: implement initState
    () async {
      _startAnimation();
    }();

    super.initState();
  }
   void _startAnimation() {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _isContainerBig = true;
      });
    });
  }

  bool _isContainerBig = false;

// class _ActualGPSaleState extends State<ActualGPSale> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              child: Row(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.width * 0.075,
                      width: MediaQuery.of(context).size.width * 0.075,
                    child: IconButton(
                      onPressed: () {
                        int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: const Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                    Image.asset(
                      'assets/veots_logo_wo_tl.png',
                   height: MediaQuery.of(context).size.width * 0.09,
                        width: MediaQuery.of(context).size.width * 0.09,
                    ),
                  const Spacer(),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.07,
                      width: MediaQuery.of(context).size.width * 0.07,
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
                          decoration: const BoxDecoration(
                            color: Color(0xff002060),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: 
                              InkWell(
                             onTap: (){
                        widget.keyD.currentState?.openDrawer();    },
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
              height: MediaQuery.of(context).size.height / 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.snapshot.details["batchType"] == "Manufacturer" ?
                Text(
              "Scanned Product Details",
              style: 
              // Theme.of(context).textTheme.headlineMedium,
              TextStyle(
                  color: const Color(0xff002060),
                  // fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontSize: 16,
                  fontFamily: "Poppins Medium",
                  // fontWeight: FontWeight.bold
                  ),
            ):
             Text(
              "Scanned Details",
              style: 
              // Theme.of(context).textTheme.headlineMedium,
              TextStyle(
                  color: const Color(0xff002060),
                  // fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontSize: 16,
                  fontFamily: "Poppins Medium",
                  // fontWeight: FontWeight.bold
                  ),
            )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
          //   if(widget.snapshot.details["batchType"] == "Retailer")...[
          //     if(widget.snapshot.details["brand"] != null)
          //   Text(
          //   widget.snapshot.details["brand"],
          //   style:
          //   //  Theme.of(context).textTheme.headlineSmall,
          //   TextStyle(
          //     color: const Color(0xff00b7ff),
          //     fontSize: 12,
          //         // fontSize: MediaQuery.of(context).size.width * 0.055,
          //         fontFamily: "Poppins Medium",
          //   ),
          // )]
          // else...[
          // if(widget.snapshot.details["prodName"]!=null)...[
          // Text(
          //   widget.snapshot.details["prodName"],
          //   style:
          //   //  Theme.of(context).textTheme.headlineSmall,
          //   TextStyle(
          //     color: const Color(0xff00b7ff),
          //     fontSize: 12,
          //         // fontSize: MediaQuery.of(context).size.width * 0.055,
          //         fontFamily: "Poppins Medium",
          //   ),
          // ),]
          // else...[
          //   Text(
          //   "unable to display name",
          //   style: TextStyle(
          //     color: const Color(0xff0b53be),
          //         fontSize: MediaQuery.of(context).size.width * 0.055,
          //   ),
          // ),
          // ]],
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 35,
          // ),
          //  SizedBox(
          //     height: MediaQuery.of(context).size.height / 45,
          //   ),
          Stack(children: [
                  Container(
                    // color: Colors.red,
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Image.network(widget.snapshot.details["imageProd"], 
                       loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                      )),
                        AnimatedContainer(
                          height: _isContainerBig==true ? 130 : 300,
          duration: Duration(milliseconds: 200),
          width: _isContainerBig==true ? 130 : 300,
          alignment: Alignment.topLeft,
          child: Image.asset(
                        'assets/authentic_sticker.png',
                      ),
        ),
                ]),
                SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
              AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                      TyperAnimatedText(widget.snapshot.details["prodName"],
                      speed: const Duration(milliseconds: 70), 
                      textStyle: TextStyle(color: Color(0xff003274),
                      fontFamily: "Poppins Medium",
                      fontSize:MediaQuery.of(context).size.width*0.041,)
                      ),                 
                     ],
                 ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 45,F
          // ),
           SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.065,
              // ),
              Container(
                        color: const Color(0xff003296),
                        width: 8,
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      const SizedBox(width: 8,),
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.snapshot.details["expiry"] == null) {
                            showDialog(
                                // barrierDismissible: false,
                                context: context,
                                builder: (context) {
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
                                                MediaQuery.of(context).size.height /
                                                    13,
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
                                                    "Expiry Details",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 20),
                                                  ),
                                                ] else
                                                  const Text(
                                                    "Expiry Details",
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
                                      'There is no expiry for this product',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                    ),
                                  );
                                });
                          } else {
                            String temp =
                                widget.snapshot.details["expiry"].substring(0, 10);
                            String res = temp.substring(8, 10) +
                                "-" +
                                temp.substring(5, 7) +
                                "-" +
                                temp.substring(0, 4);
                            showDialog(
                                // barrierDismissible: false,
                                context: context,
                                builder: (context) {
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
                                                MediaQuery.of(context).size.height /
                                                    13,
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
                                                    "Expiry Details",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 20),
                                                  ),
                                                ] else
                                                  const Text(
                                                    "Expiry Detiails",
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
                                    content:
                                    widget.snapshot.details["batchType"]!=null?
                                    widget.snapshot.details["batchType"]=="Retailer"?Text(
                                      'Not Applicable',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                    ):widget.snapshot.details["expiry"]=="notAvailable"? Text(
                                      'Not Available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                    ):Text(
                                      'The product is good to be used until $res',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                    ):Text(
                                      'No Response',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                    )
                                  );
                                }
                                );
                          }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child:  FittedBox(
                        child: Text(
                          'Expiry Check',
                          style: 
                          // Theme.of(context).textTheme.bodyMedium,
                          TextStyle(
                            // fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          color: Colors.white,
                          fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                    child: ElevatedButton(
                      onPressed: () {
                        // ProductsDisplay temp = new ProductsDisplay();
                        // temp.Purchase_date = "no";
                        // // if (widget.snapshot.details["brand"] != null)
                        //   temp.brand = snapshot.details["brand"];
                        // // else
                        // //   temp.brand = "null";
                        // if(snapshot.details["warranty"] != null)
                        // temp.duration = snapshot.details["warranty"];
                        // else
                        // temp.duration = 0;
                        // // if (widget.snapshot.details["price"] != null)
                        //   temp.price = snapshot.details["price"];
                        // // else
                        // //   temp.price = 0;
                        //  if (snapshot.details["serialNo"] != null)
                        //     temp.serialNo = snapshot.details["serialNo"];
                        //   else
                        //     temp.serialNo = "null";
                        // // if (widget.snapshot.details["imageProd"] != null)
                        //   temp.imageProd = snapshot.details["imageProd"];
                        // // else
                        // //   temp.imageProd = "null";
                        // // if (widget.snapshot.details["prodName"] != null)
                        //   temp.name = snapshot.details["prodName"];
                        // else
                        //   temp.name = "null";f
                        Details temp_class = new Details();
                        temp_class.details["message"] = widget.snapshot.message;
                        temp_class.details["purchaseDate"] = widget.snapshot.purchaseDate;
                        temp_class.details["brand"] = widget.snapshot.details["brand"];
                        temp_class.details["serialNo"] = widget.snapshot.details["serialNo"];
                        temp_class.details["warrantyApp"] = widget.snapshot.details["warrantyApp"];
                        temp_class.details["price"] = widget.snapshot.details["price"];
                        temp_class.details["prodName"] = widget.snapshot.details["prodName"];
                        temp_class.details["imageProd"] = widget.snapshot.details["imageProd"];
                        // temp_class.details["QROnProd"] =
                        //     responseData["batchDetails"]["QROnProd"];
                        temp_class.details["expiry"] = widget.snapshot.details["expiry"];
                        temp_class.details["batchNo"] = widget.snapshot.details["batchNo"];
                        temp_class.details["warrantyPeriod"] = widget.snapshot.details["warrantyPeriod"];
                         temp_class.details["imageQrOnProd"] = widget.snapshot.details["imageQrOnProd"];
                         temp_class.details["mfgDate"] = widget.snapshot.details["mfgDate"];
                         temp_class.details["shelflife"] = widget.snapshot.details["shelflife"];
                         temp_class.details["manuLicenseNo"] = widget.snapshot.details["manuLicenseNo"];
                         temp_class.details["manuAddress"] = widget.snapshot.details["manuAddress"];
                         temp_class.details["additionalDetails"] = widget.snapshot.details["additionalDetails"];
                         temp_class.details["additionalImages"] = widget.snapshot.details["additionalImages"];
                         temp_class.details["additionalImageDetails"] = widget.snapshot.details["additionalImageDetails"]; 
                         temp_class.details['tracking']=widget.snapshot.details['tracking']; ///changed
                         temp_class.details['productVedio']=widget.snapshot.details['productVedio'];
                         temp_class.details['batchType']=widget.snapshot.details['batchType'];
                         temp_class.details['manuWebsiteLink']=widget.snapshot.details['manuWebsiteLink'];
                         temp_class.bill = widget.snapshot.bill;
                         print("--------------------");
                         print(temp_class.bill);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProdDetails(link:widget.link,snapshot: temp_class),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: FittedBox(
                        child: 
                        widget.snapshot.details["batchType"] == "Manufacturer" ?
                        Text(
                          'Product Details',
                          style: 
                          // Theme.of(context).textTheme.bodyMedium,
                          TextStyle(
                            // fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          fontSize: 12
                          ),
                        ):
                         Text(
                          'Details',
                          style: 
                          // Theme.of(context).textTheme.bodyMedium,
                          TextStyle(
                            // fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          fontSize: 12
                          ),
                        )
                      ),
                    ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
