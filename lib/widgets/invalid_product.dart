import 'package:flutter/material.dart';
import '../models/class_models.dart';
import '../screens/home_page.dart';

class InvalidProd extends StatelessWidget {
  const InvalidProd({super.key, required this.snapshot, required this.keyD});
  final InvalidResponse snapshot;
  final keyD;
  @override


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
        SingleChildScrollView(
          child: Column(
            children: [
             SizedBox(height: MediaQuery.of(context).size.height/50,),
            Container(
              child: Row(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.08,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: const Color(0xff002060),
                        size: MediaQuery.of(context).size.width * 0.04,
                      )),),
                  Container(
                    child: Image.asset(
                      'assets/veots_logo_wo_tl.png',
                     height: MediaQuery.of(context).size.width * 0.075,
                        width: MediaQuery.of(context).size.width * 0.075,
                    ),
                  ),
                  const Spacer(),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.07,
                      width: MediaQuery.of(context).size.width * 0.07,
                      decoration: const BoxDecoration(
                        color: Color(0xff002060),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: FittedBox(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
                                   (context)=>HomeScreen(first_time: 0,
                                   mainLink: '',location_on: true,)), (route) => false);
                                },
                                icon: const Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ))),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                 Container(
                          height: MediaQuery.of(context).size.width * 0.07,
                          width: MediaQuery.of(context).size.width * 0.07,
                          decoration: const BoxDecoration(
                            color: Color(0xff002060),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: 
                              InkWell(
                             onTap: (){
                        keyD.currentState?.openDrawer();    },
                               child: Icon(
                                  Icons.menu,
                                  size: MediaQuery.of(context).size.width * 0.05,
                                  color: Colors.white,
                                ),
                            ),
                            ),
                          )),
                  const SizedBox(width: 12,)
                ],
              ),
            ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 35,
              // ),
              SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
              Text(
                "Scanned Product Details",
                style: TextStyle(
                    color: const Color(0xff002060),
                    // fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontSize: 16,
                    fontFamily: "Poppins Medium",
                    // fontWeight: FontWeight.bold
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width ,
                child: Image.asset('assets/invalid_cropped.gif', fit: BoxFit.fitWidth,),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),
              Text(
                "Invalid Product",
                style: TextStyle(
                    color: const Color(0xff011f5f),
                    fontSize: MediaQuery.of(context).size.width * 0.060,
                    fontFamily: "Montserrat",
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 120,
              ),
              Container(
                // alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.90,
                child: Text("To report please scan the 1st QR code on the outer box and click on \"Report Button\"",style: TextStyle(
                  color: const Color(0xffff1616),
                  fontFamily: "Montserrat",
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                ),textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
    );
  }
}
