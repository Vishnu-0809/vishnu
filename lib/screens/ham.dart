import 'package:flutter/material.dart';
import 'home_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool switch_bool=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
          body: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0,left: 20),
                    child: Row(
                      children: [
                        IconButton(
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
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Colors.black,
                            
                          ),
                      ),
                          
                          SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                            Text('Profile'
                            ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.055,
                            fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),)
                      ],
                    ),
                  ),
                   Divider(
                  height: MediaQuery.of(context).size.height*0.03,
                  thickness: MediaQuery.of(context).size.width*0.002,
                  color:Color.fromRGBO(59, 59, 59, 1),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.025),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width ,
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              
                              Icons.perm_identity,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Edit Profile'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                         
                            Icon(
                              Icons.arrow_forward_ios,
                              size: MediaQuery.of(context).size.width*0.05,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                                                    ),
                            
                      ],
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.025),
                   Padding(
                    padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.55),
                    child: Container(
                              
                              child: Text('General Settings'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1))
                              ,),
                            ),
                    ),
                  
                   SizedBox(height: MediaQuery.of(context).size.height*0.1),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      
                      child: Row(
                        
                        children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(223,223, 223, 1),
                              child: Icon(
                                Icons.language,
                                size: MediaQuery.of(context).size.width*0.065,
                                // size: MediaQuery.of(context).size.width * 0.09,
                                color:Color.fromRGBO(136, 136, 136, 1),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                              Container(
                        
                                width: MediaQuery.of(context).size.width*0.7,
                                child: Text('Language'
                                ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 32, 96, 1)),),
                              ),
                              Icon(
                              Icons.arrow_forward_ios,
                              size: MediaQuery.of(context).size.width*0.05,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.brightness_4_rounded,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.62,
                              
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mode'
                                    ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 32, 96, 1)),),
                                    Text('Dark & Light'
                                    ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(0, 32, 96, 1)),),
                                  ],
                                ),
                             
                            ),
                            Switch(value: switch_bool, onChanged: ((value) => {
                              setState(() => switch_bool=value)
                        
                            }))
                      ],
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.question_mark,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('About'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                
                            Icon(
                            Icons.arrow_forward_ios,
                            size: MediaQuery.of(context).size.width*0.05,
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Color.fromRGBO(136, 136, 136, 1),
                          ),
                      ],
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.error,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Terms & Conditions'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                
                            Icon(
                            Icons.arrow_forward_ios,
                            size: MediaQuery.of(context).size.width*0.05,
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Color.fromRGBO(136, 136, 136, 1),
                          ),
                      ],
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.lock,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Privacy Policy'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                
                            Icon(
                            Icons.arrow_forward_ios,
                            size: MediaQuery.of(context).size.width*0.05,
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Color.fromRGBO(136, 136, 136, 1),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.star,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Rate This App'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                
                            Icon(
                            Icons.arrow_forward_ios,
                            size: MediaQuery.of(context).size.width*0.05,
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Color.fromRGBO(136, 136, 136, 1),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.share,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Share This Ap'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                
                            Icon(
                            Icons.arrow_forward_ios,
                            size: MediaQuery.of(context).size.width*0.05,
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Color.fromRGBO(136, 136, 136, 1),
                          ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.share,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Share This Ap'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                
                            Icon(
                            Icons.arrow_forward_ios,
                            size: MediaQuery.of(context).size.width*0.05,
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Color.fromRGBO(136, 136, 136, 1),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                          CircleAvatar(
                            backgroundColor: Color.fromRGBO(223,223, 223, 1),
                            child: Icon(
                              Icons.share,
                              size: MediaQuery.of(context).size.width*0.065,
                              // size: MediaQuery.of(context).size.width * 0.09,
                              color:Color.fromRGBO(136, 136, 136, 1),
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text('Deactivate Account'
                              ,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 32, 96, 1)),),
                            ),
                            Icon(
                            Icons.arrow_forward_ios,
                            size: MediaQuery.of(context).size.width*0.05,
                            // size: MediaQuery.of(context).size.width * 0.09,
                            color:Color.fromRGBO(136, 136, 136, 1),
                          ),
                      ],
                    ),
                  ),
                ],
                
              ),
          ), ),
      );
  }
}