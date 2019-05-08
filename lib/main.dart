import 'package:flutter/material.dart';
import 'package:flutter_app/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final barList = ['TADAY', '日常习惯', '更多'];
  var _title = 'TADAY';
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
      controller: _pageController,
      children: <Widget>[
        new HomePage(),
        new AllPage(),
        new MorePage()
      ],
      onPageChanged: (index) {
        _currentPageSatus(index);
      },
    );

    return Scaffold(
        appBar: AppBar(
          //导航栏
          title: Text(_title),
          centerTitle: true,
          actions: <Widget>[
            //导航栏右侧菜单
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
          ],
        ),
//      drawer: new MyDrawer(), //抽屉
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: Text(barList[0])),
            BottomNavigationBarItem(
                icon: Icon(Icons.all_inclusive), title: Text(barList[1])),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), title: Text(barList[2])),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),

        floatingActionButton: FloatingActionButton(
          //悬浮按钮
            child: Icon(Icons.add),
            onPressed: _onAdd),
        body: pageView
    );
  }

  void _onItemTapped(int index) {
    _currentPageSatus(index);
    _pageController.jumpToPage(index);
  }
  void _currentPageSatus(int index){
    setState(() {
      _selectedIndex = index;
      _title = barList[index];
    });
  }

  void _onAdd() {}
}



class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('all');
  }
}

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('more');
  }
}