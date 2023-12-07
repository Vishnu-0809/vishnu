import 'package:Veots/screens/profile_new.dart';
import 'package:flutter/material.dart';


import 'home_page.dart';

class HamBurger extends StatefulWidget {
  const HamBurger({super.key});

  @override
  State<HamBurger> createState() => _HamBurgerState();
}

class _HamBurgerState extends State<HamBurger> {
  bool switch_bool = false;
  @override
   Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/100,),
              //  Padding(
              //       padding: const EdgeInsets.only(top:20.0,left: 10),
                    // child: Row(
                    //   children: [
                    //     IconButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pushAndRemoveUntil(
                    //       MaterialPageRoute(
                    //           builder: ((context) => HomeScreen(
                    //                 first_time: 0,
                    //               ))),
                    //       (Route<dynamic> route) => false,
                    //     );
                    //   },
                    //   icon: Icon(
                    //         Icons.chevron_left,
                    //         size: MediaQuery.of(context).size.width * 0.09,
                    //         color:Colors.black,
                            
                    //       ),
                    //   ),
                          
                    //       SizedBox(width: MediaQuery.of(context).size.width*0.25),
                    //         Text('Profile'
                    //         ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.055,
                    //         fontWeight: FontWeight.w500,
                    //           color: Color.fromRGBO(0, 32, 96, 1)),)
                    //   ],
                    // ),
              //     ),
              Container(
                // padding: EdgeInsets.only(top: 5),
                // color: Colors.yellow,
                child:Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child:  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: ((context) => HomeScreen(
                                    first_time: 0,mainLink: '',location_on: true,
                                  ))),
                          (Route<dynamic> route) => false,
                        );
                      },
                      icon: Icon(
                            Icons.chevron_left,
                            size: MediaQuery.of(context).size.width * 0.09,
                            color:Colors.black,
                            
                          ),
                      ),
                        ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.28),
                            Text('Profile'
                            ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.055,
                              color: Color.fromRGBO(0, 32, 96, 1)),)
                      ],
                    ),
              ),
              Container(
                // color: Colors.red,
                padding: EdgeInsets.only(top: 0, bottom: 0),
                child: Divider(
                  // height: MediaQuery.of(context).size.height*0.03,
                  thickness: MediaQuery.of(context).size.width*0.002,
                  color:Color.fromRGBO(59, 59, 59, 1),
                  ),
              ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.015),
               Container(
                margin: EdgeInsets.only(left: 13, right: 20),
                child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.perm_identity,
                              size: MediaQuery.of(context).size.width*0.06,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color(0xff888888)
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                            Container(
                              // width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Edit Profile'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width*0.085,
                              child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile_new()));
                      },
                      icon: Icon(
                              size: MediaQuery.of(context).size.width*0.05,
                              Icons.arrow_forward_ios,
                              color:Color(0xff888888),
                              
                          ),
                      ),
                            ),
                      ],
                    ),
               ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.023),
                    Container(
                        margin: EdgeInsets.only(left: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('General Settings'
                                  ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                                  color: Color.fromRGBO(0, 32, 96, 1))
                                  ,),
                                ],
                              ),
                            ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.023),
                    Container(
                    margin: EdgeInsets.only(left: 13, right: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.brightness_4_rounded,
                              size: MediaQuery.of(context).size.width*0.06,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color(0xff888888)
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                            Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mode'
                                    ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                
                                    color: Color.fromRGBO(0, 32, 96, 1)),),
                                    Text('Dark & Light'
                                    ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,
                
                                    color: Color(0xff888888)),),
                                  ],
                                ),
                            ),
                            Spacer(),
                            Switch(value: switch_bool,
                            activeColor: Color(0xff764af1),
                            activeTrackColor: Color(0xffdfdfdf),
                            inactiveThumbColor: Color(0xff764af1),
                            inactiveTrackColor: Color(0xffdfdfdf),
                             onChanged: ((value) => {
                              setState(() => switch_bool=value)
                            }))
                      ],
                    ),
                  ),
              SizedBox(height: MediaQuery.of(context).size.height*0.023),
              Container(
                                margin: EdgeInsets.only(left: 13, right: 20),
                      child: Row(
                        children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(223,223, 223, 1),
                              child: Icon(
                                Icons.language,
                                size: MediaQuery.of(context).size.width*0.06,
                                // size: MediaQuery.of(context).size.width * 0.09,
                                color:Color(0xff888888)
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                              Container(
                        
                                child: Text('Language'
                                ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
            
                                color: Color.fromRGBO(0, 32, 96, 1)),),
                              ),
                              Spacer(),
                              Container(
                              width: MediaQuery.of(context).size.width*0.085,
                              child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                              size: MediaQuery.of(context).size.width*0.05,
                              Icons.arrow_forward_ios,
                              color:Color(0xff888888),
                          ),
                      ),
                            ),
                        ],
                      ),
                    ),
              SizedBox(height: MediaQuery.of(context).size.height*0.023),
              Container(
                    margin: EdgeInsets.only(left: 13, right: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.question_mark,
                              size: MediaQuery.of(context).size.width*0.06,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              child: Text('About'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
          
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width*0.085,
                              child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                              size: MediaQuery.of(context).size.width*0.05,
                              Icons.arrow_forward_ios,
                              color:Color(0xff888888),
                              
                          ),
                      ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.023),
              Container(
                    margin: EdgeInsets.only(left: 13, right: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.error,
                              size: MediaQuery.of(context).size.width*0.06,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              child: Text('Terms and Conditions'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
          
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width*0.085,
                              child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                              size: MediaQuery.of(context).size.width*0.05,
                              Icons.arrow_forward_ios,
                              color:Color(0xff888888),
                              
                          ),
                      ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.023),
              Container(
                    margin: EdgeInsets.only(left: 13, right: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.lock,
                              size: MediaQuery.of(context).size.width*0.06,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              child: Text('Privacy Policy'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
          
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width*0.085,
                              child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                              size: MediaQuery.of(context).size.width*0.05,
                              Icons.arrow_forward_ios,
                              color:Color(0xff888888),
                              
                          ),
                      ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.023),
              Container(
                    margin: EdgeInsets.only(left: 13, right: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.star,
                              size: MediaQuery.of(context).size.width*0.06,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              child: Text('Rate This App'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
          
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width*0.085,
                              child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                              size: MediaQuery.of(context).size.width*0.05,
                              Icons.arrow_forward_ios,
                              color:Color(0xff888888),
                              
                          ),
                      ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.023),
              Container(
                    margin: EdgeInsets.only(left: 13, right: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.share,
                              size: MediaQuery.of(context).size.width*0.06,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              child: Text('Share This App'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
          
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width*0.085,
                              child: IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                              size: MediaQuery.of(context).size.width*0.05,
                              Icons.arrow_forward_ios,
                              color:Color(0xff888888),
                              
                          ),
                      ),
                            ),
                      ],
                    ),
                  ),
            ],)),
      ) );
  }
}
 