import 'package:Veots/screens/phone_view.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:Veots/screens/Verification_with_phone.dart';
import 'package:Veots/screens/login.dart';
import '../widgets/NetworkCheck.dart';
import '../widgets/Requests.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/send_accept.dart';

class Register_with_phone_ extends StatefulWidget {
  Register_with_phone_(
      {super.key, required this.Link, required this.location_on});
  final String Link;
  final bool location_on;
  @override
  State<Register_with_phone_> createState() => Register_with_phone_State();
}

class Register_with_phone_State extends State<Register_with_phone_> {
  String DateofBirth = "";
  bool AgeButtonpressed = false;
  String? Dateofbirth;
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        final finalDateOfBirth = selectedDate.toUtc().toIso8601String();
        print("${selectedDate.toLocal()}".split(' ')[0]);
        // Dateofbirth="${selectedDate.toLocal()}".split(' ')[0];
        // date=BsonDate(selectedDate);
        print(finalDateOfBirth);
        DateofBirth="${selectedDate.toLocal()}".split(' ')[0].toString();
        
        print("gg");
        print(DateofBirth);
        // print(BsonDa);
        AgeButtonpressed = true;
      });
  }

  TextEditingController _Name = TextEditingController();
  // TextEditingController _FirstName = TextEditingController();
  // TextEditingController _LastName = TextEditingController();
  TextEditingController _CompanyName = TextEditingController();
  TextEditingController _Phone_Number = TextEditingController();
  TextEditingController _Password = TextEditingController();
  TextEditingController _Confirm_Password = TextEditingController();
  String? dropdownvalue = null;

  final _ValidationKey = GlobalKey<FormState>();
  List<String> items = ["Male", "Female", "Others"];
  Albumotpsend? token;
  AlbumCheckIfUserExists? token2;

  bool visible = true;
  bool visible2 = true;
  void sign() async {
   token2=await createCheckIfUserExists(true,_Phone_Number.text.toString());
   print("checkuser api response");
          print(token2!.message);
          
          print(token2!.statusCode);
 if(token2!.statusCode==200)
          {
         final show_net = Show_snack(context, "User already exists");
          ScaffoldMessenger.of(context).showSnackBar(show_net);
          
         
          }
          else if(token2!.statusCode==404){
                token = await createAlbum10(_Phone_Number.text);
    print("ppppppppp");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Verification(
          Username: _Name.text.trim(),
          CompanyName: _CompanyName.text,
          password: _Password.text,
          gender: dropdownvalue.toString(),
          phoneNum: _Phone_Number.text,
          location_on: widget.location_on,
          link: widget.Link,
          dob: DateofBirth,
        ),
      ),
    );
         
          }
          else{
             final show_net = Show_snack(context, "Something went wrong");
          ScaffoldMessenger.of(context).showSnackBar(show_net);
        
          }

    if (token!.type == 'success') {
      print("Successful_register");
    } else {
      print('Failure');
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpeg'), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // youtube video
                    Container(
                      height: MediaQuery.of(context).size.height * .0001,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 7),
                        // height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 25,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(0),
                                          // color: Colors.blue,
                                          child: Text(
                                            "Create New",
                                            style: TextStyle(
                                              height: 0.9,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              color: const Color(0xFF002060),
                                              fontFamily: "Poppins Medium",
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(0),
                                          // color: Colors.blue,
                                          child: Text(
                                            "Account",
                                            style: TextStyle(
                                              height: 0.9,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07,
                                              color: const Color(0xFF002060),
                                              fontFamily: "Poppins Medium",
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                                Form(
                                    key: _ValidationKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Username",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      const Color(0xFFfafafa),
                                                ),
                                                child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter your username';
                                                      }

                                                      return null;
                                                    },
                                                    controller: _Name,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13),
                                                      border: InputBorder.none,
                                                    )))),
                                        //          Container(
                                        // width: MediaQuery.of(context)
                                        //         .size
                                        //         .width /
                                        //     1.5,
                                        // height: MediaQuery.of(context)
                                        //         .size
                                        //         .height /
                                        //     30,
                                        // child: Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   children: [
                                        //         Container(
                                        //           // color: Colors.blue,
                                        //           // width: MediaQuery.of(context).size.width /2,
                                        //           child: FittedBox(
                                        //             child: Text(
                                        //               "First Name",
                                        //               style: TextStyle(
                                        //                   color: const Color(
                                        //                       0xFF004aad),
                                        //                   fontFamily:
                                        //                       "Poppins Medium"),
                                        //             ),
                                        //           ),
                                        //         )
                                        //       ],
                                        //     )),
                                        // Container(
                                        //     width: MediaQuery.of(context)
                                        //             .size
                                        //             .width /
                                        //         1.5,
                                        //     // height: MediaQuery.of(context).size.height / 18,
                                        //     child: Container(
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(20),
                                        //           color:
                                        //               const Color(0xFFfafafa),
                                        //         ),
                                        //         child: TextFormField(
                                        //             validator: (value) {
                                        //               if (value == null ||
                                        //                   value.isEmpty) {
                                        //                 return 'Please enter some text';
                                        //               }

                                        //               return null;
                                        //             },
                                        //             controller: _FirstName,
                                        //             style: TextStyle(
                                        //                 color: Colors.black),
                                        //             decoration: InputDecoration(
                                        //               contentPadding:
                                        //                   EdgeInsets.only(
                                        //                       left: 13),
                                        //               border: InputBorder.none,
                                        //             )))),
                                        //              Container(
                                        //     width: MediaQuery.of(context)
                                        //             .size
                                        //             .width /
                                        //         1.5,
                                        //     height: MediaQuery.of(context)
                                        //             .size
                                        //             .height /
                                        //         30,
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       children: [
                                        //         Container(
                                        //           // color: Colors.blue,
                                        //           // width: MediaQuery.of(context).size.width /2,
                                        //           child: FittedBox(
                                        //             child: Text(
                                        //               "Last Name",
                                        //               style: TextStyle(
                                        //                   color: const Color(
                                        //                       0xFF004aad),
                                        //                   fontFamily:
                                        //                       "Poppins Medium"),
                                        //             ),
                                        //           ),
                                        //         )
                                        //       ],
                                        //     )),
                                        // Container(
                                        //     width: MediaQuery.of(context)
                                        //             .size
                                        //             .width /
                                        //         1.5,
                                        //     // height: MediaQuery.of(context).size.height / 18,
                                        //     child: Container(
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(20),
                                        //           color:
                                        //               const Color(0xFFfafafa),
                                        //         ),
                                        //         child: TextFormField(
                                        //             // validator: (value) {
                                        //             //   if (value == null ||
                                        //             //       value.isEmpty) {
                                        //             //     return 'Please enter some text';
                                        //             //   }

                                        //             //   return null;
                                        //             // },
                                        //             controller: _LastName,
                                        //             style: TextStyle(
                                        //                 color: Colors.black),
                                        //             decoration: InputDecoration(
                                        //               contentPadding:
                                        //                   EdgeInsets.only(
                                        //                       left: 13),
                                        //               border: InputBorder.none,
                                        //             )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                      child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Company Name ',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xFF004aad),
                                                              // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '(for Retailers/Distributors only)',
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xFF004aad),
                                                              // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.0122),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                child: TextFormField(
                                                    controller: _CompanyName,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13),
                                                      border: InputBorder.none,
                                                    )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                        //  fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator: (value) {
                                                      RegExp reg =
                                                          RegExp(r'[0-9]{10}');

                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter mobile number';
                                                      }
                                                      if (!(value.length ==
                                                              10 &&
                                                          reg.hasMatch(
                                                              value))) {
                                                        return 'Please enter a valid mobile number';
                                                      }

                                                      return null;
                                                    },
                                                    controller: _Phone_Number,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13),
                                                      border: InputBorder.none,
                                                    )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Gender",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          // height: MediaQuery.of(context).size.height/18,
                                          child: DropdownButtonFormField(
                                            iconEnabledColor:
                                                const Color(0xFFfafafa),
                                            hint: FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child: Text(
                                                "Select",
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF4d4c4c),
                                                  //  fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            45),
                                              ),
                                            ),
                                            decoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xFFfafafa),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              // fillColor: const Color(0xFF1E1E1E),
                                            ),
                                            value: dropdownvalue,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please select your gender';
                                              }

                                              return null;
                                            },
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            items: items.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              dropdownvalue = newValue!;
                                              switch (dropdownvalue) {
                                                case "Male":
                                                  print(dropdownvalue);

                                                  break;
                                                case "Female":
                                                  print(dropdownvalue);
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) => ResidentialView(dropdownvalue)),
                                                  // );
                                                  break;
                                                case "Others":
                                                  print(dropdownvalue);

                                                  break;

                                                // break;
                                              }
                                            },
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Date of birth",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                14,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                child: AgeButtonpressed == false
                                                    ? TextButton(
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              FittedBox(
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                                child: Text(
                                                                  "Select",
                                                                  style: TextStyle(
                                                                      color: const Color(
                                                                          0xFF4d4c4c),
                                                                    //  fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",
                                                                      fontSize:
                                                                          MediaQuery.of(context).size.height /
                                                                              48),
                                                                ),
                                                              )
                                                            ]),
                                                        onPressed: () =>
                                                            _selectDate(
                                                                context),
                                                      )
                                                    : TextButton(
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              FittedBox(
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                                child: Text(
                                                                  "${selectedDate.toLocal()}"
                                                                      .split(
                                                                          ' ')[0],
                                                                   style: TextStyle(
                                                        color: Colors.black),
                                                   
                                                                ),
                                                              )
                                                            ]),
                                                        onPressed: () =>
                                                            _selectDate(
                                                                context),
                                                      ))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Password",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                        //  fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      const Color(0xFFfafafa),
                                                ),
                                                child: TextFormField(
                                                    obscureText: visible2,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator: (value) {
                                                      String res = '';
                                                      RegExp complete = RegExp(
                                                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
                                                      RegExp upper = RegExp(
                                                          r'(?=.*[A-Z])');
                                                      RegExp lower = RegExp(
                                                          r'(?=.*[a-z])');
                                                      RegExp digit = RegExp(
                                                          r'(?=.*[0-9])');
                                                      RegExp special = RegExp(
                                                          r'(?=.?[!@#\$&~])');

                                                      if (value!.isNotEmpty) {
                                                        if (!upper
                                                            .hasMatch(value)) {
                                                          res = res +
                                                              'should contain at least one upper case';
                                                        }
                                                        if (!lower
                                                            .hasMatch(value)) {
                                                          res = res +
                                                              '\nshould contain at least one lower case';
                                                        }
                                                        if (!digit
                                                            .hasMatch(value)) {
                                                          res = res +
                                                              '\nshould contain at least one digit';
                                                        }
                                                        if (!special
                                                            .hasMatch(value)) {
                                                          res = res +
                                                              '\nshould contain at least one Special character';
                                                        }
                                                        if (value.length < 8) {
                                                          res = res +
                                                              '\nMust be at least 8 characters in length';
                                                        }
                                                      }
                                                      if (!complete.hasMatch(
                                                              value) &&
                                                          value.isNotEmpty) {
                                                        return res == ''
                                                            ? null
                                                            : res;

                                                        //  return  res ;
                                                      } else if (value
                                                          .isEmpty) {
                                                        return "Please enter password";
                                                      } else {
                                                        return null;
                                                      }

                                                      // return null;
                                                      // else{
                                                      //     // text_color_pass=Color(0xff4d4c4c);
                                                      //   return null;

                                                      // }
                                                    },
                                                    controller: _Password,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13,
                                                              top: 15),
                                                      border: InputBorder.none,
                                                      suffixIcon: IconButton(
                                                        iconSize: 15.h,
                                                        icon: Icon(
                                                          visible2
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: const Color(
                                                              0xFF4d4c4c),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            visible2 =
                                                                !visible2;
                                                          });
                                                        },
                                                      ),
                                                    )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Confirm Password",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                        //  fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                child: TextFormField(
                                                    obscureText: visible,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return null;
                                                      } else if (_Password
                                                              .text !=
                                                          _Confirm_Password
                                                              .text) {
                                                        return 'Confirm password and new password should be same';
                                                      }
                                                    },
                                                    controller:
                                                        _Confirm_Password,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13,
                                                              top: 15),
                                                      border: InputBorder.none,
                                                      suffixIcon: IconButton(
                                                        iconSize: 15.h,
                                                        icon: Icon(
                                                          visible
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: const Color(
                                                              0xFF4d4c4c),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            visible = !visible;
                                                          });
                                                        },
                                                      ),
                                                    )))),
                                      ],
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular((4.0)),
                                      color: Colors.red.shade500),
                                  child: MaterialButton(
                                    // color: Colors.amber,
                                    onPressed: () {
                                      if (_Confirm_Password.text ==
                                          _Password.text) {
                                        if (_ValidationKey.currentState!
                                            .validate()) {
                                          {
                                            if (AgeButtonpressed == true) {
                                              sign();
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        "Error",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      content: Text(
                                                          'Please provide your date of birth'),
                                                    );
                                                  });
                                            }
                                          }
                                        }
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Error",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                content: Text(
                                                    'Confirm password is different than the password'),
                                              );
                                            });
                                      }
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                                          fontFamily:
                                                              "Poppins Medium",),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                               
                                  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              0),
                          child: Container(
                            // color: Colors.blue,
                            // width: MediaQuery.of(context).size.width / 3.0,
                            // height:20 ,
                            child: 
                                
                               FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Already have an account?",
                                  style: TextStyle(color: Colors.black,
                                //  fontWeight: FontWeight.w900,
                                  fontFamily: "Poppins Medium"),
                                  
                                ),
                              ),
                            
                          )),
                      
                    
                            Container(
                              // color: Colors.blue,
                              // width: MediaQuery.of(context).size.width / 2.0,
                              height:MediaQuery.of(context).size.height*0.05,
                              // margin: EdgeInsets.only(
                              //   right: MediaQuery.of(context).size.width * 0.1
                              //   ,
                              //   left: MediaQuery.of(context).size.width * 0.1),
                                

                              child: TextButton(
                                // color: Colors.amber,
                                onPressed: (){
                                  Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: ((context) => Login(mainLink: widget.Link,location_on: widget.location_on,))),
            (Route<dynamic> route) => false,
          );
                                },
                                child:  FittedBox
                                (
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                              "Log In",
                              style: TextStyle(
                                // fontWeight: FontWeight.w900,
                                fontFamily: "Poppins Medium",
                                color:  const Color(0xFF1a0bbe),
                                // fontStyle: FontStyle.italic, 
                               
                              ),
                            ),
                                )
                                
                              ),
                            )
                            ],
                      ),
 SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 30,
                                ),
                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return "Username cannot be empty";
                                //   }

                                //   return null;
                                // },
                                // onChanged: (value) {
                                //   name = value;
                                //   setState(() {});
                                // },
                              ],
                            )),
                      ),
                    ),

                    // comment section & recommended videos
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        // width: MediaQuery.of(context).size.width /2,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF002060),
              fontFamily: "Poppins Medium",
            ),
          ),
        ),
      );
  Widget buildFittedWidthText2(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(text),
        ),
      );
  Widget buildFittedWidthText3(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 6.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
}
