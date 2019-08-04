import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseCell extends StatefulWidget {
  CourseCell({
    Key key,
    this.cover,
    this.name,
    this.progress='0',
    this.avgScore='0',
    this.finished=false,
  }) : super(key:key);

  final String cover;
  final String name;
  final String progress;
  final String avgScore;
  final bool finished;
  @override
  _CourseCellState createState() => _CourseCellState();
}
class _CourseCellState extends State <CourseCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 42,
            height: 53,
            color: Color.fromRGBO(236, 236, 236, 1),
            child: Image.network(widget.cover),
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'PingFangSC-Medium',
                        color: Color.fromRGBO(48,57,67,1),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3, bottom: 3),
                      child: Text(
                        '已完成'+widget.progress+'%  平均分'+widget.avgScore+'分',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'PingFangSC-Regular',
                          color: Color.fromRGBO(48,57,67,0.6),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 2,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(1)),
                            color: Color.fromRGBO(254, 99, 39, 0.1),
                          ),
                        ),
                        Container(
                          width: double.parse(widget.progress)/100*200,
                          height: 2,
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color.fromRGBO(255,207,0,1), Color.fromRGBO(255, 162, 0, 1),]
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(1)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}