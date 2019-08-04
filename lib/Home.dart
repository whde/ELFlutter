import 'dart:convert';
import 'package:flutter/cupertino.dart';
import './CourseCell.dart';
import './CourseModel.dart';
import './ExamCell.dart';
import './ExamModel.dart';
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeSate createState() => _HomeSate();
}

class _HomeSate extends State <Home> {
  void _history(){

  }
  void _allCourse(){

  }

  void _jdcs(){

  }
  void _zxxl(){

  }
  void _tbxl(){
    showCupertinoDialog(context: context, builder: (BuildContext contex){
      return CupertinoAlertDialog(
        title: Text('提示'),
        content: Text('同步训练'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("取消"),
            onPressed: () {
              print("取消");
            },
          ),
          CupertinoDialogAction(
            child: Text("确定"),
            onPressed: () {
              print("确定");
            },
          ),
        ],
      );
    });
  }

  List<CourseModel> courseData = [];
  List<ExamModel> newData = [];
  @override
  void initState() {
    super.initState();
    Future<String> loadString = DefaultAssetBundle.of(context).loadString("data/course_home.json");
    loadString.then((String value){
      setState((){
        List parsedJson = json.decode(value);
        for(var element in parsedJson){
          courseData.add(CourseModel.fromJson(element));
        }
      });
    });
    Future<String> loadString1 = DefaultAssetBundle.of(context).loadString("data/exam_home.json");
    loadString1.then((String value){
      setState((){
        List parsedJson = json.decode(value);
        for(var element in parsedJson){
          newData.add(ExamModel.fromJson(element));
        }
      });
    });
  }

  Widget getCourseRow(int i) {
    CourseModel model = courseData[i];
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: CourseCell(
          cover: model.url,
          name: model.name,
          progress: model.progress,
          avgScore: model.avg,
          finished: int.parse(model.progress)>1?true:false,
        ),
      ),
      onTap: () {
        setState(() {
          print('row $i');
        });
      },
    );
  }
  Widget getExamRow(int i) {
    ExamModel model = newData[i];

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ExamCell(
          name: model.name,
          score: model.score,
          done: model.done,
        ),
      ),
      onTap: () {
        setState(() {
          print('row $i');
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('首页'),
      ),
      child: SafeArea(
        child: Container(
          color: Color.fromRGBO(236, 236, 236, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Color.fromRGBO(236, 236, 236, 0),
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    _Header(
                      icon: 'images/home_fzks.png',
                      title: '仿真考试',
                      rightTitle: '练习记录',
                      onRightPressed: _history,
                    ),
                    Container(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _Category(icon: 'images/home_jdcs.png', title: '阶段测试', onPressed: _jdcs),
                          _Category(icon: 'images/home_zxxl.png', title: '专项训练', onPressed: _zxxl),
                          _Category(icon: 'images/home_tbxl.png', title: '同步训练', onPressed: _tbxl),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromRGBO(236, 236, 236, 0),
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    _Header(
                      icon: 'images/home_wdkc.png',
                      title: '我的课程',
                      rightTitle: '所有课程',
                      onRightPressed: _allCourse,
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        maxHeight: 200,
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      child: ListView.builder(
                        itemCount: courseData.length,
                        itemBuilder: (BuildContext context, int position) {
                          return getCourseRow(position);
                        },
                      )
                      ,
                    )
                  ],
                ),
              ),
              Container(
                color: Color.fromRGBO(236, 236, 236, 0),
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    _Header(
                      icon: 'images/home_zxsj.png',
                      title: '最新资源',
                    ),
                    Container(
                      height: 100,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minHeight: 200,
                      ),
                      child: ListView.builder(
                        itemCount: newData.length,
                        itemBuilder: (BuildContext context, int position) {
                          return getExamRow(position);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class _Header extends StatefulWidget {
  _Header({Key key, this.icon, this.title, this.rightTitle, this.onRightPressed}) : super(key: key);
  final String icon;
  final String title;
  final String rightTitle;
  final VoidCallback onRightPressed;
  @override
  _HeaderSate createState() => _HeaderSate();
}

class _HeaderSate extends State <_Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        padding:EdgeInsets.fromLTRB(20, 0, 0, 0),
        height: 44,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(widget.icon),
              padding: EdgeInsets.only(right: 13),
            ),
            Expanded(
              child:Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(48,57,67,1),
                  fontFamily:'PingFangSC-Medium',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 100,
              child: widget.rightTitle!=null? CupertinoButton(
                onPressed: widget.onRightPressed,
                padding: EdgeInsets.zero,
                child: Text(
                  widget.rightTitle,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(52,73,94,1),
                    fontFamily:'PingFangSC-Regular',
                    decoration: TextDecoration.none,
                  ),
                ),
              ):null,
            ),

          ],
        )
    );
  }
}

class _Category extends StatefulWidget {
  _Category({Key key, this.icon, this.title, this.onPressed}) : super(key: key);
  final String icon;
  final String title;
  final VoidCallback onPressed;
  @override
  _CategorySate createState() => _CategorySate();
}

class _CategorySate extends State <_Category> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.icon),
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(48,57,67,0.6),
                fontFamily:'PingFangSC-Regular',
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
