import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BetterFeedback(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FEEDBACK',
      home: Feed(),
    );
  }
}

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BetterFeedback.of(context).show((UserFeedback feedback) {
              print(feedback.text);
              print(feedback.screenshot);
            });
          },
          child: Text('Feedback'),
        ),
      ),
    );
  }
}
