import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return new MaterialApp(
      home:new Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo01.png', width: 375, height: 200,key:Key('Logo'),),
            Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
              height: 80,
              child: TextField(
                controller: phoneController,
                style: TextStyle(fontSize: 19,color: Color.fromRGBO(76, 76, 76, 1)),
                onTap: ()=>{

                },
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
                onPressed: () {
                },
                color: Color.fromRGBO(254,91,44,1),
                child: Text(
                  '登  录',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'family:PingFang-SC-Medium',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
