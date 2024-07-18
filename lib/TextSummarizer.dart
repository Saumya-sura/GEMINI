import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleio/drawer.dart';
import 'package:googleio/main.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart'; // Import the ThemeNotifier

class Textsummarizer extends StatefulWidget {
  const Textsummarizer({super.key});

  @override
  State<Textsummarizer> createState() => _TextsummarizerState();
}

class _TextsummarizerState extends State<Textsummarizer> {
  TextEditingController text = TextEditingController();
  TextEditingController suggestion = TextEditingController();
  String summary = " ";
  bool scanning = false;
  final apiUrl = dotenv.env['API_KEY'];

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<void> getdata(String myText, String howToSummarize) async {
    setState(() {
      scanning = true;
    });
    var data = {
      "contents": [
        {
          "parts": [
            {"text": "$howToSummarize - $myText"}
          ]
        }
      ]
    };
    try {
      final response = await http.post(
        Uri.parse(apiUrl!),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        setState(() {
          summary = result['candidates'][0]['content']['parts'][0]['text'];
          scanning = false;
        });
      } else {
        print("The error occurred: ${response.statusCode}");
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        scanning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Summarizer'),
      ),
      drawer: AppDrawer(onThemeChange: (ThemeMode ) { 
        
       },),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              controller: text,
              decoration: InputDecoration(
                hintText: "Enter text to summarize ",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: suggestion,
              decoration: InputDecoration(
                hintText: "How to summarize",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await getdata(text.text, suggestion.text);
              },
              child: Text("Summarize"),
            ),
            scanning
                ? CircularPercentIndicator(
                    radius: 50,
                    addAutomaticKeepAlive: true,
                    animateFromLastPercent: true,
                    animation: true,
                    animationDuration: 1200,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: 1,
                    center: Text("Summarizing"),
                    progressColor: Colors.blue,
                  )
                : SelectableText(summary),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
