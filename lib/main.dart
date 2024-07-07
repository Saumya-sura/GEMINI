import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleio/TextSummarizer.dart';
import 'package:googleio/googlebot.dart';
import 'package:googleio/splashscreen.dart';
void main() async{
  runApp(MyAPP());
  await dotenv.load(fileName: "lib/.env"  );
}
class MyAPP extends StatelessWidget {
  const MyAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( 
      title: 'Google IO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: {
        
        '/textsummarizer': (context) => Textsummarizer(),
        '/imageDecoder': (context) => ImageChat(),
      },
    );
  }
}