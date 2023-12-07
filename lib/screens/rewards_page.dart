import 'dart:convert';
import 'dart:io';
import 'package:Veots/screens/coupons_details.dart';
import 'package:shimmer/shimmer.dart';
import 'package:Veots/dummy.dart';
import 'package:Veots/screens/Notifications_view.dart';
import 'package:http/http.dart' as http;
import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/info_animations.dart';
import 'package:Veots/screens/product_details.dart';
import 'package:Veots/screens/purchase_history_filters/filter1.dart';
import 'package:Veots/screens/purchase_history_filters/filter2.dart';
import 'package:Veots/screens/purchase_history_filters/filter3.dart';
import 'package:Veots/screens/purchase_history_filters/filter4.dart';
import 'package:Veots/screens/purchase_history_filters/filter5.dart';
import 'package:Veots/widgets/NetworkCheck.dart';
import 'package:Veots/widgets/Requests.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:Veots/widgets/not_icon.dart';
// import 'package:cron/cron.dart';
import 'package:scratcher/scratcher.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:Veots/screens/tab_view.dart';
import 'package:Veots/screens/phone_view.dart';
import 'package:badges/badges.dart' as badges;
import 'package:url_launcher/url_launcher.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/class_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/ham.dart';

class Rewards extends StatefulWidget {
  const Rewards({
    super.key,
    required this.coupons_details,
    required this.customerId,
  });
  final coupons_details;
  final String customerId;
  // final String mainLink;
  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
      //  var _scaffoldKey = new GlobalKey<ScaffoldState>();

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
late var coupons = widget.coupons_details;
// var coupons = [];
// var coupons = [
//   {
//     "_id": "64b4edc99df03b6455e29730",
//     "couponLogoLink": "https://veots-coupons-microservice.s3.amazonaws.com/coupon-logos/Apple-9c2b7b54-98b7-4bf6-a374-3a955e9da217-logoImg.png",
//     "couponText": "Avail this in your next purchase",
//     "expiryDate": "2023-09-09T00:00:00.000Z",
//     "termsAndConditions": "lorem ipusm",
//     "assignedTo": "1234567890",
//     "isScratched": false,
//     "deliveredAt": "2023-07-17T08:10:32.582Z",
//     "couponCode": "16",
//     "couponType": 1
//   },
//   {
//     "_id": "64b4edc99df03b6455e2972a",
//     "couponLogoLink": "https://veots-coupons-microservice.s3.amazonaws.com/coupon-logos/Apple-9c2b7b54-98b7-4bf6-a374-3a955e9da217-logoImg.png",
//     "couponText": "Avail this in your next purchase",
//     "expiryDate": "2023-09-09T00:00:00.000Z",
//     "termsAndConditions": "lorem ipusm",
//     "assignedTo": "1234567890",
//     "isScratched": false,
//     "deliveredAt": "2023-07-17T07:51:26.860Z",
//     "couponCode": "10",
//     "couponType": 1
//   },
//   {
//     "_id": "64b4edc99df03b6455e29743",
//     "couponLogoLink": "https://veots-coupons-microservice.s3.amazonaws.com/coupon-logos/Apple-9c2b7b54-98b7-4bf6-a374-3a955e9da217-logoImg.png",
//     "couponText": "Avail this in your next purchase",
//     "expiryDate": "2023-09-09T00:00:00.000Z",
//     "termsAndConditions": "lorem ipusm",
//     "assignedTo": "1234567890",
//     "isScratched": false,
//     "deliveredAt": "2023-07-17T07:45:47.952Z",
//     "couponCode": "35",
//     "couponType": 1
//   },
//   {
//     "_id": "64b4edc99df03b6455e29732",
//     "couponLogoLink": "https://veots-coupons-microservice.s3.amazonaws.com/coupon-logos/Apple-9c2b7b54-98b7-4bf6-a374-3a955e9da217-logoImg.png",
//     "couponText": "Avail this in your next purchase",
//     "expiryDate": "2023-09-09T00:00:00.000Z",
//     "termsAndConditions": "lorem ipusm",
//     "assignedTo": "1234567890",
//     "isScratched": false,
//     "deliveredAt": "2023-07-17T07:33:53.730Z",
//     "couponCode": "18",
//     "couponType": 1
//   },
//   {
//     "_id": "64b4f77d85d7682748040a0b",
//     "assignedTo": "1234567890",
//     "couponCode": "99966",
//     "couponLogoLink": "Something logo",
//     "couponText": "Something coupon content",
//     "deliveredAt": "2023-07-17T08:10:37.710Z",
//     "expiryDate": "2023-06-20T12:09:38.002Z",
//     "isScratched": false,
//     "termsAndConditions": "something tc",
//     "couponType": 2
//   },
//   {
//     "_id": "64b4f30685d76827480409ff",
//     "assignedTo": "1234567890",
//     "couponCode": "99966",
//     "couponLogoLink": "Something logo",
//     "couponText": "Something coupon content",
//     "deliveredAt": "2023-07-17T07:51:34.865Z",
//     "expiryDate": "2023-06-20T12:09:38.002Z",
//     "isScratched": false,
//     "termsAndConditions": "something tc",
//     "couponType": 2
//   },
//   {
//     "_id": "64b4e43f28b05297513647b5",
//     "assignedTo": "1234567890",
//     "couponCode": "99966",
//     "couponLogoLink": "Something logo",
//     "couponText": "Something coupon content",
//     "deliveredAt": "2023-07-17T06:48:31.284Z",
//     "expiryDate": "2023-06-20T12:09:38.002Z",
//     "isScratched": false,
//     "termsAndConditions": "something tc",
//     "couponType": 2
//   },
//   {
//     "_id": "64b4e43028b05297513647b1",
//     "assignedTo": "1234567890",
//     "couponCode": "99966",
//     "couponLogoLink": "Something logo",
//     "couponText": "Something coupon content",
//     "deliveredAt": "2023-07-17T06:48:16.352Z",
//     "expiryDate": "2023-06-20T12:09:38.002Z",
//     "isScratched": false,
//     "termsAndConditions": "something tc",
//     "couponType": 2
//   }
// ];




    bool noresultsfound=false;
    int offset = 0;
    int time = 800;
      double containerWidth = 200;
    double containerHeight = 10;
 var _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();
  int _currentMax = 5;
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
bool flag=false;

bool loading=true;
TextEditingController _controller = TextEditingController();
  List<Details> DetailsList = [];
  List<Details> SearchDetailsList = [];
  List<Details> orderedDetailsList = [];
   List<Details> SearchorderedDetailsList = [];
  List<String> searchItems=[
    "a",
    "b",
    "c",
    "d"
   ];
   
   List<Details> SuggestionsDetailsList = [];
   List<Details> SearchSuggestionsDetailsList = [];
   String FinalPurchaseDate0=
  "";

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

// final connectivityResult = await (Connectivity().checkConnectivity());

 
Future getSearchData() async {


    if(MOB_not_EM!){
         final token = await createAlbumPurchaseHistoryDetailsMobile(
        "mobile", ID!);
    
    // final token = await createAlbumPurchaseHistoryDetailsEmail(
    //     "email", "wkhan5776@gmail.com");
    // print(token);
    var responseData = json.decode(token.body);
    print(responseData);

    for (int i = 0; i < responseData["data"].length; i++) {
      // int j=0;
      print(DetailsList.length);
      // temp_class.message = responseData["message"];
      // // temp_class.details["purchaseDate"] = responseData["data"][i]["purchaseDate"];
      // while(responseData["data"][i]["brand"]!=null)
      // {
      Details temp_class = new Details();
      temp_class.details["purchaseDate"] =
          responseData["data"][i]["purchaseDate"];
      temp_class.details["brand"] = responseData["data"][i]["brand"];
      temp_class.details["serialNo"] = responseData["data"][i]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["data"]["warrantyApp"];
      temp_class.details["price"] = responseData["data"][i]["price"];
      temp_class.details["prodName"] = responseData["data"][i]["name"];
      temp_class.details["imageProd"] = responseData["data"][i]["imageProd"];
      // temp_class.details["QROnProd"] 
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["data"][i]["expiry"];
      temp_class.details["batchNo"] = responseData["data"][i]["batchNo"];
      temp_class.details["warranty"] = responseData["data"][i]["warranty"];
      //  temp_class.details["imageQrOnProd"] = responseData["data"][i]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["data"][i]["mfgdate"];
      temp_class.details["shelflife"] = responseData["data"][i]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["data"][i]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["data"][i]["manuAddress"];
      //  temp_class.details["additionalDetails"] = responseData["data"][i]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["data"][i]["addtionalImages"];
      print(temp_class.details["brand"]);
      print(i);
       print(responseData["data"].length);

      SearchDetailsList.add(temp_class);
      // searchItems.add(temp_class.details["purchaseDate"]);
      print("ggggggg");
      print(DetailsList.length);
    }
   


   
//   Future.delayed(const Duration(milliseconds: 500), () {

// // Here you can write your code

//    if(SuggestionsDetailsList.length==0)
//     {
//     setState(() {
      
//       loading=false;
//       // flag=false;
//     });
//   }
// });
  
  // else{
  //   return Container(
  //     child: Text("No purchasesd done"),
  //   );
  // }

//       DetailsList.sort((a,b) {
//  var adate = a.details["mfgdate"]; //before -> var adate = a.expiry;
//  var bdate = b.details["mfgdate"];//before -> var bdate = b.expiry;
//  return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
// });

    // print(responseata

    for (int i = 0; i < DetailsList.length; i++) {
      print(DetailsList[i].details["purchaseDate"]);
    }
    // SearchDetailsList.sort((a, b) {
    //   var adate = a.details["purchaseDate"]; //before -> var adate = a.expiry;
    //   var bdate = b.details["purchaseDate"]; //before -> var bdate = b.expiry;
    //   return adate.compareTo(
    //       bdate); //to get the order other way just switch `adate & bdate`
    // });
    // print("--------");
    SearchorderedDetailsList = SearchDetailsList.toList();
    for (int i = 0; i < SearchorderedDetailsList.length; i++) {
      print(SearchorderedDetailsList[i].details["purchaseDate"]);
    }




 SearchSuggestionsDetailsList=SearchorderedDetailsList;


  
    return SearchSuggestionsDetailsList;
    }
    else{
       final token = await createAlbumPurchaseHistoryDetailsEmail(
        "email", ID!);
    
    // final token = await createAlbumPurchaseHistoryDetailsEmail(
    //     "email", "wkhan5776@gmail.com");
    // print(token);
    var responseData = json.decode(token.body);
    print(responseData);
for (int i = 0; i < responseData["data"].length; i++) {
      // int j=0;
      print(DetailsList.length);
      // temp_class.message = responseData["message"];
      // // temp_class.details["purchaseDate"] = responseData["data"][i]["purchaseDate"];
      // while(responseData["data"][i]["brand"]!=null)
      // {
      Details temp_class = new Details();
      temp_class.details["purchaseDate"] =
          responseData["data"][i]["purchaseDate"];
      temp_class.details["brand"] = responseData["data"][i]["brand"];
      temp_class.details["serialNo"] = responseData["data"][i]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["data"]["warrantyApp"];
      temp_class.details["price"] = responseData["data"][i]["price"];
      temp_class.details["prodName"] = responseData["data"][i]["name"];
      temp_class.details["imageProd"] = responseData["data"][i]["imageProd"];
      // temp_class.details["QROnProd"] 
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["data"][i]["expiry"];
      temp_class.details["batchNo"] = responseData["data"][i]["batchNo"];
      temp_class.details["warranty"] = responseData["data"][i]["warranty"];
      //  temp_class.details["imageQrOnProd"] = responseData["data"][i]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["data"][i]["mfgdate"];
      temp_class.details["shelflife"] = responseData["data"][i]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["data"][i]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["data"][i]["manuAddress"];
      //  temp_class.details["additionalDetails"] = responseData["data"][i]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["data"][i]["addtionalImages"];
      print(temp_class.details["brand"]);
      print(i);
      //  print(responseData["data"].length);

      SearchDetailsList.add(temp_class);
      searchItems.add(temp_class.details["brand"]);
      print("ggggggg");
      print(DetailsList.length);
    }
   


     Future.delayed(const Duration(milliseconds: 500), () {

// Here you can write your code

   if(SuggestionsDetailsList.length==0)
    {
    setState(() {
      
      loading=false;
      // flag=false;
    });
  }
});
  

//       DetailsList.sort((a,b) {
//  var adate = a.details["mfgdate"]; //before -> var adate = a.expiry;
//  var bdate = b.details["mfgdate"];//before -> var bdate = b.expiry;
//  return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
// });

    // print(responseata

    for (int i = 0; i < DetailsList.length; i++) {
      print(DetailsList[i].details["purchaseDate"]);
    }
    // DetailsList.sort((a, b) {
    //   var adate = a.details["purchaseDate"]; //before -> var adate = a.expiry;
    //   var bdate = b.details["purchaseDate"]; //before -> var bdate = b.expiry;
    //   return adate.compareTo(
    //       bdate); //to get the order other way just switch `adate & bdate`
    // });
    // print("--------");
   SearchorderedDetailsList = SearchDetailsList.toList();
    for (int i = 0; i < orderedDetailsList.length; i++) {
      print(orderedDetailsList[i].details["purchaseDate"]);
    }
    }
     
     
   
   SearchSuggestionsDetailsList=SearchorderedDetailsList;
   return SearchSuggestionsDetailsList;

  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future getData(int start_index,int end_index) async {


    if(MOB_not_EM!){
         final token = await createAlbumPurchaseHistoryDetailsMobile(
        "mobile", ID!);
    
    // final token = await createAlbumPurchaseHistoryDetailsEmail(
    //     "email", "wkhan5776@gmail.com");

    // print(token);
    var responseData = json.decode(token.body);
    print(responseData);

    for (int i = start_index; i < end_index; i++) {
      // int j=0;
      print(DetailsList.length);
      // temp_class.message = responseData["message"];
      // // temp_class.details["purchaseDate"] = responseData["data"][i]["purchaseDate"];
      // while(responseData["data"][i]["brand"]!=null)
      // {
      if(i<responseData["data"].length){
        Details temp_class = new Details();
      temp_class.details["purchaseDate"] =
          responseData["data"][i]["purchaseDate"];
      temp_class.details["brand"] = responseData["data"][i]["brand"];
      temp_class.details["serialNo"] = responseData["data"][i]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["data"]["warrantyApp"];
      temp_class.details["price"] = responseData["data"][i]["price"];
      temp_class.details["prodName"] = responseData["data"][i]["name"];
      temp_class.details["imageProd"] = responseData["data"][i]["imageProd"];
      // temp_class.details["QROnProd"] 
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["data"][i]["expiry"];
      temp_class.details["batchNo"] = responseData["data"][i]["batchNo"];
      temp_class.details["warranty"] = responseData["data"][i]["warranty"];
      //  temp_class.details["imageQrOnProd"] = responseData["data"][i]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["data"][i]["mfgdate"];
      temp_class.details["shelflife"] = responseData["data"][i]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["data"][i]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["data"][i]["manuAddress"];
      //  temp_class.details["additionalDetails"] = responseData["data"][i]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["data"][i]["addtionalImages"];
      print(temp_class.details["brand"]);
      // print(i);

      print("the length of items now is :");
       print(responseData["data"].length);
searchItems.add(temp_class.details["purchaseDate"]);
      
        DetailsList.add(temp_class);
      }
      
      
      print("details list length:");
      print(DetailsList.length);
    }
   


   
//   Future.delayed(const Duration(milliseconds: 500), () {

// // Here you can write your code

//    if(SuggestionsDetailsList.length==0)
//     {
//     setState(() {
      
//       loading=false;
//       // flag=false;
//     });
//   }
// });
  
  // else{
  //   return Container(
  //     child: Text("No purchasesd done"),
  //   );
  // }

//       DetailsList.sort((a,b) {
//  var adate = a.details["mfgdate"]; //before -> var adate = a.expiry;
//  var bdate = b.details["mfgdate"];//before -> var bdate = b.expiry;
//  return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
// });

    // print(responseata

    // for (int i = 0; i < DetailsList.length; i++) {
    //   print(DetailsList[i].details["purchaseDate"]);
    // }
    // DetailsList.sort((a, b) {
    //   var adate = a.details["purchaseDate"]; //before -> var adate = a.expiry;
    //   var bdate = b.details["purchaseDate"]; //before -> var bdate = b.expiry;
    //   return adate.compareTo(
    //       bdate); //to get the order other way just switch `adate & bdate`
    // });
    // print("--------");
    orderedDetailsList = DetailsList.toList();
    // for (int i = 0; i < orderedDetailsList.length; i++) {
    //   print(orderedDetailsList[i].details["purchaseDate"]);
    // }




 SuggestionsDetailsList=orderedDetailsList;


    if(start_index!=0)
    {
      _currentMax=_currentMax+5;
    }
    return SuggestionsDetailsList;
    }
    else{
       final token = await createAlbumPurchaseHistoryDetailsEmail(
        "email", ID!);
    
    // final token = await createAlbumPurchaseHistoryDetailsEmail(
    //     "email", "wkhan5776@gmail.com");
    // print(token);
    var responseData = json.decode(token.body);
    print(responseData);

    for (int i = start_index; i < end_index; i++) {
      // int j=0;
      print(DetailsList.length);
      // temp_class.message = responseData["message"];
      // // temp_class.details["purchaseDate"] = responseData["data"][i]["purchaseDate"];
      // while(responseData["data"][i]["brand"]!=null)
      // {
     if(i<responseData["data"].length){
        Details temp_class = new Details();
      temp_class.details["purchaseDate"] =
          responseData["data"][i]["purchaseDate"];
      temp_class.details["brand"] = responseData["data"][i]["brand"];
      temp_class.details["serialNo"] = responseData["data"][i]["serialNo"];
      // temp_class.details["warrantyApp"] = responseData["data"]["warrantyApp"];
      temp_class.details["price"] = responseData["data"][i]["price"];
      temp_class.details["prodName"] = responseData["data"][i]["name"];
      temp_class.details["imageProd"] = responseData["data"][i]["imageProd"];
      // temp_class.details["QROnProd"] 
      //     responseData["batchDetails"]["QROnProd"];
      temp_class.details["expiry"] = responseData["data"][i]["expiry"];
      temp_class.details["batchNo"] = responseData["data"][i]["batchNo"];
      temp_class.details["warranty"] = responseData["data"][i]["warranty"];
      //  temp_class.details["imageQrOnProd"] = responseData["data"][i]["imageQrOnProd"];
      temp_class.details["mfgdate"] = responseData["data"][i]["mfgdate"];
      temp_class.details["shelflife"] = responseData["data"][i]["shelflife"];
      temp_class.details["manuLicenseNo"] =
          responseData["data"][i]["manuLicenseNo"];
      temp_class.details["manuAddress"] =
          responseData["data"][i]["manuAddress"];
      //  temp_class.details["additionalDetails"] = responseData["data"][i]["addtionalDetails"];
      temp_class.details["additionalImages"] =
          responseData["data"][i]["addtionalImages"];
      print(temp_class.details["brand"]);
      // print(i);

      print("the length of items now is :");
       print(responseData["data"].length);
searchItems.add(temp_class.details["purchaseDate"]);
      
        DetailsList.add(temp_class);
      }
      print("ggggggg");
      print(DetailsList.length);
    }
    


     Future.delayed(const Duration(milliseconds: 500), () {

// Here you can write your code

   if(SuggestionsDetailsList.length==0)
    {
    setState(() {
      
      loading=false;
      // flag=false;
    });
  }
});
  

//       DetailsList.sort((a,b) {
//  var adate = a.details["mfgdate"]; //before -> var adate = a.expiry;
//  var bdate = b.details["mfgdate"];//before -> var bdate = b.expiry;
//  return adate.compareTo(bdate); //to get the order other way just switch `adate & bdate`
// });

    // print(responseata

    for (int i = 0; i < DetailsList.length; i++) {
      print(DetailsList[i].details["purchaseDate"]);
    }
    // DetailsList.sort((a, b) {
    //   var adate = a.details["purchaseDate"]; //before -> var adate = a.expiry;
    //   var bdate = b.details["purchaseDate"]; //before -> var bdate = b.expiry;
    //   return adate.compareTo(
    //       bdate); //to get the order other way just switch `adate & bdate`
    // });
    // print("--------");
    orderedDetailsList = DetailsList.toList();
    for (int i = 0; i < orderedDetailsList.length; i++) {
      print(orderedDetailsList[i].details["purchaseDate"]);

    }
    }
    SuggestionsDetailsList=orderedDetailsList;
    
    if(start_index!=0)
    {
      _currentMax=_currentMax+5;
    }
    return SuggestionsDetailsList;
  }
void search(String query){
  
  
  final suggestions1=SearchorderedDetailsList.where((element){
    final item=element.details["brand"].toLowerCase();
    final item2=element.details["prodName"].toLowerCase();
    final input=query.toLowerCase();
    return (item.contains(input)|| item2.contains(input));
  }).toList();
  
  var seen = Set<String>();
List<Details> uniquelist = suggestions1;
List<Details> emptyList=[];
  
 
  setState(() {
    
    
   
                    
                    
                    SuggestionsDetailsList=uniquelist;

                    if(suggestions1.isEmpty){


SuggestionsDetailsList=emptyList;
loading=false;

                    }
});
    

 
 
}
OverlayEntry? overlayEntry;
  @override
  // void initState() {
  //   // initUniLinks().then((value) => this.setState(() {
  //   //       link = value!;
  //   //     }));
  //   super.initState();
     
  // 
  // 
  // }
   int currentIndex = 0;
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
        () async {
      await getSearchData();
      setState(() {
        print("setstate calledd");
        print(searchItems);
        // getData();
        
      });
    }();
    // TODO: implement initState
    () async {
      await getData(0,_currentMax);
      setState(() {
        print("setstate calledd");
        print(searchItems);
        // getData();
        
      });
    }();


_scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
       () async {
      await getData(_currentMax,_currentMax+5);
      setState(() {
        print("setstate calledd");
        print(searchItems);
        // getData();
        
      });
    }();
      }
    });

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
late String couponExpired;
var coupon_img;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (() async {

                Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: ((context) =>HomeScreen(first_time: 0,
                                          mainLink: '',location_on: true,))),
                                      (Route<dynamic> route) => false,
                                      );
                                      return true;
          // // }
          // else{
          //     return value;
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
                            // Navigator.of(context).pop();
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
                          height: MediaQuery.of(context).size.width * 0.08,
                        width: MediaQuery.of(context).size.width * 0.08,
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
              // DemoItem('Carousel with indicator controller demo', '/indicator'),,
              //  CarouselWithIndicatorDemo(),
            Stack(
      children: [
        CarouselSlider.builder(
          // carouselController: _carouselController,
          
          itemCount: 9,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.24,
            disableCenter: true,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3, milliseconds: 50),
            reverse: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, i, id) {
            String Advertisement = "assets/Frame" + (i + 1).toString() + ".png";
            return GestureDetector(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      final Uri web_url = Uri.parse('https://veots.com/');
                      launchUrl(web_url);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.22,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          Advertisement,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                var url = imgList[i];
                print(url.toString());
              },
            );
          },
        ),
        Positioned(
          bottom: 20.0, // Adjust the position of the dots as needed
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(9, (index) {
              return Container(
                width: 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    ),

            SizedBox(
                height: MediaQuery.of(context).size.height / 50,
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
                      "All Rewards",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
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
                      "Presenting the coupon history",
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 70,
              ),
              //  SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.08,
              //  ),
              // SuggestionsDetailsList.length!=0?
              
              //  Container(
              //         color: Colors.blue,
              //         child: SuggestionsDetailsList.length==0?Container(
              //           child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [  Text("No purchases availableasssssssssssssssssss",
              //           style: TextStyle(color: Colors.black,),
              //           ),],
              //         ),
              //         ):Container()
                      
                    
              //       )
              if(coupons.length > 0)
                Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
                  crossAxisCount: 2,  
                  // crossAxisSpacing: 0.0,  
                  // mainAxisSpacing: 0.0  
              ), 
              itemCount: coupons.length,
              itemBuilder: (BuildContext context, int index){  
                DateTime expiryDate = DateTime.parse(coupons[index]["expiryDate"].substring(0,10));
               DateTime currentDate = DateTime.now();
                int differenceInDays = expiryDate.difference(currentDate).inDays;
                
                if(differenceInDays < 0 || differenceInDays == 0){
                  couponExpired = "expired";
                   coupon_img = "assets/coupon_expired.jpeg";
                }
               else
               {
                  couponExpired = differenceInDays.toString();
                  int cop_index = (index)%6;
                  if(cop_index == 1)
                  cop_index = 5;
                  coupon_img = "assets/coupon" + (cop_index.toString()) + ".jpeg";
               }
            //    if(couponExpired == "expired")
            //     return 
            //     Padding(padding: EdgeInsets.only(left: 10, right: 10),
            //  child: Stack(children: [
            //   Container(
            //     height: 180,
            //     width: 180,
            //     decoration: BoxDecoration(
            //     color: Color(0xfff4f4f4),
            //     borderRadius: BorderRadius.circular(20), // Adjust the value as per your preference
            //   ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //       Text(coupons[index]["couponHeader"], style: TextStyle(fontFamily: "Poppins Medium", color: Colors.black),),
            //       Container(padding: EdgeInsets.only(left: 10, right: 10), child: Text(coupons[index]["couponText"],textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: "Poppins Medium", color: Colors.black),
            //       maxLines: 3,)),
            //     ]),
            //   ),
            //   if (coupons[index]["couponLogoLink"] != "" && coupons[index]["couponLogoLink"] != null)
            //   Container(
            //     height: 30,
            //     width: 30,
            //     // color: Colors.red,
            //     child: Image.network(coupons[index]["couponLogoLink"] as String),
            //   )
            //   else
            //   Container(
            //     child: Text("Image is missing"),
            //   ),
            //   Positioned(
            //     top: 150,
            //     child: Container(
            //       height: 30,
            //       width: 176,
            //       child: Center(child: couponExpired == "expired" ? Text("Expired") : Text("${differenceInDays.toString()} Days!")),
            //       decoration: BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),), // Adjust the value as per your preference
            //   ),
            //     ),
            //   )
            // ],),
            //  ) ;
              //   Stack(
              //     children: [
              //       Container(
              //       margin: EdgeInsets.only(left: 10, right: 10),
              //       decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.blue, // Border color
              //   width: 2.0, // Border width
              // ),),
              //       height: 1000,
              //       // width: 180,
              //       // child: Center(child: 
              //       // Image.asset(
              //       //             coupon_img,)
              //       // ),
              //     ),
              //     Positioned(
              //               top: 20,
              //               left: 100,
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(5),
              //                                                 color: Colors.white,

              //                 ),
              //                 height: 25,
              //                 width: 65,
              //             child: couponExpired == "expired" ?  
              //             Center(child: Text("expired", style: TextStyle(color: Colors.black),)):  
              //             Center(child: Text(differenceInDays.toString())),
              //               ),
              //             )
              //     ]
              //   );
                // else 
              if(coupons[index]["isScratched"] == false)
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Scratcher(
                              enabled:  couponExpired == "expired" ? false : true,
                              brushSize: 40,
                              threshold: 70,
                              // color: Colors.red,
                              image: Image.asset(
                              coupon_img,),
                              // onChange: (value) => print("Scratch progress: $value%"),
                              onThreshold: () async{
                                print(coupons[index]["isScratched"]);
                                print("----------------------");
                                setState(() {
                                      coupons[index]["isScratched"] = true;
                                });
                                print(coupons[index]["isScratched"]);
                               print("Threshold reached, you won!");
                               String url =  'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3005/api/coupons/scracthed/' + coupons[index]["couponType"].toString() + '/' + coupons[index]["_id"];
                               final response = await http.post(
                         Uri.parse(url),
                        headers: <String, String>{
                       'Content-Type': 'application/json',
                       },
                                       );
                                       print(response.statusCode);
                              } ,
                              child: Stack(children: [
                                Container(
                                      height: MediaQuery.of(context).size.height * 0.225,
                                      width: MediaQuery.of(context).size.width * 0.455,
                                      decoration: BoxDecoration(
                            color: Color(0xfff4f4f4),
                            borderRadius: BorderRadius.circular(20), // Adjust the value as per your preference
                          ),
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(coupons[index]["couponHeader"], style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(padding: EdgeInsets.only(left: 10, right: 10), child: Text(coupons[index]["couponText"],textAlign: TextAlign.center,)),
                      // Text(coupons[index]["couponText"] as String)
                                      ]),
                                ),
                                if (coupons[index]["couponLogoLink"] != "" && coupons[index]["couponLogoLink"] != null)
                                Container(
                                      height: MediaQuery.of(context).size.height * 0.038,
                                      width: MediaQuery.of(context).size.width * 0.075,
                                      child: Image.network(coupons[index]["couponLogoLink"] as String),
                                )
                                else
                                Container(
                                      child: Text("Image is missing"),
                                )
                              ],)
                            ),
                    ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.026,
                            left: MediaQuery.of(context).size.width * 0.255,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                                              color: Colors.white,
                              ),
                              height: 25,
                              width: 65,
                          child: couponExpired == "expired" ?  
                          Center(child: Text("expired", style: TextStyle(color: Colors.black),)):  
                          // Center(child: Text(differenceInDays.toString(), style: TextStyle(color: Colors.black),)),
                          Center(
                            child: Text("${differenceInDays.toString()} days!",overflow: TextOverflow.ellipsis,
                                            maxLines: 3,style: TextStyle(color: Colors.black),),
                          ) 
                            ),
                          )
                          ]
                );
          else
          return InkWell(
            onTap: () {
              print("coupon selected");
              Navigator.of(context).push(
          MaterialPageRoute(
              builder: ((context) => Coupon_Details(my_coupon: coupons[index],)
                  )),
        );
            },
            child:
             Padding(padding: EdgeInsets.only(left: 10, right: 10),
             child: Stack(children: [
              Container(
                height:MediaQuery.of(context).size.height * 0.225,
                width: MediaQuery.of(context).size.width * 0.455,
                decoration: BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(20), // Adjust the value as per your preference
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(coupons[index]["couponHeader"], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  Container(padding: EdgeInsets.only(left: 10, right: 10), child: Text(coupons[index]["couponText"],textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,
                  maxLines: 3,style: TextStyle(color: Colors.black),)),
                ]),
              ),
              if (coupons[index]["couponLogoLink"] != "" && coupons[index]["couponLogoLink"] != null)
              Container(
                height: MediaQuery.of(context).size.height * 0.038,
                width: MediaQuery.of(context).size.width * 0.075,
                // color: Colors.red,
                child: Image.network(coupons[index]["couponLogoLink"] as String),
              )
              else
              Container(
                child: Text("Image is missing"),
              ),
              Positioned(
                            top: MediaQuery.of(context).size.height * 0.026,
                            left: MediaQuery.of(context).size.width * 0.255,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                                              color: Colors.white,
                              ),
                              height: 25,
                              width: 65,
                          child: couponExpired == "expired" ?  
                          Center(child: Text("expired", style: TextStyle(color: Colors.black),)):  
                          // Center(child: Text(differenceInDays.toString(), style: TextStyle(color: Colors.black),)),
                          Center(
                            child: Text("${differenceInDays.toString()} days!",overflow: TextOverflow.ellipsis,
                                            maxLines: 3,style: TextStyle(color: Colors.black),),
                          ) 
                            ),
                          )
            ],),
            
             ) 
             ,
          );
              },  
),
              )
              else
              Container(
                padding: EdgeInsets.only(top: 70),
                child: Text("No rewards to show", style: TextStyle(fontSize: 20),  ),
              )

// // -----------------------------------------------------------
// class RandomColorModel {
//   Random random = Random();
//   Color getColor() {
//     return Color.fromARGB(random.nextInt(300), random.nextInt(300),
//         random.nextInt(300), random.nextInt(300));
//   }
// }



// SingleChildScrollView(
  
//   child: GridView.count(
//           crossAxisCount: 2,
//           // crossAxisSpacing: 10.0,
//           // mainAxisSpacing: 10.0,
//           shrinkWrap: true,
//           children: List.generate(5, (index) {
//               return 
//                 // padding: const EdgeInsets.all(10.0),
//                    Scratcher(
//   brushSize: 3,
//   threshold: 5,
//   // color: Colors.red,
//   image: Image.network(
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',),
//   onChange: (value) => print("Scratch progress: $value%"),
//   onThreshold: () => print("Threshold reached, you won!"),
//   child: Container(
//     height: 100,
//     width: 150,
//     color: Colors.blue,
//   ),
// );
            
//             },),
//         ),

// )
              
            ],
          ),
           drawer:  HamWidget()),
        ));
  }
}

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


class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;
    
    return  ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          offset += 5;
          time = 800 + offset;
          
          print(time);
          
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.shade300,
                child: ShimmerLayout(),
                period: Duration(milliseconds: time),
              ));
        },
      );
    
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 200;
    double containerHeight = 10;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Column(

        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),
          Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.65,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
      SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),
          Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.65,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
      SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),
          Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.65,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
      SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),
          Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.65,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
      SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),
          Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.65,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
        ],
      )
    );
  }
}



final List<String> imgList = [

  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
