import 'package:flutter/material.dart';
import 'src/models/appdata.dart';
import 'pages/preload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppData.loadFavorites();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mater Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PreloadPage(),
    );
  }
}