import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:Veots/screens/tab_view.dart';
import 'package:Veots/screens/phone_view.dart';


class Login extends StatefulWidget {
  const Login({super.key, required this.mainLink, required this.location_on});
  final String mainLink;
  final bool location_on;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('--------------');
print(widget.mainLink);
print(widget.location_on);
print('----------------');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:(() async {
          // final value= await Dailog(context, 'Exit', 'Do you want to exit');
          // if (value==null)
          // {
          SystemNavigator.pop();
          return true;
          // }
          // else{
          //     return value;
          // }
      }
      ) ,
      child: 
     SafeArea(
        child: Scaffold(
       
          body: LayoutBuilder(builder: (context, constraints) {
           
              return Phone_view(
                mainLink: widget.mainLink,
                location_on: widget.location_on,
              );
            
          }),
        ),
      )
      );
  }
}
