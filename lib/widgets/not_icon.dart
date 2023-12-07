import 'dart:math';

import 'package:Veots/widgets/send_accept.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';
import '../screens/Notifications_view.dart';
import '../screens/constants.dart';


Album_notification? not_post;
Album_Warranty? not_warr;
void trycalback() async{
     int expiryLength=0;
    int warrantyLength=0;
     DateTime  date=DateTime.now();
  List<String> Data=[];
   List<String> total=[];
   List<String>oneWeekexp=[];
   SharedPreferences shref= await SharedPreferences.getInstance();
   shref.setString('notification',"show");
    if(await shref.getStringList("weekexpired")!=null )
  {
    List<String> oneweek= await shref.getStringList("weekexpired")!;
    for (int i=0;i<oneweek.length;i++)
  {
    List list =oneweek[i].split(' ');
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    print(date.difference(DateTime.parse(list[1])).inDays); // expired or not 
    if(date.difference(DateTime.parse(list[1])).inDays<=7)
    {
      oneWeekexp.add(oneweek[i]);
     }
  } 
  print(oneWeekexp);
  }
  if(await shref.getStringList("expiredData")!=null )
  {
    List data= await shref.getStringList("expiredData")!;
    for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');  
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    print(date.difference(DateTime.parse(list[1])).inDays); // expired or not 
    if(date.difference(DateTime.parse(list[1])).inDays<=7)
    {
      oneWeekexp.add(data[i]);
     }
  }
 
  shref.setStringList('weekexpired',oneWeekexp);
  print('-----------------------------------------');
   print("one week expired");
  print(shref.getStringList("weekexpired"));
  print('-----------------------------------------');
    
  }
  
  if (shref.getStringList("data")!=null )
{
  print(shref.getStringList("data"));
  List data= shref.getStringList("data")!;
  for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');
    print(list);
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    list.insert(5,date.compareTo(DateTime.parse(list[1])).toString()); // expired or not
    DateTime yes_date=date.subtract(Duration(days:1));
    bool expiring=false;
     if ( DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]))) <0)
     {
      expiring=true;
     }
        if (int.parse(list[5])>=0 && expiring==false)
        {
          Data.add(data[i]);
        }
      }
  shref.setStringList("expiredData",Data);
  print('-----------------------------------------');
  print("exired data");
  print(shref.getStringList("expiredData"));
  print('-----------------------------------------');
  }

  bool MOB_not_EM;
  ID = shref.getString("id");
  UDID = shref.getString("udid");
  RegExp reg = RegExp(r'^[0-9]{10}$');
      if (
          (ID!.length == 10 && reg.hasMatch(ID.toString()) ))
           {
        MOB_not_EM=true;
      }
      else
      {
        MOB_not_EM=false;
      }

      String contactType= MOB_not_EM ? 'mobile':"email";
      not_post= await  createAlbum_notification(contactType, ID.toString(), DateTime.now().toString());
      List<String> list= not_post!.convert(not_post!.data);
      print("neww data");
      print(list);
  expiryLength=0;
  if (shref.getStringList("data")!=null && shref.getStringList("data")!=[])
  {
   
  List<String> olddata= shref.getStringList("data")!;
  for (int i=0; i<list.length;i++ )
  {
    List open_list=list[i].split(' ');
    for (int j=0; j<olddata.length;j++ )
    {
      List open_olddata= olddata[j].split(' ');
      DateTime yes_date=date.subtract(Duration(days:1));
     bool expiring=false;
     if ( DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(open_list[1]))) <0)
     {
      expiring=DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(open_list[1])))<0? false:true;
     }
        if (open_olddata[4]==open_list[4] && expiring==false )
        {

            expiryLength++;
            break;
        }
    } 
  }
  expiryLength=list.length-expiryLength;
  }
  else
  {
    expiryLength=list.length;
  }
  await shref.setInt("expiryLength", expiryLength);
      shref.remove("data");
      print(shref.setStringList("data", list));
      print('-----------------------------------------');
      print(shref.getString('notification'));
      print('-----------------------------------------');
  List<String> Data_warranty=[];
   List<String> total_warranty=[];
   List<String>oneWeekexp_warranty=[];


    if(await shref.getStringList("weekexpiredwarranty")!=null )
  {
    List<String> oneweek= await shref.getStringList("weekexpiredwarranty")!;
    for (int i=0;i<oneweek.length;i++)
  {
    List list =oneweek[i].split(' ');
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); 
    // list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    print(date.difference(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) ))).inDays<=7); // expired or not 
    // if(date.difference(DateTime.parse(list[1])).inDays<=7)
    // {
    //   oneWeekexp_warranty.add(oneweek[i]);
    //  }
   list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) )))).toString());
    if(date.difference(DateTime.parse(list[1]).add(Duration(days:int.parse(list[6]) ))).inDays<=7)
    {
     oneWeekexp_warranty.add(oneweek[i]);
     }
  } 
  print(oneWeekexp_warranty);
  }
  if(await shref.getStringList("expiredDatawarranty")!=null )
  {
    List data= await shref.getStringList("expiredDatawarranty")!;
    for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');  
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    // list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    // print(date.difference(DateTime.parse(list[1])).inDays); // expired or not 
    // if(date.difference(DateTime.parse(list[1])).inDays<=7)
    // {
    //   oneWeekexp_warranty.add(data[i]);
    //  }
    list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) )))).toString());
    if(date.difference(DateTime.parse(list[1]).add(Duration(days:int.parse(list[6]) ))).inDays<=7)
    {
      oneWeekexp_warranty.add(data[i]);
     }
  }
   print("expiredwarranty");
  shref.setStringList('weekexpiredwarranty',oneWeekexp_warranty);
  print('-----------------------------------------');
  print(shref.getStringList("weekexpiredwarranty"));
  print('-----------------------------------------');
    
  }
  if (shref.getStringList("datawarranty")!=null )
{
  print(shref.getStringList("datawarranty"));
  List data= shref.getStringList("datawarranty")!;
  for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');
    print(list);
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    // list.insert(5,date.compareTo(DateTime.parse(list[1])).toString()); // expired or not 
    //     if (int.parse(list[5])>=0)
    //     {
    //       Data_warranty.add(data[i]);
    //     }
    list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) )))).toString());
    DateTime yes_date=date.subtract(Duration(days:1));
    bool expiring=false;
     if (DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[6]) )))) <0)
     {
      expiring=true;
     }
    if(int.parse(list[5])>=0 && expiring==false)
    {
     Data_warranty.add(data[i]);
     }
      }
   print(Data_warranty);
  shref.setStringList("expiredDatawarranty",Data_warranty);
  print('-----------------------------------------');
  print(shref.getStringList("expiredDatawarranty"));
  print('-----------------------------------------');
  }
    not_warr= await  createAlbum_Warranty(contactType, ID.toString(), DateTime.now().toString());
    List<String> list2= not_warr!.convert(not_warr!.data);
    print("neww data warranty");
    print(list2);
  if (shref.getStringList("datawarranty")!=null && shref.getStringList("datawarranty")!=[])
  {
    warrantyLength=0;
  List<String> olddata= shref.getStringList("datawarranty")!;
  for (int i=0; i<list2.length;i++ )
  {
    List open_list2= list2[i].split(' ');
    for (int j=0; j<olddata.length;j++ )
    {
    List open_olddata=olddata[j].split(' ');
    DateTime yes_date=date.subtract(Duration(days:1));
    bool expiring=false;
     if (DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[4]) )))) <0)
     {
      expiring= DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[4]) ))))<0?false:true;
     }
        if (open_olddata[5]==open_list2[5] && expiring==false )
        {
            warrantyLength++;
            break;
        }
    }
  }
  warrantyLength=list2.length-warrantyLength;
  }
  else
  {
    warrantyLength=list2.length;
  }
   await shref.setInt("warrantyLength", warrantyLength);
      shref.remove("datawarranty");
      print(shref.setStringList("datawarranty", list2));
      print('-----------------------------------------');
      print(shref.getString('notification'));
      print('-----------------------------------------');
      FlutterAppBadger.removeBadge();
      print('------------------------');
      print(warrantyLength);
      print(expiryLength);
      print('------------------------');
}
void callbackDispatcher()
async {   
  Workmanager().executeTask((taskName, inputData)  async{
    int expiryLength=0;
    int warrantyLength=0;
     DateTime  date=DateTime.now();
  List<String> Data=[];
   List<String> total=[];
   List<String>oneWeekexp=[];
   SharedPreferences shref= await SharedPreferences.getInstance();
   shref.setString('notification',"show");
    if(await shref.getStringList("weekexpired")!=null )
  {
    List<String> oneweek= await shref.getStringList("weekexpired")!;
    for (int i=0;i<oneweek.length;i++)
  {
    List list =oneweek[i].split(' ');
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    print(date.difference(DateTime.parse(list[1])).inDays); // expired or not 
    if(date.difference(DateTime.parse(list[1])).inDays<=7)
    {
      oneWeekexp.add(oneweek[i]);
     }
  } 
  print(oneWeekexp);
  }
  if(await shref.getStringList("expiredData")!=null )
  {
    List data= await shref.getStringList("expiredData")!;
    for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');  
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    print(date.difference(DateTime.parse(list[1])).inDays); // expired or not 
    if(date.difference(DateTime.parse(list[1])).inDays<=7)
    {
      oneWeekexp.add(data[i]);
     }
  }
 
  shref.setStringList('weekexpired',oneWeekexp);
  print('-----------------------------------------');
   print("one week expired");
  print(shref.getStringList("weekexpired"));
  print('-----------------------------------------');
    
  }
  
  if (shref.getStringList("data")!=null )
{
  print(shref.getStringList("data"));
  List data= shref.getStringList("data")!;
  for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');
    print(list);
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    list.insert(5,date.compareTo(DateTime.parse(list[1])).toString()); // expired or not
    DateTime yes_date=date.subtract(Duration(days:1));
    bool expiring=false;
     if ( DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]))) <0)
     {
      expiring=true;
     }
        if (int.parse(list[5])>=0 && expiring==false)
        {
          Data.add(data[i]);
        }
      }
  shref.setStringList("expiredData",Data);
  print('-----------------------------------------');
  print("exired data");
  print(shref.getStringList("expiredData"));
  print('-----------------------------------------');
  }

  bool MOB_not_EM;
  ID = shref.getString("id");
  UDID = shref.getString("udid");
  RegExp reg = RegExp(r'^[0-9]{10}$');
      if (
          (ID!.length == 10 && reg.hasMatch(ID.toString()) ))
           {
        MOB_not_EM=true;
      }
      else
      {
        MOB_not_EM=false;
      }

      String contactType= MOB_not_EM ? 'mobile':"email";
      not_post= await  createAlbum_notification(contactType, ID.toString(), DateTime.now().toString());
      List<String> list= not_post!.convert(not_post!.data);
      print("neww data");
      print(list);
  expiryLength=0;
  if (shref.getStringList("data")!=null && shref.getStringList("data")!=[])
  {
   
  List<String> olddata= shref.getStringList("data")!;
  for (int i=0; i<list.length;i++ )
  {
    List open_list=list[i].split(' ');
    for (int j=0; j<olddata.length;j++ )
    {
      List open_olddata= olddata[j].split(' ');
      DateTime yes_date=date.subtract(Duration(days:1));
     bool expiring=false;

     if ( DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(open_olddata[1]))) <0)
     {
      expiring=DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(open_olddata[1])))<0? false:true;
     }
        if (open_olddata[4]==open_list[4] && expiring==false )
        {
            expiryLength++;
            break;
        }
    } 
  }
  expiryLength=list.length-expiryLength;
  }
  else
  {
    expiryLength=list.length;
  }
  await shref.setInt("expiryLength", expiryLength);
      shref.remove("data");
      print(shref.setStringList("data", list));
      print('-----------------------------------------');
      print(shref.getString('notification'));
      print('-----------------------------------------');
  List<String> Data_warranty=[];
   List<String> total_warranty=[];
   List<String>oneWeekexp_warranty=[];


    if(await shref.getStringList("weekexpiredwarranty")!=null )
  {
    List<String> oneweek= await shref.getStringList("weekexpiredwarranty")!;
    for (int i=0;i<oneweek.length;i++)
  {
    List list =oneweek[i].split(' ');
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); 
    // list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    print(date.difference(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) ))).inDays<=7); // expired or not 
    // if(date.difference(DateTime.parse(list[1])).inDays<=7)
    // {
    //   oneWeekexp_warranty.add(oneweek[i]);
    //  }
   list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) )))).toString());
    if(date.difference(DateTime.parse(list[1]).add(Duration(days:int.parse(list[6]) ))).inDays<=7)
    {
     oneWeekexp_warranty.add(oneweek[i]);
     }
  } 
  print(oneWeekexp_warranty);
  }
  if(await shref.getStringList("expiredDatawarranty")!=null )
  {
    List data= await shref.getStringList("expiredDatawarranty")!;
    for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');  
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    // list.insert(5,date.compareTo(DateTime.parse(list[1])).toString());
    // print(date.difference(DateTime.parse(list[1])).inDays); // expired or not 
    // if(date.difference(DateTime.parse(list[1])).inDays<=7)
    // {
    //   oneWeekexp_warranty.add(data[i]);
    //  }
    list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) )))).toString());
    if(date.difference(DateTime.parse(list[1]).add(Duration(days:int.parse(list[6]) ))).inDays<=7)
    {
      oneWeekexp_warranty.add(data[i]);
     }
  }
   print("expiredwarranty");
  shref.setStringList('weekexpiredwarranty',oneWeekexp_warranty);
  print('-----------------------------------------');
  print(shref.getStringList("weekexpiredwarranty"));
  print('-----------------------------------------');
    
  }
  if (shref.getStringList("datawarranty")!=null )
{
  print(shref.getStringList("datawarranty"));
  List data= shref.getStringList("datawarranty")!;
  for (int i=0;i<data.length;i++)
  {
    List list =data[i].split(' ');
    print(list);
    list.insert(4,DateFormat.yMd().format(DateTime.parse(list[1]))); //expiry data
    // list.insert(5,date.compareTo(DateTime.parse(list[1])).toString()); // expired or not 
    //     if (int.parse(list[5])>=0)
    //     {
    //       Data_warranty.add(data[i]);
    //     }
    list.insert(5,DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[5]) )))).toString());
    DateTime yes_date=date.subtract(Duration(days:1));
    bool expiring=false;
     if (DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[6]) )))) <0)
     {
      expiring=true;
     }
    if(int.parse(list[5])>=0 && expiring==false)
    {
     Data_warranty.add(data[i]);
     }
      }
   print(Data_warranty);
  shref.setStringList("expiredDatawarranty",Data_warranty);
  print('-----------------------------------------');
  print(shref.getStringList("expiredDatawarranty"));
  print('-----------------------------------------');
  }
    not_warr= await  createAlbum_Warranty(contactType, ID.toString(), DateTime.now().toString());
    List<String> list2= not_warr!.convert(not_warr!.data);
    print("neww data warranty");
    print(list2);
  if (shref.getStringList("datawarranty")!=null && shref.getStringList("datawarranty")!=[])
  {
    warrantyLength=0;
  List<String> olddata= shref.getStringList("datawarranty")!;
  for (int i=0; i<list2.length;i++ )
  {
    List open_list2= list2[i].split(' ');
    for (int j=0; j<olddata.length;j++ )
    {
    List open_olddata=olddata[j].split(' ');
    DateTime yes_date=date.subtract(Duration(days:1));
    bool expiring=false;
     if (DateFormat.yMd().format(yes_date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[4]) )))) <0)
     {
      expiring= DateFormat.yMd().format(date).compareTo(DateFormat.yMd().format(DateTime.parse(list[1]).add(Duration(days:int.parse(list[4]) ))))<0?false:true;
     }
        if (open_olddata[5]==open_list2[5] && expiring==false )
        {
            warrantyLength++;
            break;
        }
    }
  }
  warrantyLength=list2.length-warrantyLength;
  }
  else
  {
    warrantyLength=list2.length;
  }
   await shref.setInt("warrantyLength", warrantyLength);
      shref.remove("datawarranty");
      print(shref.setStringList("datawarranty", list2));
      print('-----------------------------------------');
      print(shref.getString('notification'));
      print('-----------------------------------------');
      FlutterAppBadger.removeBadge();
      print('------------------------');
      print(warrantyLength);
      print(expiryLength);
      print('------------------------');
 await FlutterAppBadger.updateBadgeCount(warrantyLength+expiryLength);
        return Future.value(true);
    });
}
class Not_icon extends StatefulWidget {
  const Not_icon({super.key});

  @override
  State<Not_icon> createState() => _Not_iconState();
}

class _Not_iconState extends State<Not_icon> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
     
   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
                            height: MediaQuery.of(context).size.width * 0.07,
                            width: MediaQuery.of(context).size.width * 0.07,
                            decoration: const BoxDecoration(
                              color: Color(0xff002060),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Center(
                              child: FittedBox(
                                
                                  
                                        child: Stack(
                                          children:[IconButton(
                                            onPressed: () async{

                                          SharedPreferences shref= await SharedPreferences.getInstance();
                                          if (shref.getString('notification')=='show')
                                          { 
                                          setState(() {
                                            shref.remove('notification');
                                            shref.remove("expiryLength");
                                            shref.remove("warrantyLength");
                                          });

                                              }
                                              
                                         FlutterAppBadger.removeBadge();
                                          
                                           Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => NotificationView()
                                                                        
                                            ));
        
                                            },
                                              icon: Icon(
                                                // size: MediaQuery.of(context).size.width * 0.05,
                                                
                                            Icons.notifications,

                                            // size: MediaQuery.of(context).size.width * 0.06,
                                            color: Colors.white,
                                          ),
                                                                              ),
                                         Positioned(
                                         left: 20,
                                         top:7,
                                           child:FutureBuilder<String>(
                                                future: notifications_show(),
                                                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                                  if (snapshot.data!='0' && snapshot.data!=null) {
                                                    return 
                                                      CircleAvatar(
                                                        radius: 9,
                                                        backgroundColor: Colors.orange,
                                                        child:
                                                         badges.Badge(                                        
                                                        badgeContent: 
                                                        
                                                          FittedBox(child: Text(snapshot.data.toString(),style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold,),)
                                                          ),
                                                          
                                                        badgeStyle: badges.BadgeStyle(badgeColor: Colors.orange,),
                                                        ),
                                                      );
                                                  }  
                                                  
                                                  else {
                                                    return  Container();
                                                  }
                                                },
                                           ) 
                                                
                                              ),

                                          
                                    ])
                                    ),
                                ),
                              );
  }


}

Future<String> notifications_show() async {
  SharedPreferences shref = await SharedPreferences.getInstance();
  // List<String>? data = shref.getStringList("data");
  // List<String>? warrantydata=shref.getStringList('datawarranty');
  int? expiryLength=shref.getInt("expiryLength");
  int? warrntyLength=  shref.getInt("warrantyLength");
  String? notification = shref.getString("notification");
  // print((expiryLength! + warrntyLength!).toString());
  // (data != null || warrantydata!=null) && data!.isNotEmpty && notification == 'show'
  //  print((data.length +warrantydata!.length).toString());
  //   return (data.length +warrantydata.length).toString();
  if ( notification == 'show' && (expiryLength!=0 || warrntyLength!=0)) {
    FlutterAppBadger.removeBadge();
     FlutterAppBadger.updateBadgeCount(expiryLength! + warrntyLength!);
    
    return (expiryLength! + warrntyLength!).toString();
    // print((data.length +warrantydata!.length).toString());
    // return (data.length +warrantydata.length).toString();
  } else {
    return '0';
  }
}
