import 'package:flutter/cupertino.dart';
import './Home.dart';
import './Work.dart';
import './Analyse.dart';
import './Me.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabPages();
  }
}

class TabPages extends StatefulWidget{
  TabPages({Key key}) : super(key: key);

  @override
  _TabPagesState createState() => _TabPagesState();

}

class _TabPagesState extends State <TabPages> {
  var _pageList = [
    new Home(),
    new Work(),
    new Analyse(),
    new Me(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color.fromRGBO(254,91,44,1),
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Image.asset('images/tab_icon_practice_disabled.png'),
            title: Text('学习'),
            activeIcon: Image.asset('images/tab_icon_practice.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/tab_icon_work_disabled.png'),
            title: Text('作业'),
            activeIcon: Image.asset('images/tab_icon_work.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/tab_icon_analyse_disabled.png'),
            title: Text('学情分析'),
            activeIcon: Image.asset('images/tab_icon_analyse.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/tab_icon_me_disabled.png'),
            title: Text('我的'),
            activeIcon: Image.asset('images/tab_icon_me.png'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return _pageList[index];
      },
    );
  }
}
