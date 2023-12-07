import 'package:Veots/widgets/ham.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:timelines/timelines.dart';

import '../widgets/not_icon.dart';
import 'home_page.dart';

class Tracking_history extends StatefulWidget {
  const Tracking_history(
      {super.key, required this.tracking, required this.manuAddress});
  final List tracking;
  final String manuAddress;
  @override
  State<Tracking_history> createState() => _Tracking_historyState();
}

var _scaffoldKey = new GlobalKey<ScaffoldState>();

class _Tracking_historyState extends State<Tracking_history> {
  List trackingDetails = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.manuAddress);
    // trackingDetails=[];
    // if (widget.tracking==null )
    // {
    //   // widget.tracking.insert(0, {'manuAddres':widget.manuAddress});
    //   // trackingDetails=widget.tracking;
    //   trackingDetails=[{'manuAddres':widget.manuAddress}];
    // }
    // else{
    //   trackingDetails.insert(0, {'manuAddres':widget.manuAddress});
    // }
    // print(trackingDetails);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
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
                                builder: ((context) => HomeScreen(
                                      first_time: 0,
                                      mainLink: '',
                                      location_on: true,
                                    ))),
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
                    child: Image.asset(
                      'assets/logo_veots.jpeg',
                      height: MediaQuery.of(context).size.width * 0.09,
                      width: MediaQuery.of(context).size.width * 0.09,
                    ),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.45,
                  // ),
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
                                  // /chnaged
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
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.015,
                  // ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track Product',
                      style: TextStyle(
                        fontFamily: 'MontBold',
                        fontSize: MediaQuery.of(context).size.width * 0.046,
                        // color: Color(0xFF00E54E)
                      ),
                    ),
                    Text(
                      'Know your product journey',
                      style: TextStyle(
                        fontFamily: 'MontBold',
                        fontSize: MediaQuery.of(context).size.width * 0.031,
                        // color: Color(0xFF00E54E)
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.tracking == null
                                ? 1
                                : widget.tracking.length + 1,
                            itemBuilder: (context, index) {
                              return Node_timeLine(index, context);
                            })),
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: HamWidget(),
      ),
    );
  }

  Widget Node_timeLine(index, context) {
    return TimelineTile(
      mainAxisExtent: 80,
      nodePosition: 0.2,
      node: TimelineNode(
        startConnector: SolidLineConnector(
          color: Color(0xFFD7D7D7),
          thickness: 10,
        ),
        endConnector: SolidLineConnector(
          color: Color(0xFFD7D7D7),
          thickness: 10,
        ),
      ),
      oppositeContents: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          if (index == 0) ...[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Color(
                      0xFF70d8cd), // Replace with the desired border color
                  width: 2.0, // Replace with the desired border width
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Image.asset(
                  'assets/10.png',
                  height: 30,
                  width: 30,
                ),
              ),
            )
          ] else ...[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Color(
                      0xFF7863d9), // Replace with the desired border color
                  width: 2.0, // Replace with the desired border width
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Image.asset(
                  'assets/11.png',
                  height: 30,
                  width: 30,
                ),
              ),
            )
          ],
          Container(
            width: 10,
            child: DashedLineConnector(
              thickness: 1,
              color: Color(0xFFAEAEAE),
              direction: Axis.horizontal,
            ),
          )
        ]),
      ),
      contents: Row(children: [
        ClipPath(
          clipper: customsmallClipper(),
          child: Container(
            width: 10,
            height: 10,
            color: Color(0xFFD7D7D7),
          ),
        ),
        Container(
          width: 13,
          child: DashedLineConnector(
            thickness: 1,
            color: Color(0xFFAEAEAE),
            direction: Axis.horizontal,
          ),
        ),
        DotIndicator(
          size: 10,
          color: index == 0 ? Color(0xFF00E54E) : Color(0xFF003274),
        ),
        Container(
          width: 13,
          child: DashedLineConnector(
            thickness: 1,
            color: Color(0xFFAEAEAE),
            direction: Axis.horizontal,
          ),
        ),
        ClipPath(
          clipper: customClipper(),
          child: Container(
              color: Color(0xFFF5F8FC),
              height: MediaQuery.of(context).size.height * 0.063,
              width: MediaQuery.of(context).size.width * 0.5,
              child: FractionallySizedBox(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.7,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7, left: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0) ...[
                          Text(
                            'MANUFACTURED AT:',
                            style: TextStyle(
                                fontFamily: 'MontBold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                color: Color(0xFF00E54E)),
                          ),
                          Text(
                            widget.manuAddress == '' ||
                                    widget.manuAddress == null ||
                                    widget.manuAddress == ' '
                                ? 'Not Available'
                                : widget.manuAddress,
                            style: TextStyle(
                                fontFamily: 'MontBold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.016,
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ] else ...[
                          Text(
                            widget.tracking[index - 1]['establishmentName'] ==
                                        null ||
                                    widget.tracking[index - 1]
                                            ['establishmentName'] ==
                                        ''
                                ? 'Not Available'
                                : widget.tracking[index - 1]
                                    ['establishmentName'],
                            style: TextStyle(
                                fontFamily: 'MontBold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                color: Color(0xFF2193FA)),
                          ),
                          Text(
                            'Lat    :${widget.tracking[index - 1]['loc'][0]}',
                            style: TextStyle(
                                fontFamily: 'MontBold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.016,
                                color: Colors.black),
                          ),
                          Text(
                            'Long :${widget.tracking[index - 1]['loc'][1]}',
                            style: TextStyle(
                                fontFamily: 'MontBold',
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.016,
                                color: Colors.black),
                          ),
                        ]
                      ],
                    ),
                  ))),
        )
      ]),
    );
  }
}

class customClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.7, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class customsmallClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class customsCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(0, 0, size.width / 2, 0);
    path.quadraticBezierTo(size.width, 0, size.width, size.height);
// path.lineTo(0, size.height);
// path.lineTo(0, size.height);
// path.lineTo(size.width, size.height/2);
// path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class customsReverseCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo(0, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomsReverseCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo(0, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
