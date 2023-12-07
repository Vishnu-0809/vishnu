import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Veots/main.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uni_links/uni_links.dart';
import 'package:video_player/video_player.dart';
import 'package:gif/gif.dart';
import 'constants.dart';
import 'home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>with TickerProviderStateMixin  {
  late VideoPlayerController _controller;
  //  late final GifController controller1;
   late final AudioPlayer player;

  
  bool is_on = true;
  String? link = "";

  Future<String?> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialLink();
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      return initialLink;
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  @override
  void initState() {
    player = AudioPlayer();
    player.setAsset('assets/Veots2.gif'); // Replace with your actual file path
    player.setLoopMode(LoopMode.one);
    player.play();
      // controller1 = GifController(vsync: this);
    // controller1= FlutterGifController(vsync:this);
    //     WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   controller1.repeat(
    //     min: 5,
    //     max: 83,
    //     period: const Duration(seconds: 3,microseconds: 300),
    //   );
    // });
    super.initState();
    grant_location();
    initUniLinks().then((value) => this.setState(() {
          link = value!;
        }));
    
    Timer(Duration(seconds: 3, milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyApp(is_on: is_on, link: link)),
      );
    });
  }

  void grant_location() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    var status = await Permission.location.status;
    is_on = serviceEnabled && status.isGranted;
    print(is_on);
    if (is_on) {
     
      LOCATION = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
        
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 420) {
          return Center(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.4,
           decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/Veots2.gif',
                    // <-- BACKGROUND IMAGE
                  ),
                  fit: BoxFit.fill,
                ),
              ),
          ));
        } else {
          return Center(
            child: Container(
              height: MediaQuery.of(context).size.height* 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/Veots.gif',
                    // <-- BACKGROUND IMAGE
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        }
      }),
    ));
  }
}
