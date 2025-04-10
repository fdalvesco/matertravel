import 'package:flutter/material.dart';
import '../widgets/customdrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0;
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();
    // Dispara as animações com pequenos delays
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() => _opacity = 1);
    });

    Future.delayed(Duration(milliseconds: 700), () {
      setState(() => _showLogo = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: _opacity,
              child: Text(
                'Bem-vindo(a) ao',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 800),
              tween: Tween<double>(begin: 0.7, end: _showLogo ? 1.0 : 0.7),
              curve: Curves.easeOutBack,
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 250,
                    height: 250,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: _opacity,
              child: Text(
                'O seu guia de viagem!',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}