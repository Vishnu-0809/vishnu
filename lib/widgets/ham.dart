import 'dart:io';

import 'package:Veots/screens/FAQ.dart';
import 'package:Veots/screens/TnC.dart';
import 'package:Veots/screens/privacypolicy.dart';
import 'package:Veots/screens/profile_new.dart';
import 'package:Veots/screens/purchase_history.dart';
import 'package:Veots/widgets/send_accept.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Veots/screens/home_page.dart';
import 'package:url_launcher/url_launcher.dart';


import '../main.dart';
import '../screens/constants.dart';
import '../screens/login.dart';
import 'NetworkCheck.dart';
 
 final edit_password =TextEditingController();
 

class HamWidget extends StatelessWidget {
  HamWidget({super.key});
  final playStore_url = Uri.parse("https://play.google.com/store/apps/details?id=com.Veots");
  final appStore_url = Uri.parse("https://apps.apple.com/in/app/veots/id6448496034");

  @override
  Widget build(BuildContext context) {
    return Drawer(
          
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
        // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.all(0),   
          children: [
           SizedBox(
            height: 80,
            child:  DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  
                colors: [
                  // Color(0xff002060),
                 Color(0xff003296), Color(0xffaa2aae)])
              ),
              child: Container(
                child: 
              Row(
                children: [
                const SizedBox(width: 10,),
                Container(
                          height: MediaQuery.of(context).size.width * 0.08,
                          width: MediaQuery.of(context).size.width * 0.08,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: FittedBox(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
                                   (context)=>HomeScreen(first_time: 0,mainLink: '',location_on: true,)), (route) => false);
                                    },
                                    icon: const Icon(
                                      Icons.person,
                                      
                                      // size: MediaQuery.of(context).size.width * 0.06,
                                      color:Color(0xff002060)
                                    ),
                                    )),
                          )
                          ),
                          const SizedBox(width: 15,),
                           Container(
                            width: MediaQuery.of(context).size.width/2,
                             child: SizedBox(
                               child: Text(NAME.toString(),style: TextStyle(
                                                   color: Colors.white,
                                                   fontFamily: "Poppins Medium",
                                                   fontSize: MediaQuery.of(context).size.width * 0.045,
                                                 ),),
                             ),
                           ),
              ],)
              ),
            ),
          ),
           ListTile(
            // visualDensity: const VisualDensity(vertical: 0),
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen(first_time: 0,mainLink: '',location_on: true,),
                        ));
                  }, icon: Icon(Icons.home)),
              ),
                      const Text("Home", style: TextStyle(fontFamily: "Poppins Medium"),),
              
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen(first_time: 0,mainLink: '',location_on: true,),
                        ));
            },
          ),
         ListTile(
    // visualDensity: VisualDensity.compact,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.shopping_cart)),
              ),
              const Text("My Purchases", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PurchaseHistory(),
                        ));
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.currency_rupee_rounded)),
              ),
              const Text("Rewards", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.edit)),
              ),
              const Text("Edit Account", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
              print("clicked edit");
              print(DOB);
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Profile_new(),
                        ));
            },
          ),
          ListTile(
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.logout)),
              ),
              const Text("Logout", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () async{
              // Update the state of the app.
              // ...
              SharedPreferences pref =
                                              await SharedPreferences.getInstance();
                                              pref.clear();
                                          // pref.remove('token');
                                          // pref.remove('udid');
                                          // pref.remove('name');
                                          // pref.remove('gender');
                                          // pref.remove('id');
                                          // pref.remove("data");
                                          // pref.remove('expiredData');
                                          // pref.remove('weekexpired');
                                          // pref.remove("datawarranty");
                                          // pref.remove('expiredDatawarranty');
                                          // pref.remove('weekexpiredwarranty');
                                          // pref.remove('notification');
                                               pref.remove('token');
                                          pref.remove('udid');
                                          pref.remove('name');
                                          pref.remove('gender');
                                          pref.remove('id');
                                          pref.remove("data");
                                          pref.remove('expiredData');
                                          pref.remove('weekexpired');
                                          pref.remove("datawarranty");
                                          pref.remove('expiredDatawarranty');
                                          pref.remove('weekexpiredwarranty');
                                          pref.remove('notification');
                                          UDID=null;
                                          ID=null;
                                          NAME=null;
                                          MOB_not_EM=null;
                                          GENDER=null;
                                      
                                          
                                        print(ID);
                                        print(UDID);
                                        print(NAME);
                                        print(MOB_not_EM);
                                    
                                        print(GENDER);
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => const Login(
                                              mainLink: "",location_on: true,
                                            ),
                                          ));
              
            },
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.person_remove)),
              ),
              const Text("Delete Account", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: ()  async
            {
              // Update the state of the app.
              // ...
            showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
                // backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ) ,
      title: Text('Enter current password',
      style: TextStyle(fontWeight: FontWeight.bold),),
      content: TextFormField(
        controller:edit_password ,
        decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xfffafafa),
                        errorStyle: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.03),
                        contentPadding: EdgeInsets.only(
                          left: 20
                        ),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20) ),)
      ),
      actions: [
        TextButton(
          onPressed: () async{   
            await showDialog(
                               
                             
                              context: context,
                              builder: (context) {
                              return WillPopScope(
                             onWillPop: () async => false,
                             child:AlertDialog(   
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
                                                  "Warning",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 20),
                                                ),
                                              ] else
                                                Text(
                                                  "Warning",
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
                                              Navigator.of(context).pop();
                                           
      
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
                                    height: MediaQuery.of(context).size.height*0.23,
                                    child: Column(
                                      
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                     Text(
                                    'Are you sure you want to delete your account permanently?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                       Container(
                  height: MediaQuery.of(context).size.height / 24,
                    width: MediaQuery.of(context).size.width /4.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                                           Color(0xff00b7ff), Color(0xffaa2aae)
                                          ])),
                    child: ElevatedButton(
                      onPressed: () async {
                        print(ID.toString());
                        print( MOB_not_EM);
                        final token = await createAlbum_decativate(ID.toString(), MOB_not_EM!,edit_password.text);
                        print(token.statusCode);
                        if(token.statusCode==200)
                        {    
                              SharedPreferences pref =await SharedPreferences.getInstance();
                              pref.clear();
                              // pref.remove('token');
                              // pref.remove('udid');
                              // pref.remove('name');
                              // pref.remove('id');
                             
                              // pref.remove('gender');
                              // pref.remove("data");
                              // pref.remove('expiredData');
                              // pref.remove('weekexpired');
                              // pref.remove("datawarranty");
                              // pref.remove('expiredDatawarranty');
                              // pref.remove('weekexpiredwarranty');
                              // pref.remove('notification');'

                              pref.remove('token');
                                          pref.remove('udid');
                                          pref.remove('name');
                                          pref.remove('gender');
                                          pref.remove('id');
                                          pref.remove("data");
                                          pref.remove('expiredData');
                                          pref.remove('weekexpired');
                                          pref.remove("datawarranty");
                                          pref.remove('expiredDatawarranty');
                                          pref.remove('weekexpiredwarranty');
                                          pref.remove('notification');
                              UDID=null;
                              ID=null;
                              NAME=null;
                              MOB_not_EM=null;
                              GENDER=null;
                             
                              showOverlay(context,"successful");
                             edit_password.text="";
                             await  Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => const Login(
                                              mainLink: "",location_on: true,
                                            ),
                                          ));
                              Navigator.of(context).pop();
                              }
                              else if(token.statusCode==400)
                           {
                          showOverlay(context,'Wrong');
                          edit_password.text="";
                          Navigator.of(context).pop();
                           }
                              else if(token.statusCode==401)
                             {
                              edit_password.text="";
                               
                          showOverlay(context,"password doesn't match");
                           
                           Navigator.of(context).pop();
                          // snackbarKey.currentState?.showSnackBar(show_net);
                             }
                              else if(token.statusCode==500)
                              {
                                edit_password.text="";
                                showOverlay(context,"internal error");
                               
                               Navigator.of(context).pop();
                                // snackbarKey.currentState?.showSnackBar(show_net);
                              }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Text(
                        'Yes',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Medium",
                        fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                   Container(
                  height: MediaQuery.of(context).size.height / 24,
                    width: MediaQuery.of(context).size.width /4.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                                            Color(0xff00b7ff), Color(0xffaa2aae)
                                          ])),
                    child: ElevatedButton(
                      onPressed: () async {
                         Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Text(
                        'No',
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Medium",
                        fontSize: 8,
                        ),
                      ),
                    ),
                  )
      
                                    ],
                                  )
                                  ],),
                                  )
                                )
                                );
                              });
            Navigator.pop(context);
          },
          child: Text('ok',
          style: TextStyle(
          fontSize: 20),
          ),
        ),
      ],
    );
      },
     ); 
  
              
            

           
            },
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title: Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: Divider(
                      // height: MediaQuery.of(context).size.height*0.03,
                      thickness: MediaQuery.of(context).size.width*0.004,
                      color:const Color(0xffc4c4c4),
                      ),
                  ),
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.question_mark_rounded)),
              ),
              const Text("FAQs", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: (
              
              

            ) {
              // Update the state of the app.
              // ...
               Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => const FAQ(
                                              
                                            ),
                                          ));
            },
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.people)),
              ),
              const Text("Support", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon(Icons.error,)),
              ),
              const Text("Terms and Conditions", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
                 Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => const TnC(
                                              
                                            ),
                                          ));
            },
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){}, icon: Icon( Icons.lock)),
              ),
              const Text("Privacy Policy", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => const PrivacyPolicy(
                                              
                                            ),
                                          ));
            },
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){
                    if(Platform.isAndroid)
                    {
                      launchUrl(
    playStore_url,
    mode: LaunchMode.externalApplication,
  );
                    }
                    else if(Platform.isIOS)
                    {
                      launchUrl(
    appStore_url,
    mode: LaunchMode.externalApplication,
  );
                    }
                  }, icon: Icon( Icons.star)),
              ),
              const Text("Rate this App", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
              if(Platform.isAndroid)
                    {
                      launchUrl(
    playStore_url,
    mode: LaunchMode.externalApplication,
  );
                    }
                    else if(Platform.isIOS)
                    {
                      launchUrl(
    appStore_url,
    mode: LaunchMode.externalApplication,
  );
                    }
            },
          ),
          ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
      
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width*0.07,
                child: IconButton(
                  color: const Color(0xff002060),
                  onPressed: (){
                    
                  }, icon: Icon(Icons.share)),
              ),
              const Text("Share this App", style: TextStyle(fontFamily: "Poppins Medium"),)
            ],),
            onTap: () {
              // Update the state of the app.
              // ...
              Share.share('The VEOTS mobile app https://play.google.com/store/apps/details?id=com.Veots', subject: 'VEOTS mobile app');
            },
          ),
        ],
        ),
      );
  }
}