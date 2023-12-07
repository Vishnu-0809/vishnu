import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/constants.dart';
SnackBar Show_snack(BuildContext context,String text){
return SnackBar(
            content: Text(
              text,
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Color.fromRGBO(72, 72, 72, 0.9),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              bottom: MediaQuery.of(context).size.height * 0.05,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ));
            
            
      //  return  ScaffoldMessenger.of(context).showSnackBar(show);
}
void showOverlay(BuildContext context,String text) async {
   OverlayState? overlayState = Overlay.of(context);
   OverlayEntry overlayEntry;
   overlayEntry = OverlayEntry(builder: (context) {
     return Positioned(
        left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              bottom: MediaQuery.of(context).size.height * 0.05,
       child: ClipRRect(
         borderRadius: BorderRadius.circular(15),
         child: Material(
          
             child: Container(
               alignment: Alignment.center,
               color: Color.fromRGBO(72, 72, 72, 0.9),
               padding:
                   EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
               width: MediaQuery.of(context).size.width * 0.8,
               height: MediaQuery.of(context).size.height * 0.06,
               child: FittedBox(
                child: 
                Text(
                 text,
                 style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
               ),
             ),
               )
           
         ),
       ),
     );
   });
      // Inserting the OverlayEntry into the Overlay
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 3));

    overlayEntry.remove();
   
 }

Future<OverlayEntry> showOverlay_notification(BuildContext context,String length) 
async 
{
  
   OverlayEntry overlayEntry;
   overlayEntry = OverlayEntry(builder: (context) {
     return Positioned(
        left: 331,    
        height: 115,
             
       child: ClipRRect(
        
         borderRadius: BorderRadius.circular(15),
         child: Material(
          color: Colors.transparent,
             child:
             Container(
               alignment: Alignment.center,
               color: Colors.transparent,
              
               child: Text(
                 length,
                 style: TextStyle(color: Colors.amber,fontSize: 13,
                 fontWeight: FontWeight.bold),
               ),
             ),
           
         ),
       ),
     );
   });
   return overlayEntry;
 }

void insert_overlay(context,overlayEntry) async
{
SharedPreferences shref= await SharedPreferences.getInstance();
if (shref.getStringList("data")!=null && shref.getStringList("data")!.isNotEmpty && shref.getBool('Overlay_notification')==true&&shref.getBool('Overlay_notification')!=null)
{
  print("insert");
overlayEntry=await showOverlay_notification(context, shref.getStringList("data")!.length.toString());
 Overlay.of(context).insert(overlayEntry!);
 shref.setBool('Overlay_notification',false);
 
 }
}
