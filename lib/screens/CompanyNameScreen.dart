import 'package:flutter/material.dart';
import 'constants.dart';
import 'display_product_main.dart';
import 'home_page.dart';
final companyName = TextEditingController();

class CompanyNameScreen extends StatefulWidget {
  const CompanyNameScreen({super.key, required this.sublink});
  final String sublink;

  @override
  State<CompanyNameScreen> createState() => _CompanyNameScreenState();
}

class _CompanyNameScreenState extends State<CompanyNameScreen> {
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if ((widget.sublink.length == 30 || widget.sublink.length == 29) && (COMNAME == null || COMNAME == "")) {
      print('inside');
      WidgetsBinding.instance.addPostFrameCallback((_) => companyNamedialog(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          // Navigating to the home screen and removing this page from the stack
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: ((context) => const HomeScreen(
                    first_time: 0,
                    mainLink: '',
                    location_on: true,
                  )),
            ),
            (Route<dynamic> route) => false,
          );
          Future.delayed(Duration(seconds: 2));
          return true;
        },
        child: Scaffold(),
      ),
    );
  }

  Future companyNamedialog(context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // Allow dismissing when tapping outside the dialog
      builder: (BuildContext context) {
        return 
        WillPopScope(
          onWillPop: () async {
            // Navigate to the home screen when the user tries to dismiss the dialog
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: ((context) => const HomeScreen(
                      first_time: 0,
                      mainLink: '',
                      location_on: true,
                    )),
              ),
              (Route<dynamic> route) => false,
            );
            return true;
          },
       child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          title: Text(
            'Enter Company Name to proceed',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Form(
            key: formkey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value == "") {
                  return "Company Name can't be null";
                } else {
                  return null;
                }
              },
              controller: companyName,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfffafafa),
                errorStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
                contentPadding: EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  COMNAME = companyName.text;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => DisplayProdMain(
                            subLink: widget.sublink,
                          )),
                    ),
                  );
                }
              },
              child: Text(
                'ok',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        )
        );
      },
    );
  }
}
