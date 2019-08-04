import 'package:flutter/material.dart';
import './TabScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State <LoginPage> {
  TextEditingController phoneController = TextEditingController(text: 'Whde123');
  TextEditingController passController = TextEditingController(text: 'Whde123');

  void initState() {
    super.initState();
    _checkEnable('');
  }

  double logoHeight = 200;
  void _scaleMini() {
    setState(() {
      logoHeight = 150;
    });
  }
  void _scaleMax() {
    setState(() {
      logoHeight = 200;
    });
  }

  bool enable = false;
  Color loginColor = Color.fromRGBO(236, 236, 236, 1);
  void _loginEnable(state) {
    setState(() {
      enable = state;
      if (state){
        loginColor = Color.fromRGBO(254,91,44,1);
      } else {
        loginColor = Color.fromRGBO(236, 236, 236, 1);
      }
    });
  }

  void _checkEnable(string) {
    if (phoneController.value.text.length>=6 && passController.value.text.length>=6){
      _loginEnable(true);
    } else {
      _loginEnable(false);
    }
  }

  void _onLogin() {
    if(enable) {

      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (context) => new TabScreen()
          ), (route) => route == null);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/logo01.png', width: 375, height:logoHeight, key:Key('Logo'),),
          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            height: 80,
            child: TextField(
              controller: phoneController,
              style: TextStyle(fontSize: 19,color: Color.fromRGBO(76, 76, 76, 1)),
              onTap: _scaleMini,
              onEditingComplete: _scaleMax,
              onChanged: _checkEnable,
              decoration:InputDecoration(
                  hintText: '请输入用户名',
                  prefixIcon: IconTheme(
                      data: IconThemeData(
                          color: Colors.white,
                          size: 10),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Image.asset('images/denglu01.png'),
                      )
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            height: 60,
            child:TextField(
              controller: passController,
              obscureText: true,
              style: TextStyle(fontSize: 19,color: Color.fromRGBO(76, 76, 76, 1)),
              onTap: _scaleMini,
              onEditingComplete: _scaleMax,
              onChanged: _checkEnable,
              decoration: InputDecoration(
                  hintText: '请输入密码',
                  prefixIcon: IconTheme(
                    data: IconThemeData(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        size:10.0 ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Image.asset('images/mima01.png'),
                    ),
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            width: 345,
            height: 74,
            child:RaisedButton(
              onPressed:_onLogin,
              color: loginColor,
              child: Text(
                '登  录',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PingFang-SC-Medium',
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}