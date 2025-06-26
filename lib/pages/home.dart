import 'package:flutter/material.dart';
import '../widgets/customdrawer.dart';
import 'listcity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0;
  bool _showLogo = false;

  final String fixedPhrase = 'Sua aventura começa aqui!'; // Frase fixa

  @override
  void initState() {
    super.initState();

    // Animações iniciais
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
                fixedPhrase,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
            SizedBox(height: 30),
            AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: _opacity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF3701F),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: Icon(Icons.explore, color: Colors.white),
                label: Text(
                  'Explorar Destinos',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListCityPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
