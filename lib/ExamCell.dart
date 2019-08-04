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
      color: Color.fromRGBO(255, 255, 255, 0),
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child:Container(
        height: 55,
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Color.fromRGBO(250,250,250,1),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 3,
              height: 55,
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(255,207,0,1), Color.fromRGBO(255, 162, 0, 1),]
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                )
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'PingFangSC-Regular',
                    color: Color.fromRGBO(76,76,76,1),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            _rightWidget(),
          ],
        ),
      ),
    );
  }

  Widget _rightWidget(){
    if(widget.done){
      return Container(
        width: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.score,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                fontFamily: 'PingFangSC-Medium',
                color: Color.fromRGBO(253,111,82,1),
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              '最高得分',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                fontFamily: 'PingFangSC-Regular',
                color: Color.fromRGBO(194,194,194,1),
                decoration: TextDecoration.none,
              ),

            )
          ],
        ),
      );
    } else {
      return Container(
          width: 55,
          height: 30,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: new Border.all(width: 0.5, color: Color.fromRGBO(253,111,82,1)),
            borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
          ),
          child: Text(
            '去练习',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13,
                fontFamily: 'PingFangSC-Regular',
                color: Color.fromRGBO(253,111,82,1),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                height:1.4
            ),
          ),
        );
    }
  }
}