// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:veots_mobile_app/widgets/send_accept.dart';


// class ClaimButt extends StatefulWidget {
//   const ClaimButt({super.key, required this.i_value, required this.clientId, required this.batchNo});
//   final int i_value;
//   final String clientId;
//   final String batchNo;
//   @override
//   State<ClaimButt> createState() => _ClaimButtState();
// }

// class _ClaimButtState extends State<ClaimButt> {
//    void initState() {
//     super.initState();
//     () async {
//       await info();
//       setState(() {
        
//       });
//     }();
//     // info();
//   }
//   @override
//   Album3? token;
//   String? mobile;
//   Future info() async
//   {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     mobile=pref.getString('id');
//     return mobile;
// }
//   Future getData() async {
//     print(mobile);
//     print(widget.i_value);
//     print(widget.clientId);
//     print(widget.batchNo);
//     token = await createAlbum56(widget.i_value, mobile!.toString(), widget.clientId, widget.batchNo);
//     print(token?.message);
//     return token;
//   }
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: FutureBuilder(
//           future: getData(),
//           builder: (context, snapshot) {
//           if (snapshot.data == null) {
//             return Container(
//               child: Center(
//                 child: Image.asset('assets/loading.gif'),
//               ),
//             );
//           }
//           else{
//             if (snapshot.data.message == "successfull") {
//                     return Center(
//                 child: Text(
//                   "successful",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               );
//                   } else if (snapshot.data.message ==
//                       "Timeout!!! please Rescan the qr codes") {
//                    return Center(
//                 child: Text(
//                   "timeout",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               );
//                   } else if (snapshot.data.message ==
//                       "This Product has been claimed by someone already.") {
//                    return  Center(
//                 child: Text(
//                   "already claimed",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               );
//                   } else if (snapshot.data.message == "internal error") {
//                    return Center(
//                 child: Text(
//                   "internal error",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               );
//                 }
//           }
//           return Center(
//                 child: Text(
//                   "no data",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               );
//         },),
//       ),
//     );
//   }
// }