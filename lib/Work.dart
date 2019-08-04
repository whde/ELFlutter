import 'package:flutter/material.dart';
class Work extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Center(
          child: Text('作业'),
        ),
      ),
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
