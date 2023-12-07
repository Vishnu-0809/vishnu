import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/not_icon.dart';
import 'home_page.dart';
import 'login.dart';

class Coupon_Details extends StatefulWidget {
  const Coupon_Details({super.key,required this.my_coupon,});
  // final cashBackPts;
  // final String code;
  // final String couponText;
  // final String couponHeader;
  // final String couponLogoLink;
  // final String couponExpiryDate;
  // final String TnC;
  // final String offerDetails;
  final my_coupon;

  @override
  State<Coupon_Details> createState() => _Coupon_DetailsState();
}

class _Coupon_DetailsState extends State<Coupon_Details> {
  bool show_code = false;
  bool show_TnC = false;
  bool show_offerDetails = false;
  bool coupon_expired = false;
  int differenceInDays=0;
  String star = "";
  void initState() {
    super.initState();
    DateTime expiryDate = DateTime.parse(widget.my_coupon["expiryDate"]);
     DateTime currentDate = DateTime.now();
     differenceInDays = expiryDate.difference(currentDate).inDays;
     print("ddddddddddddddddddddddddddddddd");
     print(differenceInDays);
    if(differenceInDays < 0 || differenceInDays == 0)
    coupon_expired = true;
    for(int i=0; i<widget.my_coupon["couponCode"].length; i++)
    star = star + '*';
  }
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override 
  List<String> items = ["Male", "Female", "Others"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Container(
              // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
              // margin: EdgeInsets.only(top: 0),
              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                    // color: Colors.yellow,
                    // alignment: Alignment.bottomRight,
                    height: MediaQuery.of(context).size.width * 0.08,
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
                        )
                        ),
                  ),

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
              height: MediaQuery.of(context).size.height / 100,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height* 0.0,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1),

                    child: Text(
                      "Rewards",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1),

                    //  color: Colors.blue,

                    child: Text(
                      "Presenting the coupon details",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Mont",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Stack(
                children: [
                  Container(
                width: MediaQuery.of(context).size.width * 0.88,
                // height: 100,
                child: Card(
                  
                            // shadowColor: Color.fromARGB(255, 180, 38, 236),
                            color: Color(0xFFfafafa),
                            // elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:
                                // ignore: unnecessary_new
                                new InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => NavBarForProperty(
                                //       (data.docs[index].reference.id
                                //           .toString()),
                                //     ),
                                //   ),
                                // );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(18, 113, 125, 137)),
                                // padding: EdgeInsets.all(2),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // mainAxisAlignment:MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      // width: 50,
                                      height: MediaQuery.of(context).size.height/6,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20,)   ,         
                                Text(
                                    widget.my_coupon["couponHeader"],
                                            style: TextStyle(
                                              fontFamily: "Mont",
                                              // fontWeight:FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
    
                                          SizedBox(height: 8),
                                     
                                       Container(
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                         child: Text(
                                             widget.my_coupon["couponText"],
                                              style: TextStyle(
                                                fontFamily: "Mont",
                                                // fontWeight:FontWeight.bold,
                                                // fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                       ),
                                                                                 SizedBox(height: 8),

                                          // Text(
                                          //   ('Firm Name : ${data.docs[index]['Firm_Details']['Firm_name']}'),
                                          //   style: TextStyle(
                                          //     // fontWeight:FontWeight.bold,
                                          //     fontSize: 20,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),
                  //  Text(
                  //                           (''),
                  //                           style: TextStyle(
                  //                             // fontWeight:FontWeight.bold,
                  //                             // fontSize: 20,
                  //                             color: Colors.white,
                  //                           ),
                  //                         ),
                  if(coupon_expired)
                                        Text(
                                            ('Coupon Expired'),
                                            style: TextStyle(
                                              fontWeight:FontWeight.bold,
                                              fontFamily: "Mont",
                                              // fontSize: 20,
                                              color: Colors.red,
                                            ),
                                          )
                                          else
                                          Text(
                                            ("Coupon Expires in ${differenceInDays} days"),
                                            style: TextStyle(
                                              fontWeight:FontWeight.bold,
                                              fontFamily: "Mont",
                                              // fontSize: 20,
                                              color: Colors.red,
                                            ),
                                          ),
    
                                          // SizedBox(height: 15),
                                          // Text(
                                          //   ('Yield : ${data.docs[index]['Property_Details']['Yield']}'),
                                          //   style: TextStyle(
                                          //     fontWeight: FontWeight.bold,
                                          //     fontSize: 20,
                                          //     color: Colors.white,
                                          //   ),
                                          // ),

                                          //                    FirebaseFirestore.instance
                                          // .collection('users').document('')
                                          // .get()
                                          // .then((value) =>
                                          // print("Fetched ==>>>"+value.data["username"])),
                                        ],
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height / 25,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.network(widget. my_coupon["couponLogoLink"] ),
                  ),
              ),
                ],
              ),
              SizedBox(
              height: MediaQuery.of(context).size.height / 70
            ),
              InkWell(
                onTap: () {
                  setState(() {
                    show_offerDetails = true;
                    show_TnC = false;
                  });
                  showMenu();
                },
                child: Container(
                                            width: MediaQuery.of(context).size.width * 0.85,
                                            // height: MediaQuery.of(context).size.height/18,
                                            child: DropdownButtonFormField(
                                              iconEnabledColor:
                                                  const Color(0xFFfafafa),
                                              hint: FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: Text(
                                                  "Offer Details",
                                                  style: TextStyle(
                                                      color:
                                                          const Color( 0xFF004aad),
                                                      fontFamily:
                                                          "Poppins Medium",
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              45),
                                                ),
                                              ),
                                              decoration: InputDecoration(
                                                fillColor:
                                                    const Color(0xFFfafafa),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 0,
                                                      color: const Color(
                                                          0xFFfafafa)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 0,
                                                      color: const Color(
                                                          0xFFfafafa)),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                filled: true,
                                                // fillColor: const Color(0xFF1E1E1E),
                                              ),
                                              // value: dropdownvalue,
                                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                                // validator: (value) {
                                                //         if (value == null ||
                                                //             value.isEmpty) {
                                                //           return 'Please select your gender';
                                                //         }
              
                                                //         return null;
                                                //       },
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                              ),
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: null
                                            ),
                                          ),
              ),
                                        SizedBox(
              height: MediaQuery.of(context).size.height / 70
            ),
              InkWell(
                onTap: (){
                  setState(() {
                    show_TnC = true;
                    show_offerDetails = false;
                  });
                  showMenu();},
                child: Container(
                                          width: MediaQuery.of(context).size.width * 0.85,
                                          // height: MediaQuery.of(context).size.height/18,
                                          child: DropdownButtonFormField(
                                            iconEnabledColor:
                                                const Color(0xFFfafafa),
                                            hint: FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child: Text(
                                                "Terms and Conditions",
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF004aad),
                                                    fontFamily:
                                                        "Poppins Medium",
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            45),
                                              ),
                                            ),
                                            decoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xFFfafafa),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              // fillColor: const Color(0xFF1E1E1E),
                                            ),
                                            // value: dropdownvalue,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              // validator: (value) {
                                              //         if (value == null ||
                                              //             value.isEmpty) {
                                              //           return 'Please select your gender';
                                              //         }

                                              //         return null;
                                              //       },
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            items: items.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: null
                                          ),
                                        ),
              ),
                                        SizedBox(
              height: MediaQuery.of(context).size.height / 70
            ),
                                        // Container(
                                        //     width: MediaQuery.of(context).size.width * 0.8,
                                        //     height: MediaQuery.of(context)
                                        //             .size
                                        //             .height /
                                        //         30,
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       children: [
                                        //         Container(
                                        //           // color: Colors.blue,
                                        //           // width: MediaQuery.of(context).size.width /2,
                                        //           child: FittedBox(
                                        //             child: Text(
                                        //               "Code",
                                        //               style: TextStyle(
                                        //                   color: const Color(
                                        //                       0xFF004aad),
                                        //                   fontFamily:
                                        //                       "Poppins Medium"),
                                        //             ),
                                        //           ),
                                        //         )
                                        //       ],
                                        //     )),
                        //                 Container(
                        //                    width: MediaQuery.of(context).size.width * 0.85,
                        //                     // height: MediaQuery.of(context).size.height / 18,
                        //                     child: Container(
                        //                         decoration: BoxDecoration(
                        //                           borderRadius:
                        //                               BorderRadius.circular(20),
                        //                           color:
                        //                               const Color(0xFFfafafa),
                        //                         ),
                        //                         child: TextFormField(
                        //                             // obscureText: visible2,
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //  validator: (value){
                              // String res='';
                              // RegExp complete=RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
                              // RegExp upper = RegExp(r'(?=.*[A-Z])');
                              // RegExp lower = RegExp(r'(?=.*[a-z])');
                              // RegExp digit = RegExp(r'(?=.*[0-9])');
                              // RegExp special = RegExp(r'(?=.?[!@#\$&~])');
                           
                              // if(value!.isNotEmpty){
                              // if (!upper.hasMatch(value))
                              // {
                              //    res=res+'should contain at least one upper case';
                              // }
                              // if(!lower.hasMatch(value))
                              // {
                              //   res=res+'\nshould contain at least one lower case';
                              // }
                              // if(!digit.hasMatch(value))
                              // {
                              //   res=res+'\nshould contain at least one digit';
                              // }
                              // if(!special.hasMatch(value))
                              // {
                              //   res=res+'\nshould contain at least one Special character';
                              // }
                              // if(value.length<8)
                              // {
                              //   res=res+'\nMust be at least 8 characters in length';

                              // }

                              
                             

                              // }
                              //   if (!complete.hasMatch(value) && value.isNotEmpty) {  
                              //      return  res==''?null:res ;

                              //     //  return  res ;

                               
                              //     }
                              //     else if(value.isEmpty)
                              //     {
                              //       return "Please enter password";
                              //     }
                              //     else{
                              //       return null;
                                
                              //     }

                                  



                                                      // return null;
                                  // else{
                                  //     // text_color_pass=Color(0xff4d4c4c);
                                  //   return null;
                                
                                  // }
                           
            //               },
            //                                         // controller: _Password,
            //                                         style: TextStyle(
            //                                             color: Colors.black),
            //                                         decoration: InputDecoration(
            //                                           contentPadding:
            //                                               EdgeInsets.only(
            //                                                   left: 13,
            //                                                   top: 15),
            //                                           border: InputBorder.none,
            //                                           suffixIcon: Card(
            //                                             color: Color(0xd1deff)
            //                                             ,shape:
            //                                                 RoundedRectangleBorder(
            //                                               borderRadius:
            //                                                   BorderRadius
            //                                                       .circular(10),
            //                                             ),
            //                                             child: Container(
            //                                             width: 40,
            //                                             height: 3,
            //                                             // color: Color(0xfffafafa),
                                                        
            //                                             child:  TextButton(child: Text("Show", style: TextStyle(fontSize: 8),),
                                                     
            //                                           onPressed:null ,),
            //                                           ),
            //                                           )
            //                                         )))),


            //                                          SizedBox(
            //   height: MediaQuery.of(context).size.height / 30
            // ),
                                        
                                //                  Container(
                                //   width:
                                //      MediaQuery.of(context).size.width * 0.7,
                                //   decoration: BoxDecoration(
                                //       borderRadius:
                                //           BorderRadius.circular((4.0)),
                                //       color: Colors.green.shade500),
                                //   child: MaterialButton(
                                //     // color: Colors.amber,
                                //     onPressed: () {
                                //          showMenu();
                                //     },
                                //     child: FittedBox(
                                //       fit: BoxFit.contain,
                                //       child: Text(
                                //         "SHOP",
                                //         style: TextStyle(
                                //             color: Colors.white,
                                //             fontFamily: "Poppins Medium"),
                                //       ),
                                //     ),
                                //   ),
                                // ),

            //                  SizedBox(
            //   height: MediaQuery.of(context).size.height / 30
            // ), 
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),             color: Color(0xfffafafa),
), 
            height: 55,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               if (show_code == true) 
               Padding(
                 padding: const EdgeInsets.only(left: 14),
                 child: 
                 Text(widget. my_coupon["couponCode"],  style: TextStyle(color: Color(0xff003296), fontFamily: "Poppins Medium", fontSize: 10),)
               ) 
               else 
               Padding(
                 padding: const EdgeInsets.only(left : 14.0, top: 5),
                 child:
                  Text(star, style: TextStyle(color: Color(0xff003296), fontFamily: "Poppins Medium", fontSize: 10),),
               ),
                TextButton(onPressed: (){
                  setState(() {
                    show_code = !show_code;
                  });
                }, child: show_code == false ? Text("Show", style: TextStyle(color: Color(0xff003296), fontFamily: "Poppins Medium", fontSize: 11)) : Text("Hide", style: TextStyle(color: Color(0xff003296), fontFamily: "Poppins Medium", fontSize: 11),))
              ]),
            ),
          ),
          // Spacer(),
          SizedBox(height: 30,),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),             color: Color(0xff01b050),
),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.85,
            child: 
            ElevatedButton(onPressed: (){
              final Uri web_url = Uri.parse(
              widget.my_coupon["couponLogoLink"].toString());
              launchUrl(web_url);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xff01b050)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Set button border radius
           ),
         ),),
             child: Text("Shop"))
          )
          ],
        ),
      ),
      bottomNavigationBar:  Container(
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
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                  'assets/veots_logo_wo_tl.png',
                height: 20,
                width: MediaQuery.of(context).size.width * 0.075,
              ),
                  ),
                  
            Text(
              "Veots",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: "Montserrat-SemiBold"),
            ),
                ],
              )
            ),
          ]),
    ),
       drawer:  HamWidget(),
    )
    );
  
  }
   showMenu() {
    showModalBottomSheet(
    // constraints: BoxConstraints(m),
    shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical( 
            top: Radius.circular(15.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          show_TnC == true ?
                     Text(widget.my_coupon["termsAndConditions"])
                     :
                     Text(widget.my_coupon["offerDetails"]),
        ),
      );
        });
  }
}
