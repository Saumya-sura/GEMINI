import 'package:flutter/material.dart';
import 'package:googleio/drawer.dart';

class Splash  extends StatelessWidget {
  const Splash ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Google IO'),
      ),
      drawer: AppDrawer(),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Google IO', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            //Image.asset()
          ],
        ),
      ),
    );
    
  }
}