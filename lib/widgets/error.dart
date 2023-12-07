import 'package:flutter/material.dart';

Future <bool>? Dailog(BuildContext context ,String title,String info)async{
  return await showDialog(context: context, 
  builder:(context)=>AlertDialog(
    title: Text(title),
      
    content: Text(info),
    actions: [
      TextButton(onPressed: (){
          
          Navigator.of(context).pop();
         
      }
      , child: Text('ok')),
      // TextButton(onPressed: (){
      //     Navigator.of(context).pop();
      // }
      // , child: Text('No'))
    ],
  )) ;
}