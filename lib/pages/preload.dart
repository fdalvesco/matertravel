import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPageState createState() => _PreloadPageState();
}

class _PreloadPageState extends State<PreloadPage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Fade-in após pequeno atraso
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Vai para a home após 2.5 segundos
    Timer(Duration(seconds: 2, milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacity,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/logopreload.png', fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              color: Color(0xFFFF6F00), // laranja vibrante
            ),
          ],
        ),
      ),
    );
  }
}