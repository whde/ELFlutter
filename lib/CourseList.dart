import 'dart:convert';
import 'package:flutter/cupertino.dart';
import './CourseCell.dart';
import './CourseModel.dart';
class CourseList extends StatefulWidget {
  CourseList({Key key }) : super(key: key);
  @override
  _CourseListSate createState() => _CourseListSate();
}

class _CourseListSate extends State <CourseList> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      navigationBar: CupertinoNavigationBar(
        middle: Text('所有课程'),
      ),
      child: SafeArea(child: ListView.builder(
          itemCount: data.length,
          itemBuilder:(BuildContext context, int index){
            return _getRow(index);
          }
      )),
    );
  }
  List<CourseModel> data = [];
  @override
  void initState() {
    super.initState();
    Future<String> loadString1 = DefaultAssetBundle.of(context).loadString("data/course.json");
    loadString1.then((String value){
      setState((){
        List parsedJson = json.decode(value);
        for(var element in parsedJson){
          data.add(CourseModel.fromJson(element));
        }
      });
    });
  }

  Widget _getRow(int i) {
    CourseModel model = data[i];
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: CourseCell(
          cover: model.url,
          name: model.name,
          progress: model.progress,
          avgScore: model.avg,
          finished: int.parse(model.progress) > 1 ? true : false,
        ),
      ),
      onTap: () {
        print('row $i');
      },
    );
  }
}