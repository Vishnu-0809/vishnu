import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAnimatedPage(),
              ),
            );
          },
          child: Text('Navigate to Animated Page'),
        ),
      ),
    );
  }
}

class MyAnimatedPage extends StatefulWidget {
  @override
  _MyAnimatedPageState createState() => _MyAnimatedPageState();
}

class _MyAnimatedPageState extends State<MyAnimatedPage> {
  bool _isContainerBig = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation in initState
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isContainerBig = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _isContainerBig ? 200.0 : 100.0,
          height: _isContainerBig ? 200.0 : 100.0,
          color: _isContainerBig ? Colors.blue : Colors.red,
          alignment: _isContainerBig ? Alignment.center : Alignment.topCenter,
          child: Text(
            'Animated Container!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
