import 'dart:convert';
import 'package:flutter/cupertino.dart';
import './ExamCell.dart';
import './ExamModel.dart';
class ExamList extends StatefulWidget {
  ExamList({Key key ,this.title}) : super(key: key);

  final String title;
  @override
  _ExamListSate createState() => _ExamListSate();
}

class _ExamListSate extends State <ExamList> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: SafeArea(child: ListView.builder(
          itemCount: newData.length,
          itemBuilder:(BuildContext context, int index){
            return _getExamRow(index);
          }
      )),
    );
  }
  List<ExamModel> newData = [];
  @override
  void initState() {
    super.initState();
    Future<String> loadString1 = DefaultAssetBundle.of(context).loadString("data/exam.json");
    loadString1.then((String value){
      setState((){
        List parsedJson = json.decode(value);
        for(var element in parsedJson){
          newData.add(ExamModel.fromJson(element));
        }
      });
    });
  }

  Widget _getExamRow(int i) {
    ExamModel model = newData[i];
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: ExamCell(
          name: model.name,
          score: model.score,
          done: model.done,
        ),
      ),
      onTap: () {
        print('row $i');
      },
    );
  }
}