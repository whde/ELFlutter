import 'package:flutter/material.dart';
class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Center(
          child: Text('我的'),
        ),
      ),
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
