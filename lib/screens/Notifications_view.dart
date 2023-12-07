import 'dart:convert';
import 'package:Veots/widgets/ham.dart';
import 'package:Veots/widgets/not_icon.dart';
import 'package:badges/badges.dart' as badges;
import 'package:Veots/screens/product_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:Veots/widgets/send_accept.dart';
import '../models/class_models.dart';
import 'constants.dart';
import 'home_page.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

var _scaffoldKey = new GlobalKey<ScaffoldState>();
int k = 0;
List total = [];
List total_expiry = [];
List total_warranty = [];
List Data = [];
List expiredData = [];
List oneWeekexp = [];
DateTime date = DateTime.now();

ListView? view;

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

class _NotificationViewState extends State<NotificationView> {
  void DataOneWeekExpiry(List<String>? oneweek) async {
    oneWeekexp = [];

    if (oneweek != null) {
      for (int i = 0; i < oneweek.length; i++) {
        List list = oneweek[i].split(' ');
        list.insert(
            4, DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
        if (list.length == 6) {
          list.insert(
              5,
              DateFormat.yMd()
                  .format(date)
                  .compareTo(DateFormat.yMd().format(DateTime.parse(list[1])))
                  .toString());
          if (date.difference(DateTime.parse(list[1])).inDays <= 7) {
            oneWeekexp.add(list);
          }
        } else {
          list.insert(
              5,
              DateFormat.yMd()
                  .format(date)
                  .compareTo(DateFormat.yMd().format(DateTime.parse(list[1])
                      .add(Duration(days: int.parse(list[5])))))
                  .toString());
          if (date
                  .difference(DateTime.parse(list[1])
                      .add(Duration(days: int.parse(list[6]))))
                  .inDays <=
              7) {
            oneWeekexp.add(list);
          }
        }
        // print(date.difference(DateTime.parse(list[1])).inDays); // expired or not
        // if(date.difference(DateTime.parse(list[1])).inDays<=7)
        // {
        //   oneWeekexp.add(list);
        //  }
      }
    }
  }

  void Dataexpiry(List<String>? expiredData_before) async {
    expiredData = [];

    if (expiredData_before != null) {
      for (int i = 0; i < expiredData_before.length; i++) {
        List list = expiredData_before[i].split(' ');
        list.insert(
            4, DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
        // list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]))).toString());
        // print(date.difference(DateTime.parse(list[1])).inDays); // expired or not
        // if(date.difference(DateTime.parse(list[1])).inDays<=7)
        // {
        //   expiredData.add(list);
        // }
        if (list.length == 6) {
          list.insert(
              5,
              DateFormat.yMd()
                  .format(date)
                  .compareTo(DateFormat.yMd().format(DateTime.parse(list[1])))
                  .toString());
          if (date.difference(DateTime.parse(list[1])).inDays <= 7) {
            expiredData.add(list);
          }
        } else {
          list.insert(
              5,
              DateFormat.yMd()
                  .format(date)
                  .compareTo(DateFormat.yMd().format(DateTime.parse(list[1])
                      .add(Duration(days: int.parse(list[5])))))
                  .toString());
          if (date
                  .difference(DateTime.parse(list[1])
                      .add(Duration(days: int.parse(list[6]))))
                  .inDays <=
              7) {
            expiredData.add(list);
          }
        }
      }
    }
  }

  void data(List<String>? data) async {
    // print(shref.getStringList("data"));
    Data = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        List list = data[i].split(' ');
        list.insert(
            4, DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
        // list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]))).toString()); // expired or not
        // Data.add( list);
        if (list.length == 6) {
          list.insert(
              5,
              DateFormat.yMd()
                  .format(date)
                  .compareTo(DateFormat.yMd().format(DateTime.parse(list[1])))
                  .toString());
          Data.add(list);
        } else {
          list.insert(
              5,
              DateFormat.yMd()
                  .format(date)
                  .compareTo(DateFormat.yMd().format(DateTime.parse(list[1])
                      .add(Duration(days: int.parse(list[5])))))
                  .toString());
          Data.add(list);
        }
        //inserting each dat"a elemnet to list
      }
    }
    print(data);
    setState(() {});
  }

  void combine_data(total, data, expired, week) {
    // total_expiry=[];

    print("----------------------------");
    print("data");
    print(data);
    print("----------------------------");
    for (int i = 0; i < data.length; i++) {
      total.add(data[i]);
    }
    print("----------------------------");
    print("expireddata");
    print(expired);
    print("----------------------------");
    for (int i = 0; i < expired.length; i++) {
      total.add(expired[i]);
    }

    print("----------------------------");
    print("oneweekdata");
    print(week);
    print("----------------------------");
    for (int i = 0; i < week.length; i++) {
      total.add(week[i]);
    }

    print("-------------------------------");
    print("total data");
    print(total);
    print('------------------------');
  }

  List Combining_expiring_warranty(total_expiry, total_warranty) {
    total = [];
    print(" expiry");
    print(total_expiry);
    print("warranty");
    print(total_warranty);
    for (int i = 0; i < total_expiry.length; i++) {
      total.add(total_expiry[i]);
    }

    for (int i = 0; i < total_warranty.length; i++) {
      total.add(total_warranty[i]);
    }
    print('------------------------');
    print("total waranty and notifications");
    print(total);
    print('------------------------');
    total.sort((a, b) {
      DateTime dateA = DateTime.parse(a[4]);
      DateTime dateB = DateTime.parse(b[4]);
      return dateA.compareTo(dateB);
    });
    return total;
  }

  void notifications() async {
    SharedPreferences shref = await SharedPreferences.getInstance();
    data(shref.getStringList("data"));
    Dataexpiry(shref.getStringList("expiredData"));
    print(shref.getStringList("weekexpired"));
    DataOneWeekExpiry(shref.getStringList("weekexpired"));
    combine_data(total_expiry, Data, expiredData, oneWeekexp);
  }

  void warranty() async {
    SharedPreferences shref = await SharedPreferences.getInstance();
    data(shref.getStringList("datawarranty"));
    Dataexpiry(shref.getStringList("expiredDatawarranty"));
    print(shref.getStringList("weekexpiredwarranty"));
    DataOneWeekExpiry(shref.getStringList("weekexpiredwarranty"));
    combine_data(total_warranty, Data, expiredData, oneWeekexp);
  }

  @override
  void initState() {
    super.initState();
    total = [];
    total_expiry = [];
    total_warranty = [];
    Data = [];
    expiredData = [];
    oneWeekexp = [];
    notifications();
    warranty();

    // print(formattedDate formatDate);
  }

  Future<Null> _onrefresh() {
    return Future.delayed(Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(

            // child: ,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Container(
                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
                margin: const EdgeInsets.only(top: 0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: const Color(0xff002060),
                            size: MediaQuery.of(context).size.width * 0.05,
                          )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/veots_logo_wo_tl.png',
                        height: MediaQuery.of(context).size.width * 0.08,
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
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
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                  first_time: 0,
                                                  mainLink: '',
                                                  location_on: true,
                                                )),
                                        (route) => false);
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
                    Container(
                        height: MediaQuery.of(context).size.width * 0.07,
                        width: MediaQuery.of(context).size.width * 0.07,
                        decoration: const BoxDecoration(
                          color: Color(0xff002060),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: InkWell(
                              onTap: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                size: MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 12,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins Medium",
                            color: Color(0xff3b3b3b),
                            fontSize:
                                MediaQuery.of(context).size.width * 0.042),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        "List displayed here disappears a week after expiry",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontFamily: "Mont",
                          color: Colors.black,
                          // fontStyle: FontStyle.italic,
                          // fontSize: MediaQuery.of(context).size.width * 0.035,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 10, right: 10),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: MediaQuery.of(context).size.height * 0.052,
                    //         width: MediaQuery.of(context).size.width * 0.85,
                    //         // margin: const EdgeInsets.fromLTRB(32, 32,64, 32),
                    //         child: TextFormField(
                    //           style: TextStyle(color: Colors.black),
                    //           // controller: _controller,
                    //           // onChanged: search,
                    //           decoration: InputDecoration(
                    //               fillColor: Color.fromARGB(255, 222, 222, 222),
                    //               disabledBorder: OutlineInputBorder(
                    //                 borderSide: BorderSide(
                    //                     width: 0,
                    //                     color: const Color(0xFFfafafa)),
                    //                 borderRadius: BorderRadius.circular(5),
                    //               ),
                    //               enabledBorder: OutlineInputBorder(
                    //                 borderSide: BorderSide(
                    //                     width: 0,
                    //                     color: const Color(0xFFfafafa)),
                    //                 borderRadius: BorderRadius.circular(5),
                    //               ),
                    //               border: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(5),
                    //               ),
                    //               filled: true,
                    //               // fillColor: const Color(0xFF1E1E1E),
                    //               labelText: "Search here"),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.035,
                    // ),
                    Combining_expiring_warranty(total_expiry, total_warranty)
                            .isNotEmpty
                        ? Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: future_builder(Combining_expiring_warranty(
                                total_expiry, total_warranty)))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/Notification.jpg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                              ),
                              Text(
                                "Nothing to display",
                                style: TextStyle(
                                    color: Color(0xff3b3b3b),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat-SemiBold",
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.045),
                              ),
                              Text(
                                "stay tuned for updates and more",
                                style: TextStyle(
                                    color: Color(0xff3F60A0),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ])),
        drawer: HamWidget(),
      ),
    );
  }

  future_builder(List data) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          List<String> dateComponents = data[index][4].split('/');
          int month = int.parse(dateComponents[0]);
          int day = int.parse(dateComponents[1]);
          int year = int.parse(dateComponents[2]);
          DateTime x = DateTime(year, month, day);
          String presentValue = DateFormat('EEE, d MMM yy').format(x);
          String prevValue = "";
          if (index != 0) {
            List<String> dateComponentsPrev = data[index - 1][4].split('/');
            int monthPrev = int.parse(dateComponentsPrev[0]);
            int dayPrev = int.parse(dateComponentsPrev[1]);
            int yearPrev = int.parse(dateComponentsPrev[2]);
            DateTime y = DateTime(yearPrev, monthPrev, dayPrev);
            prevValue = DateFormat('EEE, d MMM yy').format(y);
          }
          // print("On " + formattedDate);
          if (prevValue != presentValue) {
            return Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "On " + presentValue,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Poppins Medium",
                          color: Color(0xff002060),
                          // fontStyle: FontStyle.italic,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                        ),
                      ),
                    ],
                  ),
                  Card(
                      margin: const EdgeInsets.only(top: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), //<-- SEE HERE
                      ),
                      color: double.parse(data[index][5]) < 0
                          ? Color(0xffF5F5F5)
                          : Color(0xffdfdfdf),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 23, top: 10, bottom: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.26,
                              decoration: BoxDecoration(
                                  // color: Color(0xff00b7ff),
                                  borderRadius: BorderRadius.circular(5)),
                              child: CachedNetworkImage(
                                imageUrl: data[index][3],
                                fit: BoxFit.fill,
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              // Image.network(data[index][3]
                              // , fit: BoxFit.fill,),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   data[index][4],
                                //   style: TextStyle(
                                //       fontFamily: "Mont",
                                //       color: double.parse(data[index][5]) < 0
                                //           ? Color(0xff002060)
                                //           : Color(0xff3b3b3b),
                                //       fontSize:
                                //           MediaQuery.of(context).size.width *
                                //               0.025),
                                // ),
                                // SizedBox(
                                //   height: 3,
                                // ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    double.parse(data[index][5]) < 0
                                        ? (data[index].length == 8
                                            ? 'Warranty for this product would end soon'
                                            : "This product will be expiring very soon")
                                        : (data[index].length == 8
                                            ? "Warranty Ended"
                                            : "This product is Expired"),
                                    style: TextStyle(
                                        fontFamily: "MontBold",
                                        color: double.parse(data[index][5]) < 0
                                            ? Colors.red
                                            : Color(0xff262626),
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Text(
                                    "Click on product details below for more info",
                                    style: TextStyle(
                                        fontFamily: "Poppins Medium",
                                        color: double.parse(data[index][5]) < 0
                                            ? Color(0xff002060)
                                            : Color(0xff8a8a8a),
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.0178),
                                  ),
                                ),
                                //
                                TextButton(
                                  onPressed: () {
                                    // Add your logic for when the container is pressed here
                                    product_details(
                                        data[index][0], data[index][2]);
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets
                                        .zero, // Remove padding to make it the same size as the container
                                  ),
                                  child: Container(
                                    // color: Colors.red,
                                    height: MediaQuery.of(context).size.width *
                                        0.065,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Product Details",
                                          softWrap: true,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontFamily: "Mont",
                                            color:
                                                double.parse(data[index][5]) < 0
                                                    ? Color(0xff3b3b3b)
                                                    : Color(0xff0004aad),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.028,
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color(0xff002060),
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            );
          }

          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), //<-- SEE HERE
              ),
              color: double.parse(data[index][5]) < 0
                  ? Color(0xffF5F5F5)
                  : Color(0xffdfdfdf),
              child: Padding(
                padding: const EdgeInsets.only(left: 23, top: 10, bottom: 1),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.26,
                      decoration: BoxDecoration(
                          // color: Color(0xff00b7ff),
                          borderRadius: BorderRadius.circular(5)),
                      child: CachedNetworkImage(
                        imageUrl: data[index][3],
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // Image.network(data[index][3]
                      // , fit: BoxFit.fill,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index][4],
                          style: TextStyle(
                              fontFamily: "Mont",
                              color: double.parse(data[index][5]) < 0
                                  ? Color(0xff002060)
                                  : Color(0xff3b3b3b),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            double.parse(data[index][5]) < 0
                                ? (data[index].length == 8
                                    ? 'Warranty for this product would end soon'
                                    : "This product will be expiring very soon")
                                : (data[index].length == 8
                                    ? "Warranty Ended"
                                    : "This product is Expired"),
                            style: TextStyle(
                                fontFamily: "MontBold",
                                color: double.parse(data[index][5]) < 0
                                    ? Colors.red
                                    : Color(0xff262626),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Text(
                            "Click on product details below for more info",
                            style: TextStyle(
                                fontFamily: "Poppins Medium",
                                color: double.parse(data[index][5]) < 0
                                    ? Color(0xff002060)
                                    : Color(0xff8a8a8a),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.0178),
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          height: MediaQuery.of(context).size.width * 0.065,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Product Details",
                                softWrap: true,
                                maxLines: 2,
                                style: TextStyle(
                                    fontFamily: "Mont",
                                    color: double.parse(data[index][5]) < 0
                                        ? Color(0xff3b3b3b)
                                        : Color(0xff0004aad),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.028),
                              ),
                              IconButton(
                                  onPressed: () {
                                    product_details(
                                        data[index][0], data[index][2]);
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff002060),
                                    size: MediaQuery.of(context).size.width *
                                        0.028,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  void product_details(String bNo, String cid) async {
    var res = await createAlbum_notificat_details(bNo, cid);
    var response = jsonDecode(res.body);
    Details temp_class = new Details();
    temp_class.details["message"] = response["message"];
    temp_class.details["brand"] = response["details"]["brand"];
    temp_class.details["serialNo"] = response["details"]["serialNo"];
    temp_class.details["price"] = response["details"]["price"];
    temp_class.details["prodName"] = response["details"]["name"];
    temp_class.details["imageProd"] = response["details"]["imageProd"];
    temp_class.details["expiry"] = response["details"]["expiry"];
    temp_class.details["batchNo"] = response["details"]["batchNo"];
    temp_class.details["warranty"] = response["details"]["warranty"];
    temp_class.details["imageQrOnProd"] = response["details"]["imageQrOnProd"];
    temp_class.details["mfgdate"] = response["details"]["mfgdate"];
    temp_class.details["shelflife"] = response["details"]["shelflife"];
    temp_class.details["manuLicenseNo"] = response["details"]["manuLicenseNo"];
    temp_class.details["manuAddress"] = response["details"]["manuAddress"];
    temp_class.details["additionalDetails"] =
        response["details"]["additionalDetails"];
    temp_class.details["additionalImages"] =
        response["details"]["additionalImages"];

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProdDetails(link: "", snapshot: temp_class),
    ));
  }
}
