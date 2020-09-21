import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/Tools/tools_cat_inherited_widget.dart';
import 'package:it_cat/View/home/home_controller_page.dart';

import 'find/find_controller_page.dart';
import 'mine/mine_controller_page.dart';
 
class ControllerPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ControllerPageState();


}

class _ControllerPageState extends State<ControllerPage> {


  var _appBarTitles = ['首页', '发现', '我的'];

  int _tabIndex = 0;

  Color _themeColor = Colors.teal; //当前路由主题色

   List<StatefulWidget> _pageList = [
     HomeControllerPage(),
     FindControllerPage(),
     MineControllerPage(),
   ];

   List<ThemeData> _listTheme = [
     ThemeData(
         primarySwatch: Colors.red, //用于导航栏、FloatingActionButton的背景色等
         iconTheme: IconThemeData(color: Colors.red) //用于Icon颜色
     ),
     ThemeData(
         primarySwatch: Colors.teal, //用于导航栏、FloatingActionButton的背景色等
         iconTheme: IconThemeData(color: Colors.teal) //用于Icon颜色
     ),
     ThemeData(
         primarySwatch: Colors.blue, //用于导航栏、FloatingActionButton的背景色等
         iconTheme: IconThemeData(color: Colors.blue) //用于Icon颜色
     ),
   ];

   int _indexTheme = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _listTheme[_indexTheme],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitles[_tabIndex]),
          actions: <Widget>[
            PopupMenuButton(onSelected: (value){
              if(value == '红色'){
                _indexTheme = 0;
              }else if(value == '绿色'){
                _indexTheme = 1;
              }else if(value == '蓝色'){
                _indexTheme = 2;
              }
                setState(() {});
              },itemBuilder: (BuildContext context){
                  List title = ['红色','绿色','蓝色',];
                  return title.map((e) => PopupMenuItem(
                      child: Text(e),
                      value: e,
                    )
                  ).toList();
                },
            ),
          ],
        ),
        body: _pageList[_tabIndex],
        bottomNavigationBar: _bottomView(),
      ),
    );
  }
  Widget _bottomView(){
    // double width = (MediaQuery.of(context).size / 4) as double;
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(_appBarTitles[0])),
        BottomNavigationBarItem(icon: Icon(Icons.find_replace), title: Text(_appBarTitles[1])),
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt), title: Text(_appBarTitles[2])),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _tabIndex,
      iconSize: 24,
      onTap: (index){
        setState(() {
          _tabIndex = index;
        });
      },
    );
  }

  Widget _bottomItem(index){

    return SizedBox(
      height: 49,
      child: Container(
        child: FlatButton(child: Text(_appBarTitles[_tabIndex], style: TextStyle(),textAlign: TextAlign.center,)
            ,onPressed: (){

          },
        ),
      ),
    );
  }
}

// class ControllerPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('x'),
//       ),
//       body: Container(
//         child: Text('xx'),
//       ),
//     );
//   }
// }
