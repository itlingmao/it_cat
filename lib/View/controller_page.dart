import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/View/home/home_controller_page.dart';

import 'find/find_controller_page.dart';
import 'mine/mine_controller_page.dart';

class ControllerPage extends CatBaseWidgetPage {
  @override
  _ControllerPageState getState() => _ControllerPageState();

}

class _ControllerPageState extends CatBaseWidgetPageState<ControllerPage> {


  var _appBarTitles = ['首页', '发现', '我的'];

  int _tabIndex = 0;

   List<StatefulWidget> _pageList = [
     HomeControllerPage('首页'),
     FindControllerPage(),
     MineControllerPage(),
   ];

   @override
  void initState() {
    super.initState();
    title = '首页';
    isBuild = true;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_tabIndex]),
      ),
      body: _pageList[_tabIndex],
      bottomNavigationBar: _bottomView(),
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
