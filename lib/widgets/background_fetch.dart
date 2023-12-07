// import 'dart:async';
// import 'package:Veots/widgets/send_accept.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:background_fetch/background_fetch.dart';

// import '../screens/constants.dart';
// bool check=true;
// var credentials;

// // /// This "Headless Task" is run when app is terminated.
// // void backgroundFetchHeadlessTask(HeadlessTask task) async {

// //   credentials = await createAlbum1('12345678', '1234567', true);
// //   SharedPreferences shref= await SharedPreferences.getInstance();
// //   shref.setString("notification", credentials);
// //   BackgroundFetch.finish(task.taskId);
// // }

// class Myapp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<Myapp> {
//   bool _enabled = true;
//   int _status = 0;
//   List<String> _events = [];

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     BackgroundFetch.configure(
//             BackgroundFetchConfig(
//                 minimumFetchInterval: 15,
//                 stopOnTerminate: false,
//                 enableHeadless: true,
//                 ),
//             _onBackgroundFetch);

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//   }

//   void _onBackgroundFetch(String taskId) 
//   async {
//   credentials = await createAlbum1('12345678', '1234567', true);
//   SharedPreferences shref= await SharedPreferences.getInstance();
//   shref.setString("notification", credentials);
//   BackgroundFetch.finish(taskId);
//   }

//   // void _onClickEnable(enabled) {
//   //   setState(() {
//   //     _enabled = enabled;
//   //   });
//   //   if (enabled) {
//   //     BackgroundFetch.start().then((int status) {
//   //       print(credentials);
//   //     }).catchError((e) {
//   //       print('[BackgroundFetch] start FAILURE: $e');
//   //     });
//   //   } else {
//   //     BackgroundFetch.stop().then((int status) {
//   //       print('[BackgroundFetch] stop success: $status');
//   //     });
//   //   }
//   // }

//   // void _onClickStatus() async {
//   //   int status = await BackgroundFetch.status;
//   //   print('[BackgroundFetch] status: $status');
//   //   setState(() {
//   //     _status = status;
//   //   });
//   // }

//   // void _onClickClear() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   prefs.remove(EVENTS_KEY);
//   //   setState(() {
//   //     _events = [];
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     const EMPTY_TEXT = Center(
//         child: Text(
//             'Waiting for fetch events.  Simulate one.\n [Android] \$ ./scripts/simulate-fetch\n [iOS] XCode->Debug->Simulate Background Fetch'));

//     return  Scaffold(
//         appBar: new AppBar(
//             title: const Text('BackgroundFetch Example',
//                 style: TextStyle(color: Colors.black)),
//             backgroundColor: Colors.amberAccent,
//             brightness: Brightness.light,
//             actions: <Widget>[
//               // Switch(value: _enabled, onChanged: _onClickEnable),
//             ]),
//         body: Container(
//           child: Column(
//             children: [
//               TextButton(
//                     onPressed:() {
//                       BackgroundFetch.start();
//                     },
//                 child: Text("hello")
//               ),
//               Text("${check}")
//             ],
//           ),
//         )
        
//       );
//   }
// }