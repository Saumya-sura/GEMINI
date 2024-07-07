// app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text("DRAWER", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.white)),
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                //backgroundImage: AssetImage('assets/logo.jpg'),
              ),
            ),
          ),
          ListTile(
            title: Text("Text Summarizer"),
            leading: Icon(Icons.text_decrease),
            onTap: () {
              Navigator.pushNamed(context, '/textsummarizer');
            },
          ),
          ListTile(
            title: Text("Ai bot"),
            leading: Icon(Icons.computer),
            onTap: () {
              Navigator.pushNamed(context, '/imageDecoder');
            },
          ),
          
          
        ],
      ),
    );
  }
}
