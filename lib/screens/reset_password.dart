import 'package:flutter/material.dart';

class ResetPwd extends StatefulWidget {
  const ResetPwd({super.key});

  @override
  State<ResetPwd> createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> {
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/1.png"), fit: BoxFit.cover),
        ),
          ),
          SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff002060),
              ),
              margin: EdgeInsets.only( right: MediaQuery.of(context).size.width / 1.2),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.35, top: MediaQuery.of(context).size.height*0.01),
              child:Text("Reset your password!", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.06,),),
            ),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.48, top: MediaQuery.of(context).size.height*0.035),
              child:Text("Must be atleast 8 characters", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.035,),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Container(
              child: Image.asset(
                      'assets/4_cropped.png',
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width *0.9,
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                obscureText: _isObscure1,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(_isObscure1
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      }),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 13, top: 5),
                  labelText: 'New Password',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                obscureText: _isObscure2,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(_isObscure2
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure2 = !_isObscure2;
                        });
                      }),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 13, top: 5),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent, //background color of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.all(10)), //content padding inside button)
                  onPressed: () {},
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      )
        ],
      )
    );
  }
}
