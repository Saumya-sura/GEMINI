import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(ThemeMode) onThemeChange;

  AppDrawer({required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            "DRAWER",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue), 
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
          ListTile(
            title: Text("Feedback"),
            leading: Icon(Icons.feedback),
            onTap: () {
              Navigator.pushNamed(context, '/feedback');
            },
          ),
          ListTile(
            title: Text("Bot"),
            leading: Icon(Icons.chat),
            onTap: () {
              Navigator.pushNamed(context, '/bot');
            },
          ),
          ListTile(
            title: Text("Dark Mode"),
            leading: Icon(Icons.dark_mode),
            onTap: () {
              onThemeChange(ThemeMode.dark);
            },
          ),
          ListTile(
            title: Text("Light Mode"),
            leading: Icon(Icons.light_mode),
            onTap: () {
              onThemeChange(ThemeMode.light);
            },
          ),

          
        ],
      ),
    );
  }
}
