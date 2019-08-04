import 'package:flutter/cupertino.dart';

class ExamCell extends StatefulWidget {
  ExamCell({
    Key key,
    this.name,
    this.score,
    this.done,
  }) : super(key:key);
  final String name;
  final String score;
  final bool done;
  @override
  _ExamCellState createState() => _ExamCellState();
}
class _ExamCellState extends State <ExamCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      child:Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        color: Color.fromRGBO(250,250,250,1),
        height: 55,
        child: Row(
          children: <Widget>[
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'PingFangSC-Regular',
                color: Color.fromRGBO(76,76,76,1),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}