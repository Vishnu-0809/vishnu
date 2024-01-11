import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';


const List<String> list1 = <String>[ 'Type', 'Exp. Date', 'Mfg. Date'];
const List<String> list2 = <String>['YYYY', '2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2024','2025','2026','2027','2028','2029','2030','2031','2032','2033','2034','2035','2036','2037','2038','2039','2040','2041',];
const List<String> list3 = <String>['MM','1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
const List<String> list4 = <String>['DD','01', '02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29', '30','31'];

class DateInput extends StatefulWidget {
  const DateInput({super.key});

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  late VideoPlayerController _controller;
  String videoUrl = 'https://veots2.s3.ap-south-1.amazonaws.com/app8106-testing72216-prodVedioLink.mp4';
   var controller = VideoPlayerController.network('https://veots2.s3.ap-south-1.amazonaws.com/app8106-testing72216-prodVedioLink.mp4');
  String dropdownValue1 = list1.first;
  String dropdownValue2 = list2.first;
  String dropdownValue3 = list3.first;
  String dropdownValue4 = list4.first;
  @override
  void initState() {
    super.initState();
    
  }
  double videoContainerRatio = 250;

    double getScale() {
      double videoRatio = controller.value.aspectRatio;
     
      if (videoRatio < videoContainerRatio) {
      ///for tall videos, we just return the inverse of the controller aspect ratio
        return videoContainerRatio / videoRatio;
      } else {
        ///for wide videos, divide the video AR by the fixed container AR
        ///so that the video does not over scale

        return videoRatio / videoContainerRatio;
      }
    }


bool isValidDate(String dateString) {
  print(dateString);
  
  try {
    List<String> dateParts = dateString.split('-');
    if (dateParts.length != 3) return false;

    int year = int.tryParse(dateParts[0]) ?? 0;
    int month = int.tryParse(dateParts[1]) ?? 0;
    int day = int.tryParse(dateParts[2]) ?? 0;

    if (month < 1 || month > 12 || day < 1) return false;

    int maxDays = 31;
    if ([4, 6, 9, 11].contains(month)) {
      maxDays = 30;
    } else if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        maxDays = 29;
      } else {
        maxDays = 28;
      }
    }

    return day <= maxDays;
  } catch (e) {
    return false;
  }
}

Future<void> sendPostRequest() async {
  // Replace the URL with the actual endpoint you want to send the request to
  var url = Uri.parse('https://ede7-35-150-39-86.ngrok-free.app/customer/product-date-intake/');

  print(custId_coupon);

  // Replace the headers with the necessary headers for your request
  Map<String, String> headers = {
    'Content-Type': 'application/json', // Example header
    // Add other headers as needed
  };

  // Replace the body with the data you want to send in the request
  Map<String, dynamic> body = {
    "date":"2023-03-22",
    "dateType":"expiryDate",
    "customerId":"65088b32a499dcafcb520148",
    "productId":"27966804131409240105app81060001"
    // Add other data fields as needed
  };

  try {
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Request successful, handle the response data here
      var responseData = jsonDecode(response.body);
      print('Response: $responseData');
    } else {
      // Request failed with an error code
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // An error occurred during the request
    print('Error sending POST request: $e');
  }
}

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
            body: Column(
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
                                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
                                    //  (context)=>HomeScreen(first_time: 0,
                                    //  mainLink: '',location_on: true,)), (route) => false);
                                  },
                                  icon: const Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ))),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                  //  Not_icon(),
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
                          //      onTap: (){
                          // keyD.currentState?.openDrawer();    },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                        // margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width * 0.1),
                        margin: const EdgeInsets.only(right: 30),
                        child: 
                          SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff493979),
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(10)),
                                // padding:
                                //     EdgeInsets.all(10)), //content padding inside button)
                            ),
                            onPressed: () {
                              controller = VideoPlayerController.network(videoUrl);
                              controller.setLooping(true);
                              controller.initialize().then((_) => setState(() {}));
                              controller.play();
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return WillPopScope(
                               onWillPop: () async => false,
                               child: 
                               Transform.scale(
                                scale: getScale(),
                                 child: AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                   child: AlertDialog(
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
                                                          "How to use",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              // fontWeight: FontWeight.w400,
                                                              fontFamily: "Poppins Medium",
                                                              fontSize: 20),
                                                        ),
                                                        )
                                                      ] else
                                                        const FittedBox(
                                                          fit: BoxFit.fitHeight,
                                                          child: Text(
                                                          "How to use",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              // fontWeight: FontWeight.w400,
                                                              fontFamily: "Poppins Medium",
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
                                          content:  VideoPlayer(controller)
                                        ),
                                 ),
                               ),
                                    );
                                  });
                            },
                            child: const FittedBox(
                                child: Text(
                              'How to use',
                              style: TextStyle( 
                                // fontWeight: FontWeight.bold
                                fontFamily: "Poppins Medium",
                                fontSize: 8,
                              ),
                            )
                            )),
                                ),
                      ),
                ],
              ),
                SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Container(
                  child: Text(
                    "Product Registered to you successfully",
                    style: 
                    // Theme.of(context).textTheme.headlineMedium,
                    TextStyle(
                        color: const Color(0xff002060),
                        // fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontSize: 16,
                        fontFamily: "Poppins Medium",
                        // fontWeight: FontWeight.bold
                        ),
                  ),
              
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
               Text(
                "Get expiry notifications",
                style: 
                // Theme.of(context).textTheme.headlineMedium,
                TextStyle(
                    color: const Color(0xffff1616),
                    // fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontSize: 16,
                    fontFamily: "Poppins Medium",
                    // fontWeight: FontWeight.bold
                    ),
              ),
               Container(
                 child: Text(
                    "by filling the product Mfg./Exp. date below",
                    style: 
                    // Theme.of(context).textTheme.headlineMedium,
                    TextStyle(
                        color: const Color(0xff002060),
                        // fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontSize: 12,
                        fontFamily: "Poppins Medium",
                        // fontWeight: FontWeight.bold
                        ),
                  ),
               ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    // Container(
                    //   padding: EdgeInsets.all(2),
                    //   decoration: BoxDecoration(
                    //   color: Colors.blue, // Set your desired background color
                    //   borderRadius: BorderRadius.circular(15.0), // Adjust the radius value to change corner roundness
                    //   ),
                    //   child: DropdownButton<String>(
                    //     underline: SizedBox(),
                    //       value: dropdownValue,
                    //       icon: const Icon(Icons.keyboard_arrow_down),
                    //       // elevation: 16,
                    //       style: const TextStyle(color: Colors.deepPurple),
                    //       // underline: Container(
                    //       //   height: 2,
                    //       //   color: Colors.deepPurpleAccent,
                    //       // ),
                    //       onChanged: (String? value) {
                    //         // This is called when the user selects an item.
                    //         setState(() {
                    //           dropdownValue = value!;
                    //         });
                    //       },
                    //       items: list.map<DropdownMenuItem<String>>((String value) {
                    //         return DropdownMenuItem<String>(
                    //           value: value,
                    //           child: Text(value),
                    //         );
                    //       }).toList(),
                    //     ),
                    // ),
                    
                    Container(
                    padding: EdgeInsets.only(left:8),
                    decoration: BoxDecoration(
                    color: Color(0xff002060), // Set your desired background color
                    borderRadius: BorderRadius.circular(15.0), // Adjust the radius value to change corner roundness
                    ),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                        value: dropdownValue1,
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                        // elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.grey[200],
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue1 = value!;
                          });
                        } ,
                        items: list1.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  ),
                   Container(
                     padding: EdgeInsets.only(left:8),
                    decoration: BoxDecoration(
                    color: Color(0xff002060), // Set your desired background color
                    borderRadius: BorderRadius.circular(15.0), // Adjust the radius value to change corner roundness
                    ),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                        value: dropdownValue2,
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                        // elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.grey[200],
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged:  (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue2 = value!;
                          });
                        },
                        items: list2.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  ),
                  Container(
                     padding: EdgeInsets.only(left:8),
                    decoration: BoxDecoration(
                    color: Color(0xff002060), // Set your desired background color
                    borderRadius: BorderRadius.circular(15.0), // Adjust the radius value to change corner roundness
                    ),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                        value: dropdownValue3,
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                        // elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.grey[200],
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged:  (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue3 = value!;
                          });
                        } ,
                        items: list3.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  ),
                  Container(
                     padding: EdgeInsets.only(left:8),
                    decoration: BoxDecoration(
                    color: Color(0xff002060), // Set your desired background color
                    borderRadius: BorderRadius.circular(15.0), // Adjust the radius value to change corner roundness
                    ),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                        value: dropdownValue4,
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                        // elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.grey[200],
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue4 = value!;
                          });
                        } ,
                        items: list4.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  ),
                    
                  SizedBox(width: 2,),
                 
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.065,
                            // ),
                            Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Color(0xff00b7ff),
                                Color(0xffaa2aae)
                              ])),
                              child: ElevatedButton(
                                onPressed: () {
                                  bool valid_date = isValidDate(dropdownValue2+"-"+"0"+dropdownValue3+"-"+dropdownValue4);
                                  if(!valid_date) showDialog(
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
                                                    "ALERT",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 20),
                                                  ),
                                                ] else
                                                  const Text(
                                                    "ALERT",
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
                                      'The date you have entered is not a valid one',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05),
                                    ),
                                  );
                                });
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: FittedBox(
                                    child: 
                                    Text(
                                      'Submit',
                                      style:
                                          //  Theme.of(context).textTheme.bodyMedium,
                                          TextStyle(
                                        fontSize: 13.5,
                                        fontFamily: "Poppins Medium",
                                        // fontSize: MediaQuery.of(context).size.width*0.030
                                      ),
                                    ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Color(0xff00b7ff),
                                Color(0xffaa2aae)
                              ])),
                              child: ElevatedButton(
                                onPressed: () {
                                 
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: FittedBox(
                                    child: 
                                    Text(
                                      'Skip',
                                      style: TextStyle(
                                        fontFamily: "Poppins Medium",
                                        fontSize: 13.5,
                                        // fontSize: MediaQuery.of(context).size.width*0.030
                                      ),
                                    ),
                                   
                                ),
                              ),
                            )
                          ],
                        ),
            ],),
          ),
    );
      
  }
}
