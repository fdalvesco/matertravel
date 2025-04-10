import 'package:flutter/material.dart';
import '../pages/continent.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: Text('Continente'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContinentPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
