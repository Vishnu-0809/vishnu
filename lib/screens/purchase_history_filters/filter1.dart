import 'dart:convert';

import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/product_details.dart';
import 'package:Veots/screens/purchase_history.dart';
import 'package:Veots/screens/purchase_history_filters/filter2.dart';
import 'package:Veots/screens/purchase_history_filters/filter3.dart';
import 'package:Veots/screens/purchase_history_filters/filter4.dart';
import 'package:Veots/screens/purchase_history_filters/filter5.dart';
import 'package:Veots/widgets/Requests.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:Veots/widgets/not_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uni_links/uni_links.dart';
import 'package:Veots/screens/tab_view.dart';
import 'package:Veots/screens/phone_view.dart';

import 'package:Veots/models/class_models.dart';

class PurchaseHistoryFIlter1 extends StatefulWidget {
  const PurchaseHistoryFIlter1({
    super.key,
    // required this.
    // required this.mainLink
    required this.DetailsList
 
  });
  // final String mainLink;
  final List<Details> DetailsList;
  
  @override
  State<PurchaseHistoryFIlter1> createState() => _PurchaseHistoryFIlter1State();
}

class _PurchaseHistoryFIlter1State extends State<PurchaseHistoryFIlter1> {
//  String link = "";
//     Future<String?> initUniLinks() async {
//       // Platform messages may fail, so we use a try/catch PlatformException.
//       try {
//         final initialLink = await getInitialLink();
//         // Parse the link and warn the user, if it is not correct,
//         // but keep in mind it could be `null`.
//         return initialLink;
//       } on PlatformException {
//         // Handle exception by warning the user their action did not succeed
//         // return?
//       }
//     }

// AlbumPurchaseHistory? token;



int time = 800;

  Map<int, String> months = {
    01: "Jan",
    02: "Feb",
    03: "Mar",
    04: "Apr",
    05: "May",
    06: "Jun",
    07: "Jul",
    08: "Aug",
    09: "Sept",
    10: "Oct",
    11: "Nov",
    12: "Dec"
  };
    Map<int, String> days = {
    01: "Mon",
    02: "Tue",
    03: "Wed",
    04: "Thu",
    05: "Fri",
    06: "Sat",
    07: "Sun",
   
  };

bool loading=true;
TextEditingController _controller = TextEditingController();
  // List<Details> DetailsList = [];
  List<Details> orderedDetailsList = [];

  List<String> searchItems=[
    "a",
    "b",
    "c",
    "d"
    
   
   ];
  //  Set<Details> newset=;
   List<Details> SuggestionsDetailsList = [];
   List<Details> Last30daysDetailsList = [];

  //  String  
  bool filter1=false; 
  bool filter2=false; 
  bool filter3=false; 
  bool filter4=false; 
  bool filter5=false; 
 bool b1pressed=false;
  bool b2pressed=false;
  bool b3pressed=false;
  bool b4pressed=false;
  bool b5pressed=false;

//   getData() async {


//     if(true){
//          final token = await createAlbumPurchaseHistoryDetailsMobile(
//         "mobile", "9391231767");
    
//     // final token = await createAlbumPurchaseHistoryDetailsEmail(
//     //     "email", "wkhan5776@gmail.com");
//     // print(token);
//     var responseData = json.decode(token.body);
//     print(responseData);

//     for (int i = 0; i < responseData["data"].length; i++) {
//       // int j=0;
//       print(DetailsList.length);
//       // temp_class.message = responseData["message"];
//       // // temp_class.details["purchaseDate"] = responseData["data"][i]["purchaseDate"];
//       // while(responseData["data"][i]["brand"]!=null)
//       // {
//       Details temp_class = new Details();
//       temp_class.details["purchaseDate"] =
//           responseData["data"][i]["purchaseDate"];
//       temp_class.details["brand"] = responseData["data"][i]["brand"];
//       temp_class.details["serialNo"] = responseData["data"][i]["serialNo"];
//       // temp_class.details["warrantyApp"] = responseData["data"]["warrantyApp"];
//       temp_class.details["price"] = responseData["data"][i]["price"];
//       temp_class.details["prodName"] = responseData["data"][i]["name"];
//       temp_class.details["imageProd"] = responseData["data"][i]["imageProd"];
//       // temp_class.details["QROnProd"] 
//       //     responseData["batchDetails"]["QROnProd"];
//       temp_class.details["expiry"] = responseData["data"][i]["expiry"];
//       temp_class.details["batchNo"] = responseData["data"][i]["batchNo"];
//       temp_class.details["warranty"] = responseData["data"][i]["warranty"];
//       //  temp_class.details["imageQrOnProd"] = responseData["data"][i]["imageQrOnProd"];
//       temp_class.details["mfgdate"] = responseData["data"][i]["mfgdate"];
//       temp_class.details["shelflife"] = responseData["data"][i]["shelflife"];
//       temp_class.details["manuLicenseNo"] =
//           responseData["data"][i]["manuLicenseNo"];
//       temp_class.details["manuAddress"] =
//           responseData["data"][i]["manuAddress"];
//       //  temp_class.details["additionalDetails"] = responseData["data"][i]["addtionalDetails"];
//       temp_class.details["additionalImages"] =
//           responseData["data"][i]["addtionalImages"];
//       print(temp_class.details["brand"]);
//       print(i);
//       //  print(responseData["data"].length);

//       DetailsList.add(temp_class);
//       searchItems.add(temp_class.details["brand"]);
//       print("ggggggg");
//       print(DetailsList.length);
//     }
//     SuggestionsDetailsList=orderedDetailsList;


//     if(SuggestionsDetailsList.length!=0)
//     {
//     setState(() {
      
//       loading=false;
//     });
//   }

// //       DetailsList.sort((a,b) {
// //  var adate = a.details["mfgdate"]; //before -> var adate = a.expiry;
// //  var bdate = b.details["mfgdate"];//before -> var bdate = b.expiry;
// //  return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
// // });

//     // print(responseata

//     for (int i = 0; i < DetailsList.length; i++) {
//       print(DetailsList[i].details["purchaseDate"]);
//     }
//     DetailsList.sort((a, b) {
//       var adate = a.details["purchaseDate"]; //before -> var adate = a.expiry;
//       var bdate = b.details["purchaseDate"]; //before -> var bdate = b.expiry;
//       return adate.compareTo(
//           bdate); //to get the order other way just switch `adate & bdate`
//     });
//     print("--------");
//     orderedDetailsList = DetailsList.reversed.toList();
//     for (int i = 0; i < orderedDetailsList.length; i++) {
//       print(orderedDetailsList[i].details["purchaseDate"]);
//     }
//     }
//     else{
//        final token = await createAlbumPurchaseHistoryDetailsEmail(
//         "email", ID!);
    
//     // final token = await createAlbumPurchaseHistoryDetailsEmail(
//     //     "email", "wkhan5776@gmail.com");
//     // print(token);
//     var responseData = json.decode(token.body);
//     print(responseData);

//     for (int i = 0; i < responseData["data"].length; i++) {
//       // int j=0;
//       print(DetailsList.length);
//       // temp_class.message = responseData["message"];
//       // // temp_class.details["purchaseDate"] = responseData["data"][i]["purchaseDate"];
//       // while(responseData["data"][i]["brand"]!=null)
//       // {
//       Details temp_class = new Details();
//       temp_class.details["purchaseDate"] =
//           responseData["data"][i]["purchaseDate"];
//       temp_class.details["brand"] = responseData["data"][i]["brand"];
//       temp_class.details["serialNo"] = responseData["data"][i]["serialNo"];
//       // temp_class.details["warrantyApp"] = responseData["data"]["warrantyApp"];
//       temp_class.details["price"] = responseData["data"][i]["price"];
//       temp_class.details["prodName"] = responseData["data"][i]["name"];
//       temp_class.details["imageProd"] = responseData["data"][i]["imageProd"];
//       // temp_class.details["QROnProd"] 
//       //     responseData["batchDetails"]["QROnProd"];
//       temp_class.details["expiry"] = responseData["data"][i]["expiry"];
//       temp_class.details["batchNo"] = responseData["data"][i]["batchNo"];
//       temp_class.details["warranty"] = responseData["data"][i]["warranty"];
//       //  temp_class.details["imageQrOnProd"] = responseData["data"][i]["imageQrOnProd"];
//       temp_class.details["mfgdate"] = responseData["data"][i]["mfgdate"];
//       temp_class.details["shelflife"] = responseData["data"][i]["shelflife"];
//       temp_class.details["manuLicenseNo"] =
//           responseData["data"][i]["manuLicenseNo"];
//       temp_class.details["manuAddress"] =
//           responseData["data"][i]["manuAddress"];
//       //  temp_class.details["additionalDetails"] = responseData["data"][i]["addtionalDetails"];
//       temp_class.details["additionalImages"] =
//           responseData["data"][i]["addtionalImages"];
//       print(temp_class.details["brand"]);
//       print(i);
//       //  print(responseData["data"].length);

//       DetailsList.add(temp_class);
//       searchItems.add(temp_class.details["brand"]);
//       print("ggggggg");
//       print(DetailsList.length);
//     }
//     SuggestionsDetailsList=orderedDetailsList;


//     if(SuggestionsDetailsList.length!=0)
//     {
//     setState(() {
      
//       loading=false;
//     });
//   }

// //       DetailsList.sort((a,b) {
// //  var adate = a.details["mfgdate"]; //before -> var adate = a.expiry;
// //  var bdate = b.details["mfgdate"];//before -> var bdate = b.expiry;
// //  return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
// // });

//     // print(responseata

//     for (int i = 0; i < DetailsList.length; i++) {
//       print(DetailsList[i].details["purchaseDate"]);
//     }
//     DetailsList.sort((a, b) {
//       var adate = a.details["purchaseDate"]; //before -> var adate = a.expiry;
//       var bdate = b.details["purchaseDate"]; //before -> var bdate = b.expiry;
//       return adate.compareTo(
//           bdate); //to get the order other way just switch `adate & bdate`
//     });
//     print("--------");
//     orderedDetailsList = DetailsList.reversed.toList();
//     for (int i = 0; i < orderedDetailsList.length; i++) {
//       print(orderedDetailsList[i].details["purchaseDate"]);
//     }
//     }
//   }
 var _scaffoldKey = new GlobalKey<ScaffoldState>();
void search(String query){
  
  
  final suggestions1=Last30daysDetailsList.where((element){
    final item=element.details["brand"].toLowerCase();
    final item2=element.details["prodName"].toLowerCase();
    final input=query.toLowerCase();
    return (item.contains(input)|| item2.contains(input));
  }).toList();
  
  var seen = Set<String>();
List<Details> uniquelist = suggestions1;
List<Details> emptyList = [];
  
  setState(() {
    SuggestionsDetailsList=uniquelist;
        if(suggestions1.isEmpty){


SuggestionsDetailsList=emptyList;
loading=false;

                    }
    

  });

}

 int daysBetween(DateTime from, DateTime to) {
     from = DateTime(from.year, from.month, from.day);
     to = DateTime(to.year, to.month, to.day);
   return (to.difference(from).inHours / 24).round();
  }
getLast30days() {


for(int i=0;i<widget.DetailsList.length;i++)
{
  String temp =
                                widget.DetailsList[i].details["purchaseDate"].substring(0, 10);
                            String res = temp.substring(8, 10) +
                                "-" +
                                temp.substring(5, 7) +
                                "-" +
                                temp.substring(0, 4);
  // if(widget.DetailsList[i].details["purchaseDate"])



DateTime purchasedDate = DateTime(int.parse(temp.substring(0, 4)), int.parse(temp.substring(5,7)), int.parse(temp.substring(8,10)));

// print("purchase date");
// print(res);
DateTime currentDate = DateTime.now();
// print("current date");
// print(currentDate.month);
 final difference = daysBetween(purchasedDate,currentDate);
 print("no of days difference");
 print(difference);

  if(difference<=30 && difference>=0)
  {
    Last30daysDetailsList.add(widget.DetailsList[i]);
  }
}
 SuggestionsDetailsList=Last30daysDetailsList;


  
  // if(SuggestionsDetailsList.length!=0)
  // {
  //    setState(() {
  //   // SuggestionsDetailsList=uniquelist;
  //   loading=false;
    

  // });
  // }
//    var seen = Set<String>();
// List<Details> uniquelist = SuggestionsDetailsList.where((student) => seen.add(student.details["purchaseDate"])).toList();
  
//   setState(() {
//     SuggestionsDetailsList=uniquelist;
    

//   });
    
}
  
  // void initState() {
  //   initUniLinks().then((value) => this.setState(() {
  //         link = value!;
  //       }));
  //   super.initState();
  // 
  // }
  bool? checkdata(){
     Future.delayed(const Duration(milliseconds: 1000), () {

// Here you can write your code

   if(SuggestionsDetailsList.length==0)
    {
    setState(() {
      
      loading=false;
      // flag=false;
    });
  return true;
  }
});
  }

  void initState() {
    // TODO: implement initState
    () async {
      await getLast30days();
      setState(() {
        print("setstate calledd");
        print(searchItems);
        // getLast30days();
        
      });
    }();
    () async {
      await checkdata();
      setState(() {
        print("setstate calledd");
        print(searchItems);
        // getData();
        
      });
    }();

    print("initSate called\n");
    print(searchItems);
    super.initState();
  }

  @override
   Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (() async {
          // final value= await Dailog(context, 'Exit', 'Do you want to exit');
          // if (value==null)
          // {
             Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: ((context) =>HomeScreen(first_time: 0,
                                          mainLink: '',location_on: true,))),
                                      (Route<dynamic> route) => false,
                                      );
          return true;
          // // }
          // else{
          //     return value;bui
          // }
        }),
        child: SafeArea(
         
          child: Scaffold(
             key: _scaffoldKey,
              body: Column(
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
                            //       builder: ((context) => HomeScreen(
                            //             first_time: 0,
                            //           ))),
                            //   (Route<dynamic> route) => false,
                            // );
                            // Navigator.pop(context);
                            // int count = 0;
                               Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: ((context) =>HomeScreen(first_time: 0,mainLink: '',location_on: true,))),
                                      (Route<dynamic> route) => false,
                                      );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xff002060),
                            size: MediaQuery.of(context).size.width * 0.04,
                          )),
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
                    Spacer(),
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
                height: MediaQuery.of(context).size.height / 20,
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
                      "All purchases",
                      style:    TextStyle(
                              color: const Color(0xff002060),
                              fontSize: MediaQuery.of(context).size.width * 0.042,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins Medium"
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
                      "We are glad to see you back.",
                      style:  TextStyle(
                              color: Color(0xff3b3b3b),
                              // fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * 0.032,
                              fontFamily: "Mont"
                              ),
                    ),
                  ),
                ],
              ),
   SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   Container(
                      height: MediaQuery.of(context).size.height * 0.052 ,
                      width: MediaQuery.of(context).size.width * 0.85,
                      // margin: const EdgeInsets.fromLTRB(32, 32,64, 32),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _controller,
                        onChanged: search,
                        decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 222, 222, 222),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0, color: const Color(0xFFfafafa)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0, color: const Color(0xFFfafafa)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            // fillColor: const Color(0xFF1E1E1E),
                            labelText: "Search here"),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.008,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.width * 0.08,
                        width: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                          color: Color(0xff002060),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: InkWell(
                              onTap: (){
                               showDialog(
                           
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                          return WillPopScope(
                         onWillPop: () async => false,
                         child:StatefulBuilder(
      builder: (context, setState) {
                    return AlertDialog(   
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
                                      height:
                                            50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
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
                                            Text(
                                              "Filter",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20),
                                            ),
                                          ] else
                                            Text(
                                              "Filter",
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
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //    builder: (context) => Warranty(warrantyPeriod: widget.warrantyPeriod, Pimage: widget.Pimage , prodName: widget.prodName, cashBackPts: widget.cashBackPts, cashBackApp: widget.cashBackApp,)
                                          //  ));
                                       
                                        Navigator.pop(context);
                                        }
                                        ),
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
                              content:Container(

                              height: MediaQuery.of(context).size.height*0.2,
                                child: 
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Purchase Date:",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Colors.white,
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                    ),
                                  ),
                                ],
                              ),
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
              height: MediaQuery.of(context).size.height / 28,
                width: MediaQuery.of(context).size.width /5,
                decoration: BoxDecoration(
                    
                                      color: b1pressed?Colors.white:Color(0xff00b7ff), 
                                       borderRadius: BorderRadius.all(Radius.circular(5))
                                        ),
                child: TextButton(
                  onPressed: ()  {
                   filter1=true;
                   filter2=false;
                   filter3=false;
                   filter4=false;
                   filter5=false;
               
                  setState(() {
        print("setstate calledd");
        print(searchItems);
          b1pressed=true;
                   b2pressed=false;
                   b3pressed=false;
                   b4pressed=false;
                   b5pressed=false;
        // getData();
        
      });
                 
                


                   
                   
                  },
                  style: ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed) )
          return Colors.white; //<-- SEE HERE
        return Colors.white; // Defer to the widget's default.
      },
    ),),
                  child: Text(
                    'Last 30 days',
                    style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "Poppins Medium",
                    fontSize: MediaQuery.of(context).size.height*0.01,
                    ),
                  ),
                ),
              ),
              Container(
              height: MediaQuery.of(context).size.height / 28,
                width: MediaQuery.of(context).size.width /6,
                decoration: BoxDecoration(
                    
                                      color: b2pressed?Colors.white:Color(0xff00b7ff),  
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                child: TextButton(
                  onPressed: () async {
                    filter1=false;
                   filter2=true;
                   filter3=false;
                   filter4=false;
                   filter5=false;
                    setState(() {
        print("setstate calledd");
        print(searchItems);
                   b1pressed=false;
                   b2pressed=true;
                   b3pressed=false;
                   b4pressed=false;
                   b5pressed=false;
        // getData();
        
      });
                  },
                  style:ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed) )
          return Colors.white; //<-- SEE HERE
        return Colors.white; // Defer to the widget's default.
      },
    ),),
                  child: Text(
                    '2022',
                    style: TextStyle(
                     color: Colors.black,
                    fontFamily: "Poppins Medium",
                     fontSize: MediaQuery.of(context).size.height*0.01,
                    ),
                  ),
                ),
              ),
              Container(
              height: MediaQuery.of(context).size.height / 28,
                width: MediaQuery.of(context).size.width /6,
                decoration: BoxDecoration(
                    
                                      color: b3pressed?Colors.white:Color(0xff00b7ff), 
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                child: TextButton(
                  onPressed: () async {
                    filter1=false;
                   filter2=false;
                   filter3=true;
                   filter4=false;
                   filter5=false;
                    setState(() {
        print("setstate calledd");
        print(searchItems);
          b1pressed=false;
                   b2pressed=false;
                   b3pressed=true;
                   b4pressed=false;
                   b5pressed=false;
        // getData();
        
      });
                  },
                  style: ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed) )
          return Colors.white; //<-- SEE HERE
        return Colors.white; // Defer to the widget's default.
      },
    ),),
                  child: Text(
                    '2021',
                    style: TextStyle(
                     color: Colors.black,
                    fontFamily: "Poppins Medium",
                     fontSize: MediaQuery.of(context).size.height*0.01,
                    ),
                  ),
                ),
              ),
                                      ],
                                    ),


                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.02,
                                    ),
                                     Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
              height: MediaQuery.of(context).size.height / 28,
                width: MediaQuery.of(context).size.width /5.5,
                decoration: BoxDecoration(
                    
                                      color: b4pressed?Colors.white:Color(0xff00b7ff) , 
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                child: TextButton(
                  onPressed: () async {
                    filter1=false;
                   filter2=false;
                   filter3=false;
                   filter4=true;
                   filter5=false;
                    setState(() {
        print("setstate calledd");
        print(searchItems);
          b1pressed=false;
                   b2pressed=false;
                   b3pressed=false;
                   b4pressed=true;
                   b5pressed=false;
        // getData();
        
      });
                  },
                  style: ButtonStyle( 
    //                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    // RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(64.0),
    //   // side: BorderSide(color: Colors.red)
    // )
  overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed) )
          return Colors.white; //<-- SEE HERE
        return Colors.white; // Defer to the widget's default.
      },
    ),),
                  child: Text(
                    '2020',
                    style: TextStyle(
                       color: Colors.black,
                    fontFamily: "Poppins Medium",
                    fontSize: MediaQuery.of(context).size.height*0.01,
                    ),
                  ),
                ),
              ),
              Container(
              height: MediaQuery.of(context).size.height / 28,
                width: MediaQuery.of(context).size.width /5.5,
                decoration: BoxDecoration(
                    
                                      color: b5pressed?Colors.white:Color(0xff00b7ff),
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                child: TextButton(
                  onPressed: () async {
                    filter1=false;
                   filter2=false;
                   filter3=false;
                   filter4=false;
                   filter5=true;
                    setState(() {
        print("setstate calledd");
        print(searchItems);
          b1pressed=false;
                   b2pressed=false;
                   b3pressed=false;
                   b4pressed=false;
                   b5pressed=true;
        // getData();
        
      });
                  },
                  style: ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed) )
          return Colors.white; //<-- SEE HERE
        return Colors.white; // Defer to the widget's default.
      },
    ),),
                  child: Text(
                    'Older',
                    style: TextStyle(
                    fontFamily: "Poppins Medium",
                     color: Colors.black,
                     fontSize: MediaQuery.of(context).size.height*0.01,
                    ),
                  ),
                ),
              ),
              
                                      ],
                                    ),
                                     SizedBox(
                                      height: MediaQuery.of(context).size.height*0.02,
                                    ),
                                     Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
              height: MediaQuery.of(context).size.height / 28,
                width: MediaQuery.of(context).size.width /5,
                decoration: BoxDecoration(
                    
                                      color: Colors.deepPurple[800], 
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                child: ElevatedButton(
                  onPressed: () async {
                    filter1=false;
                   filter2=false;
                   filter3=false;
                   filter4=false;
                   filter5=false;
                   Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64),
                    ),
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontFamily: "Poppins Medium",
                     fontSize: MediaQuery.of(context).size.height*0.01,
                    ),
                  ),
                ),
              ),
              Container(
              height: MediaQuery.of(context).size.height / 28,
                width: MediaQuery.of(context).size.width /5,
                decoration: BoxDecoration(
                    
                                      color: Colors.red[700],
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                child: ElevatedButton(
                  onPressed: () async{
                   if(filter1==true)
                   {
                          Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PurchaseHistoryFIlter1(DetailsList: widget.DetailsList,)
                  ));

                   }
                   else  if(filter2==true)
                   {
Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PurchaseHistoryFIlter2(DetailsList: widget.DetailsList,)
));
                   }
                   else   if(filter3==true)
                   {
           Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PurchaseHistoryFIlter3(DetailsList: widget.DetailsList,)
));
                   }
                   else    if(filter4==true)
                   {
     Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PurchaseHistoryFIlter4(DetailsList: widget.DetailsList,)
));
                   }
                   else     if(filter5==true)
                   {
Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PurchaseHistoryFIlter5(DetailsList: widget.DetailsList,)
));
                   }
                   else  {
// showOverlay(context,"user not found");
          //    final snackBar = SnackBar(  
          //   content: Text('Hey! This is a SnackBar message.'),  
          //   duration: Duration(seconds: 5),  
          //   action: SnackBarAction(  
          //     label: 'Undo',  
          //     onPressed: () {  
          //       // Some code to undo the change.  
          //     },  
          //   ),  
          // );  
          // // Scaffold.of(context).SnackBar(snackBar);  
          //    ScaffoldMessenger.of(context).showSnackBar(snackBar);
        

                    print("please choose a filter");
                   }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Text(
                    'Apply',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontFamily: "Poppins Medium",
                     fontSize: MediaQuery.of(context).size.height*0.01,
                    ),
                  ),
                ),
              ),
              
                                      ],
                                    ),
                                  ],
                                )
                                
                                ,



                              )
                            );
    
      }
                            ));
                          }
                          );
                              }
                                // widget.keyD.currentState?.openDrawer();
                                
                              ,
                              child: Icon(
                                Icons.filter_list,
                                size: MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              //  SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.08,
              //  ),
              // SuggestionsDetailsList.length!=0?
               Container(
                child: Container(
                  child:SuggestionsDetailsList.length==0?
                    loading==true?Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.shade300,
                child: ShimmerLayout(),
                period: Duration(milliseconds: time),
              )
                    :Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Center(
                                child: Column(
                                  children: [

                                      Container(

                                 height: MediaQuery.of(context).size.height * 0.15,
                                //  width: 10MediaQuery.of(context).size.height * 0.0195,


                                  alignment: Alignment.center,
                                   
                                    child: Image.asset(
                                                                'assets/NoPurchase.png',
                                                                
                                                              ),
                                  ),
                                 
                                 Text( 
                                " Nothing to show",
                                style: TextStyle(
                                  color: Color(0xff3b3b3b),
                                   fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                  fontSize: MediaQuery.of(context).size.height * 0.0195
                                ),),
                                  Text( 
                                "Start verifying and claim products",
                                style: TextStyle(
                                  color: Color(0xff3f60a0),
                                  //  fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                  fontSize: MediaQuery.of(context).size.height * 0.0152
                                ),),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                )
                                
                                ],),
                              )
                    
                    
                    ],))
                    
                    
                    :Expanded(
                  child:ListView.builder(
                itemCount: SuggestionsDetailsList.length,
                itemBuilder: (context, index) {

                  

                 
                 final sea = SuggestionsDetailsList[index];
                  // String WarrantyDate= " 0 days ";
                     String current_Date=DateTime.now().toString().substring(0,10);
      print("qqqqqqqqqqqqqqqqqqqqqqqq "+current_Date);

        String Purchase_Date=sea.details["purchaseDate"].toString().substring(0,10);
        print("qqqqqqqqqqqqqqqqqqqqqqqq "+Purchase_Date);


        DateTime endDate = DateTime(int.parse(current_Date.substring(0,4)), int.parse(current_Date.substring(5,7)), int.parse(current_Date.substring(8,10)));
       
  DateTime startDate = DateTime(int.parse(Purchase_Date.substring(0,4)), int.parse(Purchase_Date.substring(5,7)), int.parse(Purchase_Date.substring(8,10)));
       print(startDate);

       Duration difference = endDate.difference(startDate);
       int numberOfDays = difference.inDays;
      print(numberOfDays);
      int Warranty_Left= int.parse(sea.details["warranty"].toString())-numberOfDays;
     print(Warranty_Left);
                  
                 
                  String prevDate(){
                  if(index!=0)
                  {
                    final sea0=SuggestionsDetailsList[index-1];
                       String temp0 =
                                sea0.details["purchaseDate"].substring(0, 10);
                            String res0 = temp0.substring(8, 10) +
                                "-" +
                                temp0.substring(5, 7) +
                                "-" +
                                temp0.substring(0, 4);
                                DateTime purchasedDate0 = DateTime(int.parse(temp0.substring(0, 4)), int.parse(temp0.substring(5,7)), int.parse(temp0.substring(8,10)));
                                String Dayinwords0=days[int.parse(purchasedDate0.weekday.toString())]!;
                                String Day0=temp0.substring(8, 10);
                                // final d=days[01];
                                String Month0=months[int.parse(purchasedDate0.month.toString())]!;
                                String year0=temp0.substring(2, 4);
                                String FinalPurchaseDate0="On"+" "+Dayinwords0+" "+","+ Day0+ " " +Month0+" "+year0;
                                
                                return FinalPurchaseDate0;
                  }
                  else 
                  {
                    return "";

                  }
                                 }
                                  String FinalPurchaseDate0=prevDate();

                  String temp =
                                sea.details["purchaseDate"].substring(0, 10);
                            String res = temp.substring(8, 10) +
                                "-" +
                                temp.substring(5, 7) +
                                "-" +
                                temp.substring(0, 4);
                                DateTime purchasedDate = DateTime(int.parse(temp.substring(0, 4)), int.parse(temp.substring(5,7)), int.parse(temp.substring(8,10)));
                                String Dayinwords=days[int.parse(purchasedDate.weekday.toString())]!;
                                String Day=temp.substring(8, 10);
                                // final d=days[01];
                                String Month=months[int.parse(purchasedDate.month.toString())]!;
                                String year=temp.substring(2, 4);
                                String FinalPurchaseDate="On"+" "+Dayinwords+" "+","+ Day+ " " +Month+" "+year; 


                  return Container(
                    child:Container(
                    // shadowColor: Color.fromARGB(255, 180, 38, 236),
                    // color: Color(0xFF1E1E1E),
                    // elevation: 8,
                    // clipBehavior: Clip.antiAlias,
                    // shape: RoundedRectangleBorder(
                    //   // borderRadius: BorderRadius.circular(16),
                    // ),
                    child:
                        // ignore: unnecessary_new
                        new InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => null,
                        //   ),
                        // );
                      },
                      child: Container(
                        
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              //  color: Color.fromARGB(18, 113, 125, 137)
                              ),
                          padding: EdgeInsets.fromLTRB(15,0,15,0),
                          child: Column(
                            
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                child: 
                               FinalPurchaseDate==FinalPurchaseDate0?
                               Container():  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                                  Text(
                                    FinalPurchaseDate,
                                    style: TextStyle(
                                      // fontWeight: FontWeight,
                                      fontFamily: "Poppins Medium",
                                      color: const Color(0xff002060),
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                    ),
                                  ),
                                ],
                              )
                                
                                // if(true)...[],
                             
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                  // height: MediaQuery.of(context).size.height * 0.15,
                                  child: Container(
                                // shadowColor: Color.fromARGB(255, 180, 38, 236),
                             
                                // elevation: 8,
                                // clipBehavior: Clip.antiAlias,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(0),
                                // ),
                                child:
                                    // ignore: unnecessary_new
                                    new InkWell(
                                  onTap: () {},
                                  child: Card(
                                       color: Color.fromARGB(234, 247, 243, 243),
                                     shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                    // decoration:
                                    // BoxDecoration(
                                    // color: Color.fromARGB(18, 113, 125, 137)),
                                    // padding: EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // mainAxisAlignment:MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [],
                                        ),

                                        Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              margin: EdgeInsets.all(8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                child: CachedNetworkImage(
        imageUrl: sea.details["imageProd"],
      progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
        
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
                                              ),
                                            )
                                          ],
                                        )),
                                        // SizedBox(width: 5,),
                                        Container(
                                          // width: 200,
                                          // height: MediaQuery.of(context)
                                          //         .size
                                          //         .height /
                                          //     4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            // crossAxisAlignment:
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                                              SizedBox(
                                                // fit: BoxFit.fitWidth,
                                                width: MediaQuery.of(context).size.width*0.5,
                                                child: Text(
                                    sea.details["prodName"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color:const Color(0xff002060),
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
                                    ),
                                  ),
                                              ),
                                              // SizedBox(height: 8),
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                    sea.details["brand"],
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Color.fromARGB(255, 123, 119, 119),
                                      //  backgroundColor:Color(0x888888),
                                      // fontStyle: FontStyle.italic,
                                     fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
                                    ),
                                  ),
                                              ),
                                              // Text(
                                              //   ('Firm Name : ${data.docs[index]['Firm_Details']['Firm_name']}'),
                                              //   style: TextStyle(
                                              //     // fontWeight:FontWeight.bold,
                                              //     fontSize: 20,
                                              //     color: Colors.white,
                                              //   ),
                                              // ),
                                               SizedBox(height: MediaQuery.of(context).size.width*0.02,),
                                              // Text(
                                              //   ('Firm Name : ${data.docs[index]['Firm_Details']['Firm_name']}'),
                                              //   style: TextStyle(
                                              //     // fontWeight:FontWeight.bold,
                                              //     font
                                              //Size: 20,
                                              //     color: Colors.white,
                                              //   ),
                                              // ),
                                              FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: sea.details["warranty"]==null?
                                                Text(
                                    "Warranty of" +"0 days"+ "applicable",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Colors.black,
                                      // backgroundColor:Color(0x888888),
                                      // fontStyle: FontStyle.italic,
                                  fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.014,
                                    ),
                                  ):Text(
                                    "Warranty of" +" "+ Warranty_Left.toString()+ " days applicable",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Colors.black,
                                      // backgroundColor:Color(0x888888),
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.014,
                                    ),
                                  ),
                                              ),
                                             InkWell(
                                                  onTap: 
                                              // nullp
                                              // ("g");n
                                              (){
                                                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>ProdDetails(link:"",snapshot: sea,)
                  ));
                                              },
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(
                                    "Product Details >",
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      // backgroundColor:Color(0x3f60a0),
                                      color: const Color(0xff002060),
                                      // backgroundColor:Color(0x888888) ,
                                      // fontStyle: FontStyle.italic,
                                     fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017,
                                    ),
                                  ),
                                              ),
                                             )
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
                              ))
                            ],
                          )),
                    ),
                  ));
                  
                  
                },
              )
              ),
                )
               )
              
            ],
          ), drawer:  HamWidget()),
        ));

   }}
  


  


Widget buildFittedWidthText(String text) => Container(
      // color: Colors.blue,
      // width: MediaQuery.of(context).size.width / 2.5,
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins Medium",
              fontWeight: FontWeight.bold),
        ),
      ),
    );
    
   