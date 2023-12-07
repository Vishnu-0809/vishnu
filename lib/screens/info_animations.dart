import 'package:Veots/screens/track_history.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:Veots/models/class_models.dart';
import 'package:Veots/screens/info_animations.dart';
import 'package:url_launcher/url_launcher.dart';
class Product_info_Ani extends StatefulWidget {
  Product_info_Ani({super.key, required this.snapshot});
  Details snapshot = new Details();
  @override
  State<Product_info_Ani> createState() => _Product_info_AniState();
}

class _Product_info_AniState extends State<Product_info_Ani> {
  
List tracking=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();  
 
  }
  @override
  Widget build(BuildContext context) {

  String temp="";
  String temp2="";
  String mfgdate="";
  String expdate="";


  if(widget.snapshot.details["mfgdate"] != null)    {
                

                print("going to mfgdate");
                
                temp =
                                widget.snapshot.details["mfgdate"].substring(0, 10);
                           mfgdate = temp.substring(8, 10) +
                                "-" +
                                temp.substring(5, 7) +
                                "-" +
                                temp.substring(0, 4);
  }

if(widget.snapshot.details["expiry"] != null){



                         print("going to enddate");
                                temp2 =
                                widget.snapshot.details["expiry"].substring(0, 10);
                            expdate = temp2.substring(8, 10) +
                                "-" +
                                temp2.substring(5, 7) +
                                "-" +
                                temp2.substring(0, 4);
}
    return SafeArea(
        child: Scaffold(
      body: 
      ShowUpAnimation(
        delayStart: Duration(milliseconds: 500),
        animationDuration: Duration(seconds: 1,milliseconds: 500),
        curve: Curves.bounceIn,
        direction: Direction.vertical,
        offset: 0.5,
        child: 
        SingleChildScrollView(child:
        PinchZoom(child: 
        Column(
          children: [
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), //<-- SEE HERE
                ),
                margin:
                    EdgeInsets.only(bottom: 40, top: 40, right: 20, left: 20),
                color: Color(0xff002060),
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
                                if(widget.snapshot.details["brand"] != null)
                                
                              Text(
                                  "Brand Name: ${widget.snapshot.details["brand"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                            
                            if(widget.snapshot.details["prodName"] != null)    
                              Text(
                                  "Product Name: ${widget.snapshot.details["prodName"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),       
                               
                              
                                
                                
                                ],
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
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(widget.snapshot.details["price"] != null)    
                              Text(
                                  "MRP: ${widget.snapshot.details["price"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                                  if(temp!="")    
                              Text(
                                  "MFG Date: "+mfgdate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ), 
                                 if(widget.snapshot.details["shelflife"] != null)    
                              Text(
                                  "Shelf life: ${widget.snapshot.details["shelflife"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ), 
                              if(temp2!="")    
                              Text(
                                  "Expiry Date: "+expdate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ), 
                                if(widget.snapshot.details["batchNo"] != null)    
                              Text(
                                  "Batch No: ${widget.snapshot.details["batchNo"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                              if(widget.snapshot.details["serialNo"] != null)    
                              Text(
                                  "Serial No: ${widget.snapshot.details["serialNo"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                                if(widget.snapshot.details["warranty"] != null )    
                              Text(
                                  "Warranty: ${widget.snapshot.details["warranty"]}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                        if(widget.snapshot.details["manuLicenseNo"] != null)
                                  
                              Container(
                                child: Text(
                                    "Manufacturer License no: ${widget.snapshot.details["manuLicenseNo"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins Medium",
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.023,
                                        ),
                                  ),
                              ),
                       
                        if(widget.snapshot.details["manuAddress"] !="" && widget.snapshot.details["manuAddress"]!=null )...[
                            
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
                                  "${widget.snapshot.details["manuAddress"]}",
                                  
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                              ),
                              // Text('hello ${widget.snapshot.details["additionalImages"][0][0]["url"]}'),
                             

                      ],
                       if(widget.snapshot.details["additionalDetails"] != ""  && widget.snapshot.details["additionalDetails"]!=null  ) ...[
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
                                  "${widget.snapshot.details["additionalDetails"]}",
                                   
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.023,
                                      ),
                                ),
                                // Text(widget.snapshot.details["addtionalImages"]),
                                ],
                        
                        if(widget.snapshot.details["additionalImages"]!=null ) ...[
                        if(widget.snapshot.details["additionalImages"][0].length!=0) ...[
                          if(widget.snapshot.details["additionalImages"][0][0]["url"]!="")...[
                                SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                  
                            Text("Product Images",
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
                              child:  widget.snapshot.details["additionalImages"][0][0]["url"]!=""?
                              Image.network(  widget.snapshot.details["additionalImages"][0][0]["url"]
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
                              child: widget.snapshot.details["additionalImages"][0].length ==1 ? 
                              null : widget.snapshot.details["additionalImages"][0][1]["url"]!="" ? 
                              Image.network( widget.snapshot.details["additionalImages"][0][1]["url"] ,
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
                                    MaterialPageRoute(builder: (context) =>  Tracking_history(tracking: widget.snapshot.details['tracking'], manuAddress:widget.snapshot.details['manuAddress'])),
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
          ],
        ),)
      ),
    )));
  }
}