import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  messagePrint() {
    print('Function Called');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                top: true,
                bottom: true,
                left: true,
                right: true,
                child: Center(
                  child: Text(
                    'Example of SafeArea Widget in Flutter',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))));
  }
}