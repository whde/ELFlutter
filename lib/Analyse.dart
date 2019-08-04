import 'package:flutter/material.dart';
class Analyse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Center(
          child: Text('学情分析'),
        ),
      ),
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
