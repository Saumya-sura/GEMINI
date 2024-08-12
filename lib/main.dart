  import 'package:flutter/material.dart';
  import 'package:flutter_dotenv/flutter_dotenv.dart';
  import 'package:googleio/TextSummarizer.dart';
import 'package:googleio/botscreen.dart';
  import 'package:googleio/drawer.dart';
  import 'package:googleio/feedback.dart';
  import 'package:googleio/googlebot.dart';
  import 'package:googleio/splashscreen.dart';

  void main() async {
      
    await dotenv.load(fileName: "lib/.env");
    runApp(MYAPP());
  }

  class MYAPP extends StatefulWidget {
    @override
    _MYAPPState createState() => _MYAPPState();
  }

  class _MYAPPState extends State<MYAPP> {
    ThemeMode _themeMode = ThemeMode.system;

    void _changeTheme(ThemeMode themeMode) {
      setState(() {
        _themeMode = themeMode;
      });
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _themeMode,
        initialRoute: '/',
        routes: {
          '/': (context) => Scaffold(
            appBar: AppBar(
              title: Text('Google io'),
            ),
            drawer: AppDrawer(onThemeChange: _changeTheme),
            body: Center(
              child: Text('Home Page'),
            ),
          ),
          '/splash': (context) => Splash(),
          '/textsummarizer': (context) => Textsummarizer(),
          '/imageDecoder': (context) => ImageChat(),
          '/feedback': (context) => Feed(),
          '/bot': (context) => Botscreen(),
        },
      );
    }
  }
