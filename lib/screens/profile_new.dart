import 'dart:convert';

import 'package:Veots/screens/login.dart';
import 'package:Veots/widgets/ham.dart';
import 'package:Veots/widgets/send_accept.dart';
import 'package:flutter/material.dart';
import 'package:Veots/screens/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/NetworkCheck.dart';
import '../widgets/not_icon.dart';
import 'home_page.dart';

class Profile_new extends StatefulWidget {
  const Profile_new({super.key});

  @override
  State<Profile_new> createState() => _Profile_newState();
}

// var _scaffoldKey = new GlobalKey<ScaffoldState>();
class _Profile_newState extends State<Profile_new> {
  final _formKeyEditPass = GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _editKey = new GlobalKey<ScaffoldState>();
  final name_control = TextEditingController();
  final id_control = TextEditingController();
  final password = TextEditingController();
  final confirm_password = TextEditingController();
  final edit_password = TextEditingController();
  final companyName = TextEditingController();
  bool loading_update = false;
  Color text_color_id = Color(0xff949494);
  Color text_color_pass = Color(0xff949494);
  Color text_color_conpass = Color(0xff949494);

  bool pass = true;
  bool confirm_pass = true;
  String dropdownvalue = GENDER.toString();
  bool update_button = true;
  bool edit = true;
  final formkey = GlobalKey<FormState>();
  String DateofBirth = "";
  bool AgeButtonpressed = true;
  String? Dateofbirth;
  DateTime selectedDate = DateTime.parse('2020-01-02');
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
        DateofBirth = "${selectedDate.toLocal()}".split(' ')[0].toString();
        print("gg");
        print(DateofBirth);
        // print(BsonDa);
        AgeButtonpressed = true;
      });
  }

  // List of items in our dropdown menu
  var items = ['Male', 'Female', 'Others'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("entered init state");
    id_control.text = ID.toString();
    print(ID.toString());
    name_control.text = NAME.toString();
    print(COMNAME.toString());
    companyName.text = COMNAME == null ? '' : COMNAME.toString();
    print("DOBBBBB");
    print(DOB);
    selectedDate = DateTime.parse(DOB!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
            onWillPop: () async {
              Navigator.of(context).pop();
              return true;
            },
            child: Scaffold(
                key: _scaffoldKey,
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
                          margin: const EdgeInsets.only(top: 0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.08,
                                width: MediaQuery.of(context).size.width * 0.08,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: const Color(0xff002060),
                                      size: MediaQuery.of(context).size.width *
                                          0.05,
                                    )),
                              ),
                              Container(
                                child: Image.asset(
                                  'assets/veots_logo_wo_tl.png',
                                  height:
                                      MediaQuery.of(context).size.width * 0.09,
                                  width:
                                      MediaQuery.of(context).size.width * 0.09,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff002060),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeScreen(
                                                                first_time: 0,
                                                                mainLink: '',
                                                                location_on:
                                                                    true,
                                                              )),
                                                      (route) => false);
                                            },
                                            icon: const Icon(
                                              Icons.home,
                                              // size: MediaQuery.of(context).size.width * 0.06,
                                              color: Colors.white,
                                            ))),
                                  )),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.015,
                              ),
                              Not_icon(),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.015,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff002060),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: InkWell(
                                        onTap: () {
                                          _scaffoldKey.currentState
                                              ?.openDrawer();
                                        },
                                        child: Icon(
                                          Icons.menu,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 12,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  color: Color(0xff002060),
                                  // height: 1.2,
                                ),
                              ),
                              Icon(
                                Icons.account_circle,
                                size: MediaQuery.of(context).size.width * 0.28,
                                // color: Colors.white,
                              ),
                              Text(
                                NAME.toString(),
                                style: TextStyle(
                                  // fontSize:
                                  //     MediaQuery.of(context).size.width * 0.045,
                                  // fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.047,
                                  fontFamily: "Mont",
                                  color: Color(0xff002060),
                                  // height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 50, right: 50),
                                height: 25,
                                width: 60,
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        edit = false;
                                      });
                                    },
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll<Color>(
                                              Colors.transparent),
                                    ),
                                    child: Text("Edit")),
                                decoration: (edit == true
                                    ? BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                        Color(0xff00b7ff),
                                        Color(0xffaa2aae)
                                      ]))
                                    : BoxDecoration(
                                        // color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ))),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 50, right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins Medium",
                                    color: Color(0xff004aad)
                                    // height: 1.2,
                                    ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                readOnly: edit,
                                controller: name_control,
                                validator: (value) {
                                  if (value == ' ' || value!.isEmpty) {
                                    return "Can't be null";
                                  } else if (value.length < 3) {
                                    return 'Username should contain at least 8 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(
                                    color: const Color(0xff949494),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.0317),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xfffafafa),
                                  errorStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(35)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              Text(
                                "Company Name",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins Medium",
                                    color: Color(0xff004aad)
                                    // height: 1.2,
                                    ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                readOnly: edit,
                                controller: companyName,
                                //  validator: (value){
                                //          if(value!.length<8 && value.isNotEmpty)
                                //             {
                                //               return 'Company Name should contain at least 8 characters';
                                //             }
                                //             else{

                                //               return null;

                                //             }

                                //     },
                                style: TextStyle(
                                    color: const Color(0xff949494),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.0317),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xfffafafa),
                                  errorStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(35)),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              MOB_not_EM!
                                  ? Text(
                                      "Phone",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins Medium",
                                          color: Color(0xff004aad)
                                          // height: 1.2,
                                          ),
                                    )
                                  : Text(
                                      "Email",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.033,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins Medium",
                                          color: Color(0xff004aad)
                                          // height: 1.2,
                                          ),
                                    ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              MOB_not_EM!
                                  ? TextFormField(
                                      controller: id_control,
                                      onChanged: (value) {
                                        RegExp reg = RegExp(r'[0-9]{10}');
                                        RegExp reg1 = RegExp(r'[.,-\s]+');
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 10 ||
                                            reg1.hasMatch(value)) {
                                          setState(() {
                                            text_color_id = Colors.red;
                                          });
                                        } else {
                                          setState(() {
                                            //  check_id=true;
                                            text_color_id = Color(0xff949494);
                                          });
                                        }
                                      },
                                      validator: (value) {
                                        if (value == ' ' || value!.isEmpty) {
                                          return "Phone is required";
                                        } else {
                                          return null;
                                        }
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      maxLength: 10,
                                      keyboardType: TextInputType.number,
                                      readOnly: true,
                                      style: TextStyle(
                                          color: text_color_id,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0317),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        filled: true,
                                        fillColor: Color(0xfffafafa),
                                        errorStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03),
                                        contentPadding:
                                            EdgeInsets.only(top: 0, left: 20),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(35)),
                                      ),
                                    )
                                  : TextFormField(
                                      validator: (value) {
                                        RegExp reg = RegExp(r'[0-9]{10}');

                                        if (value == null || value.isEmpty) {
                                          return 'Email is required';
                                        } else if ((!value.contains('@') ||
                                            !value.contains('.'))) {
                                          return 'Invalid Email';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: id_control,
                                      readOnly: true,
                                      style: TextStyle(
                                          color: const Color(0xff949494),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0317),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xfffafafa),
                                        errorStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03),
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(35)),
                                      ),
                                    ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins Medium",
                                    color: Color(0xff004aad)
                                    // height: 1.2,
                                    ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: DropdownButtonFormField(
                                  iconEnabledColor: const Color(0xFFfafafa),
                                  iconDisabledColor: const Color(0xFFfafafa),
                                  hint: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                          color: const Color(0xff4d4c4c),
                                          // fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins Medium",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.0317),
                                    ),
                                  ),
                                  style: TextStyle(
                                      color: const Color(0xff4d4c4c),
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.031),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xfffafafa),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0,
                                          color: const Color(0xFFfafafa)),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  value: dropdownvalue,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: edit
                                      ? null
                                      : (String? newValue) {
                                          dropdownvalue = newValue!;
                                          setState(() {
                                            switch (dropdownvalue) {
                                              case "Male":
                                                print(dropdownvalue);
                                                break;
                                              case "Female":
                                                print(dropdownvalue);
                                                break;
                                              case "Others":
                                                print(dropdownvalue);
                                                break;
                                            }
                                          });
                                        },
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              Container(
                                // color: Colors.blue,
                                // width: MediaQuery.of(context).size.width /2,
                                child: FittedBox(
                                  child: Text(
                                    "Date of birth",
                                    style: TextStyle(
                                      color: const Color(0xFF004aad),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.033,
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFFfafafa)),
                                      child: TextButton(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Text(
                                                    "${selectedDate.toLocal()}"
                                                        .split(' ')[0],
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xff949494),
                                                        // fontWeight:
                                                        //     FontWeight.bold,
                                                        fontFamily:
                                                            "Poppins Medium",
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.0317),
                                                  ),
                                                ),
                                              )
                                            ]),
                                        onPressed: edit == false
                                            ? () => _selectDate(context)
                                            : () {},
                                      ))),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              Text(
                                "New Password",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins Medium",
                                    color: Color(0xff004aad)
                                    // height: 1.2,
                                    ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              TextFormField(
                                readOnly: edit,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  String res = '';
                                  RegExp complete = RegExp(
                                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
                                  RegExp upper = RegExp(r'(?=.*[A-Z])');
                                  RegExp lower = RegExp(r'(?=.*[a-z])');
                                  RegExp digit = RegExp(r'(?=.*[0-9])');
                                  RegExp special = RegExp(r'(?=.*?[!@#\$&*~])');
                                  if (value!.isNotEmpty) {
                                    if (!upper.hasMatch(value)) {
                                      res = res +
                                          'should contain at least one upper case';
                                    }
                                    if (!lower.hasMatch(value)) {
                                      res = res +
                                          '\nshould contain at least one lower case';
                                    }
                                    if (!digit.hasMatch(value)) {
                                      res = res +
                                          '\nshould contain at least one digit';
                                    }
                                    if (!special.hasMatch(value)) {
                                      res = res +
                                          '\nshould contain at least one Special character';
                                    }
                                    if (value.length < 8) {
                                      res = res +
                                          '\nMust be at least 8 characters in length';
                                    }
                                  }

                                  if (!complete.hasMatch(value) &&
                                      value.isNotEmpty) {
                                    text_color_pass = Colors.red;
                                    return res;
                                  } else {
                                    text_color_pass = Color(0xff949494);
                                    return null;
                                  }
                                },
                                obscureText: pass,
                                obscuringCharacter: '*',
                                controller: password,
                                style: TextStyle(
                                    color: text_color_pass,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.0317),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xfffafafa),
                                  errorStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(35)),
                                  suffixIcon: edit == false
                                      ? IconButton(
                                          // padding: EdgeInsets.only(
                                          //     top: MediaQuery.of(context).size.height *
                                          //         0.01),
                                          iconSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          icon: Icon(
                                            color: Color(0xff4d4c4c),
                                            pass
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              pass = !pass;
                                            });
                                          },
                                        )
                                      : null,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              Text(
                                "Confirm Password",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.033,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins Medium",
                                    color: Color(0xff004aad)
                                    // height: 1.2,
                                    ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 130,
                              ),
                              TextFormField(
                                readOnly: edit,
                                validator: (value) {
                                  if (password.text == confirm_password.text) {
                                    text_color_conpass = Color(0xff949494);
                                    return null;
                                  } else {
                                    text_color_conpass = Colors.red;
                                    return 'Should be same as the above password';
                                  }
                                },
                                obscureText: confirm_pass,
                                obscuringCharacter: '*',
                                controller: confirm_password,
                                style: TextStyle(
                                    color: text_color_conpass,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.0317),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xfffafafa),
                                  errorStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(35)),
                                  suffixIcon: edit == false
                                      ? IconButton(
                                          // padding: EdgeInsets.only(
                                          //     top: MediaQuery.of(context).size.height *
                                          //         0.01),
                                          iconSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          icon: Icon(
                                            color: Color(0xff4d4c4c),
                                            confirm_pass
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              confirm_pass = !confirm_pass;
                                            });
                                          },
                                        )
                                      : null,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                              ),
                              Row(
                                children: [
                                  Container(
                                      child: ElevatedButton(
                                          onPressed: (() async {
                                            setState(() {
                                              name_control.text =
                                                  NAME.toString();
                                              selectedDate =
                                                  DateTime.parse(DOB!);
                                              id_control.text = ID.toString();
                                              dropdownvalue = GENDER.toString();
                                              confirm_password.text = '';
                                              password.text = '';
                                              edit = true;
                                              companyName.text = COMNAME == null
                                                  ? ''
                                                  : COMNAME.toString();
                                            });
                                          }),
                                          child: Text("Cancel"),
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.transparent),
                                          )),
                                      height: 45,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                        Color(0xff00b7ff),
                                        Color(0xffaa2aae)
                                      ]))),
                                  Spacer(),
                                  loading_update
                                      ? CircularProgressIndicator()
                                      : Container(
                                          child: ElevatedButton(
                                              onPressed: (edit == false)
                                                  ? (() async {
                                                      if (formkey.currentState!
                                                          .validate()) {
                                                        show();
                                                      }
                                                    })
                                                  : null,
                                              child: Text("Update"),
                                              style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll<
                                                            Color>(
                                                        Colors.transparent),
                                              )),
                                          height: 45,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          decoration:
                                              (update_button && edit == false)
                                                  ? const BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                          Color(0xff00b7ff),
                                                          Color(0xffaa2aae)
                                                        ]))
                                                  : BoxDecoration(
                                                      // color: Colors.white,
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2,
                                                      ),
                                                    ))
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 40,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                drawer: HamWidget())));
  }

  show() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          // backgroundColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          title: Text(
            'Enter current password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Form(
            key: _formKeyEditPass,
            child: TextFormField(
                controller: edit_password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value == "") {
                    return "Password can't be null";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xfffafafa),
                  errorStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03),
                  contentPadding: EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                )),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  print(name_control.text);
                  print(id_control.text);
                  print(dropdownvalue);
                  print(confirm_password.text);
                  bool isUserNameUpdated = NAME.toString() != name_control.text;
                  bool isGenderUpdated = GENDER.toString() != dropdownvalue;
                  bool isUserIdUpdated = ID.toString() != id_control.text;
                  bool isPasswordUpdated = confirm_password.text == '' ||
                          confirm_password.text == null
                      ? false
                      : true;
                  bool isDobUpdated = DateofBirth != DOB && DateofBirth != "";
                  bool isCompanyNameUpdated = false;
                  if (companyName.text == '' || COMNAME == null) {
                    isCompanyNameUpdated = false;
                  } else {
                    isCompanyNameUpdated =
                        companyName.text != COMNAME.toString();
                  }
                  print("------");
                  print(isCompanyNameUpdated);
                  print("0------");
                  // companyName.text==''?false:() ;
                  print(isUserNameUpdated);
                  print(isGenderUpdated);
                  print(isUserIdUpdated);
                  print(isPasswordUpdated);
                  print(isDobUpdated);
                  print(DateofBirth);
                  if (_formKeyEditPass.currentState!.validate()) {
                    final response = await createAlbum_update_info(
                        isUserNameUpdated,
                        isGenderUpdated,
                        isUserIdUpdated,
                        isPasswordUpdated,
                        isDobUpdated,
                        isCompanyNameUpdated,
                        MOB_not_EM!,
                        isUserNameUpdated ? name_control.text : null,
                        isGenderUpdated ? dropdownvalue : null,
                        ID.toString(),
                        isUserIdUpdated ? id_control.text : null,
                        edit_password.text,
                        isPasswordUpdated ? confirm_password.text : null,
                        isCompanyNameUpdated ? companyName.text : null,
                        isDobUpdated ? DateofBirth : null);
                    var result = json.decode(response.body);
                    print(result);
                    if (response.statusCode == 200) {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString('name', name_control.text);
                      pref.setString('id', id_control.text);
                      pref.setString('gender', dropdownvalue);
                      pref.setString('companyName', companyName.text);
                      isDobUpdated ? pref.setString('dob', DateofBirth) : null;

                      setState(() {
                        NAME = name_control.text;
                        GENDER = dropdownvalue;
                        ID = id_control.text;
                        COMNAME = companyName.text;
                        DOB = isDobUpdated ? DateofBirth : DOB;
                      });
                      password.text = '';
                      confirm_password.text = '';
                      setState(() {
                        edit = true;
                        loading_update = false;
                      });
                      edit_password.text = '';

                      showOverlay(context, "successful");
                    }

                    //   else if(response.statusCode==400)
                    //   {
                    //   name_control.text=NAME.toString();
                    //   id_control.text=ID.toString();
                    //   dropdownvalue=GENDER.toString();
                    //   companyName.text= COMNAME==null ?'': COMNAME.toString();
                    //   edit_password.text='';
                    //   password.text ='';
                    //   confirm_password.text='';
                    //   setState(() {
                    //                 edit=true;
                    //                 loading_update=false;
                    //               });
                    // showOverlay(context,'please provide the details');

                    // }
                    //     else if(response.statusCode==401)
                    //   {
                    //     name_control.text=NAME.toString();
                    //     id_control.text=ID.toString();
                    //     dropdownvalue=GENDER.toString();
                    //     companyName.text= COMNAME==null ?'': COMNAME.toString();
                    //     edit_password.text='';
                    //     password.text ='';
                    //     confirm_password.text='';
                    //     setState(() {
                    //                 edit=true;
                    //                 loading_update=false;
                    //               });
                    // showOverlay(context,"password doesn't match");

                    //   }
                    else {
                      name_control.text = NAME.toString();
                      id_control.text = ID.toString();
                      dropdownvalue = GENDER.toString();
                      companyName.text =
                          COMNAME == null ? '' : COMNAME.toString();
                      edit_password.text = '';
                      password.text = '';
                      confirm_password.text = '';
                      selectedDate = DateTime.parse(DOB!);
                      setState(() {
                        edit = true;
                        loading_update = false;
                      });

                      showOverlay(context, result["message"]);
                    }
                    Navigator.pop(context);
                  }
                }
              },
              child: Text(
                'OK',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }
}
