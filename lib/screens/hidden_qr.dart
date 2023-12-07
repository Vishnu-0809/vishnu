import 'package:flutter/material.dart';

class HiddenQR extends StatelessWidget {
  const HiddenQR({super.key, required this.image});
  final String image;
  @override


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
              "2nd QR code on the product",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins Medium",
                  fontSize: MediaQuery.of(context).size.width * 0.045,),
            ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: const Color(0xffdfdfdf),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.only(top: 30, left: 30 ,right: 30),
                      color: Colors.white,
                      child: FittedBox(child:
                       Image.network(image,
                    loadingBuilder: (context, child, loadingProgress) {
                   if (loadingProgress == null) return child;
                   return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xff002060)),));
            // You can use LinearProgressIndicator or CircularProgressIndicator instead
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Sorry couldn\'t show the product image')),
                    )
                       ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width * 0.15,
                child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff493797),
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(
                              10)), //content padding inside button)
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => Scanner2(),
                        // ));
                        Navigator.pop(context);
                      },
                      child: const FittedBox(
                          child: Text(
                        'OK',
                        style: TextStyle(fontSize: 18),
                      ))),
              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
