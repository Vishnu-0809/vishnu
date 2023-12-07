import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:Veots/models/class_models.dart';
import 'package:Veots/screens/info_animations.dart';

class Image_view extends StatefulWidget {
  Image_view({super.key, required this.bill});
 final String bill;
  @override
  State<Image_view> createState() => Image_viewState();
}

class Image_viewState extends State<Image_view> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: 
      ShowUpAnimation(
        delayStart: Duration(milliseconds: -500),
        animationDuration: Duration(seconds: 1,milliseconds: 500),
        curve: Curves.bounceIn,
        direction: Direction.vertical,
        offset: 0.5,
        child: 
        SingleChildScrollView(child:Column(
          children: [
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), //<-- SEE HERE
                ),
                margin:
                    EdgeInsets.only(bottom: 40, top: 40, right: 20, left: 20),
                color: Color(0xff002060),
                child: 
                Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                height: 200,

                  child: Image.network(
                        widget.bill
                                    
                                    ),
            ),
                              Spacer(),
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
            )
          ],
        ),
      ),
    )));
  }
}
 