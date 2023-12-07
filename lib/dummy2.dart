import 'package:Veots/screens/constants.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:Veots/screens/purchase_history.dart';
import 'package:Veots/widgets/NetworkCheck.dart';
import 'package:Veots/widgets/not_icon.dart';
import 'package:Veots/widgets/send_accept.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:veots_mobile_app/screens/info_animations.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:timelines/timelines.dart';
class dummy2 extends StatefulWidget {
  const dummy2({super.key});

  @override
  State<dummy2> createState() => _dummy2State();
}

class _dummy2State extends State<dummy2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:
        
         SingleChildScrollView(
          
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
                          child: Image.asset(
                            'assets/veots_logo_wo_tl.png',
                            height: MediaQuery.of(context).size.width * 0.08,
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.45,
                        // ),
                        const Spacer(),
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
                                        // /chnaged
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
                          // _scaffoldKey.currentState?.openDrawer(); 
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
                        const SizedBox(width: 12,)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      margin: EdgeInsets.only(left:30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Track Product',
                
                    style: TextStyle(fontFamily: 'MontBold',fontSize:  MediaQuery.of(context).size.width*0.046,
                    // color: Color(0xFF00E54E)
                    ),
                  ),
                  Text('Know your product journey',
                
                    style: TextStyle(fontFamily: 'MontBold',fontSize: MediaQuery.of(context).size.width*0.031,
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
                  itemCount: 15
                  ,itemBuilder: (context,index){
                  return node();
                })
                  
               
         
                     ),
                        ],
                      ),
                    )
                   
             ],
           ),
         ),
        

      ),
    );
  }

  Widget node()
  {
    return      
     TimelineTile(
      mainAxisExtent: 80,
  
      nodePosition: 0.2,
oppositeContents: Padding(
padding: const EdgeInsets.only(right:0),
child: Container(
  // color: Colors.red,
  child:Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Text('image'),
    Container(
      width: 10,
      child: DashedLineConnector(
       
        thickness: 1,
         color: Color(0xFFAEAEAE),
        direction:Axis.horizontal,
      ),
    )
  ]), 
),
),
contents: 
Row(children: [
  ClipPath(
     clipper: customsmallClipper(),
    child: Container(
      width: 10,
      height: 10,
      color: Color(0xFFAEAEAE),
     
    ),
  ),
 Container(
        width: 13,
        child: DashedLineConnector(
        
          thickness: 1,
           color: Color(0xFFAEAEAE),
          direction:Axis.horizontal,
        ),
      ),
    DotIndicator(
      size: 10,
   color: Color(0xFF00E54E),
    ),
    Container(
      width: 13,
      child: DashedLineConnector(
    
        thickness: 1,
         color: Color(0xFFAEAEAE),
        direction:Axis.horizontal,
      ),
    ),
 ClipPath(
        clipper:customClipper() ,
        child:Container(
          color: Color(0xFFF5F8FC),
          height: MediaQuery.of(context).size.height*0.055,
          width: MediaQuery.of(context).size.width*0.45,
          child:
           FractionallySizedBox(
            alignment: Alignment.topLeft,

            widthFactor: 0.7,
            child:Padding(
              padding: const EdgeInsets.only(top: 7,left: 7),
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('MANUFACTURED AT:',
                
                    style: TextStyle(fontFamily: 'MontBold',fontSize: MediaQuery.of(context).size.width*0.022,
                    color: Color(0xFF00E54E)),
                  ),
                 Text('Lat',
                 style: TextStyle(fontFamily: 'MontBold',fontSize: MediaQuery.of(context).size.width*0.016,
                    ),),
                 Text('Long',
                 style: TextStyle(fontFamily: 'MontBold',fontSize: MediaQuery.of(context).size.width*0.016,
                    ),),
                  
                ],
              ),
            )
           )

   
        ) ,)
]),

node: TimelineNode(
// indicator: DotIndicator(),
startConnector: SolidLineConnector(
  color: Color(0xFFAEAEAE),
  thickness: 10,

),
endConnector: SolidLineConnector(
   color: Color(0xFFAEAEAE),
  thickness: 10,
),
),
);
  }




  Future delete() async
  {
     print(ID);
    print(MOB_not_EM);
    // final token = await createAlbum_decativate(ID.toString(), MOB_not_EM!);
    // print(token.statusCode);
    // if(token.statusCode==200)
    // Show_snack(context, 'success');
    // else if(token.statusCode==400)
    // Show_snack(context, 'wrong');
    // else if(token.statusCode==404)
    // Show_snack(context, ' Not Found');
    // else if(token.statusCode==500)
    // Show_snack(context, 'Internal Error');
             
  }
}




class customClipper extends CustomClipper<Path>{
@override
Path getClip(Size size)
{
Path path=Path();
path.lineTo(0, size.height);
path.lineTo(size.width*0.7, size.height);
path.lineTo(size.width, size.height/2);
path.lineTo(size.width*0.7, 0);
return path;
}
@override
bool shouldReclip(CustomClipper<Path> oldClipper)=>false;
}

class customsmallClipper extends CustomClipper<Path>{
@override
Path getClip(Size size)
{
Path path=Path();
path.lineTo(0, size.height);
path.lineTo(size.width, size.height/2);
path.lineTo(0, 0);
return path;
}
@override
bool shouldReclip(CustomClipper<Path> oldClipper)=>false;
}




