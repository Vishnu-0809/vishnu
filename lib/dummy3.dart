import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

class Dummy3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Grid Example'),
        ),
        body: Column(
          children: [
           
              Container(
                color: Colors.red,
                height: 20,
                width: 100,
              ),
        
              Container(
                color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.026,
                width: MediaQuery.of(context).size.width * 0.255,
              ),
        
          ],
        )
      ),
    );
  }
}
