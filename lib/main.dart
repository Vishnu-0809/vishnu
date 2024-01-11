import 'package:Veots/providers/theme_provider.dart';
import 'package:Veots/screens/IntroSlide1.dart';

import 'package:Veots/screens/Notifications_view.dart';
import 'package:Veots/screens/bill_comment.dart';
import 'package:Veots/screens/cash_back.dart';
import 'package:Veots/screens/coupons_details.dart';
import 'package:Veots/screens/exp_man_dateInput.dart';
import 'package:Veots/screens/product_feedback.dart';
import 'package:Veots/screens/rewards_page.dart';
import 'package:Veots/screens/track_history.dart';
import 'package:Veots/widgets/NetworkCheck.dart';
import 'package:Veots/widgets/background_fetch.dart';
import 'package:Veots/widgets/not_icon.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import 'package:Veots/screens/Invalid_postQR.dart';

import 'package:Veots/screens/hammburger.dart';

import 'package:Veots/screens/Loading_page.dart';
import 'package:Veots/screens/info_animations.dart';
import 'package:Veots/screens/purchase_history.dart';
import 'package:Veots/screens/searchbar.dart';
import 'package:Veots/screens/final_forgot_password.dart';
import 'package:Veots/screens/reset_password.dart';
import 'package:workmanager/workmanager.dart';
import 'package:cron/cron.dart';
import './screens/home_page.dart';
import './screens/display_product_main.dart';
import './screens/login.dart';

import 'dummy.dart';
import './dummy3.dart';
import 'screens/constants.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages

// import 'package:geolocator/geolocator.dart';

// import 'package:flutter_badge/flutter_badge.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(
    // isInDebugMode:true,
    callbackDispatcher,

    // The top level function, aka callbackDispatcher
    // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );

  Workmanager().registerPeriodicTask(
    "task-identifier",
    "simpleTask",
    frequency: Duration(hours: 12),
    //  initialDelay: Duration(hours: 1),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));

}

String? user;

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.is_on, this.link});
  final bool is_on;
  final String? link;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  void check_loaction() async {
    bool serviceEnabled;
    bool assign = true;

    var status = await Permission.location.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.location.request();
      status = await Permission.location.status;
    }
    grant_location(status.isGranted || status.isPermanentlyDenied);
  }

  void grant_location(loc) async {
    if (loc) {
      print("here ");
      LOCATION = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
  }

  void loggedin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("dddddddddddddd ");
    print(preferences.getString("asd")==null);
    print("ddddddddddddd");
    setState(() {
      INTRO = preferences.getBool("INTRO");
      ID = preferences.getString("id");
      UDID = preferences.getString("udid");
    });

    RegExp reg = RegExp(r'^[0-9]{10}$');

    if ((ID!.length == 10 && reg.hasMatch(ID.toString()))) {
      MOB_not_EM = true;
    } else {
      MOB_not_EM = false;
    }
    print(MOB_not_EM);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    print('------------------------');
    print(widget.is_on);
    print('------------------------');
    loggedin();
    check_loaction();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    bool isBackground = (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached);

    if (isBackground) {
      final cron = Cron();
      int count = 0;
      cron.schedule(Schedule.parse('*/3 * * * * *'), () async {
        WidgetsBinding.instance.addObserver(this);
        print('background');
//  await FlutterAppBadger.updateBadgeCount(count++);
      });
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
        builder: ((context, child) => MaterialApp( //line 171
            debugShowCheckedModeBanner: false,
            title: 'Veots',
            theme: ThemeData(
               textTheme: const TextTheme(
               headlineMedium: TextStyle(fontSize: 16,  fontFamily: "Poppins Medium", color: Color(0xff002060), 
               fontWeight: FontWeight.w600,
               ),
               headlineSmall: TextStyle(fontSize: 12,color: Color(0xff00b7ff), fontFamily: "Poppins Medium",),
               bodyMedium: TextStyle(fontSize: 12, fontFamily: 'Poppins Medium', color: Colors.white),
               bodySmall: TextStyle(fontSize: 10.5,fontFamily: 'Poppins Medium', fontWeight: FontWeight.bold,color: Color(0xff002060),
                )
             ),
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.compact,
            ),
            // standard dark theme
            // themeMode: ThemeMode.system,
            // theme: MyThemes.lightTheme,
            // darkTheme: MyThemes.darkTheme,
            home:
           INTRO==null?IntroSlider():
             ID == null
                ? Login(
                    mainLink: widget.link.toString(),
                    location_on: widget.is_on,
                  )
                : 
                  (widget.link == "" || !widget.is_on)
                    ? HomeScreen(
                        first_time: 0,
                        mainLink: widget.link.toString(),
                        location_on: widget.is_on,
                      )
                    : DisplayProdMain(subLink: widget.link!.substring(32)
                    )
                // Product_Feedback()
                // Rewards()
                // Coupon_Details()
                // dummy3()
                // DateInput()
                // DisplayProdMain(subLink: '25983251281605230614app280400000',)
                // MyHomePage()
                // Tracking_history()
        )
                )
                
                );
                
  }
}
