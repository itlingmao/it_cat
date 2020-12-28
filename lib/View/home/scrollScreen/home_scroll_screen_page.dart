import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/View/home/alert_dialog/home_alert_dialog_page.dart';
import 'package:it_cat/View/home/bar/fade_app_bar_page.dart';
import 'package:it_cat/View/home/button/home_button_page.dart';

class HomeScrollScreenPage extends CatBaseWidgetPage {
  @override
  _HomeScrollScreenPageState getState() => _HomeScrollScreenPageState();
}

class _HomeScrollScreenPageState extends CatBaseWidgetPageState<HomeScrollScreenPage> {

  @override
  void initState() {
    super.initState();
    title = '关联滚动';
  }

  @override
  Widget buildWidget(BuildContext context) {
    return ToolsScrollScreen(
      [
        ToolsScrollScreenData('今天', HomeAlertDialogPage()),
        ToolsScrollScreenData('今天1', HomeButtonPage()),
        ToolsScrollScreenData('今天2', Container()),
        ToolsScrollScreenData('今天3', Container()),
        ToolsScrollScreenData('今天4', Container()),
        ToolsScrollScreenData('今天5', Container()),
      ],
    );
  }

}
class ToolsScrollScreenData {
  final String title;
  final Widget screenController;

  ToolsScrollScreenData(this.title, this.screenController);
}

class ToolsScrollScreen extends StatefulWidget {

  final List<ToolsScrollScreenData> screenDataList;

  const ToolsScrollScreen(this.screenDataList, {Key key, }) : super(key: key);

  @override
  _ToolsScrollScreenState createState() => _ToolsScrollScreenState();
}

class _ToolsScrollScreenState extends State<ToolsScrollScreen> {

  PageController _currentContentView = PageController();
  ScrollController _currentListView = ScrollController();
  int _selectedIndex = 0;
  double _titleWidth = 100;
  List _listName = [
    '张三','张三','张三','张三','张三','张三','张三','张三','张三',
  ];

  List _listColor = [
    Colors.red,
    Colors.brown,
    Colors.blue,
    Colors.red,
    Colors.amber,
    Colors.deepPurpleAccent,
    Colors.teal,
    Colors.blueGrey,
    Colors.yellowAccent,
  ];

  @override
  Widget build(BuildContext context) {
    if(widget.screenDataList != null && widget.screenDataList.length <=4){
      _titleWidth = MediaQuery.of(context).size.width / widget.screenDataList.length;
    }
    return _doubleController();
  }


  Widget _doubleController(){
    double heightBL = MediaQuery.of(context).size.height/ 50;
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(flex: 1, child: Container(child: _headerView())),
          Expanded(flex: heightBL.toInt() - 1, child: Container(child: _pageView())),
        ],
      ),
    );
  }

  Widget _headerView() {
    int count = widget.screenDataList != null ? widget.screenDataList.length : _listName.length;
    return ListView.builder(
        itemCount: count,
        scrollDirection: Axis.horizontal,
        controller: _currentListView,
        itemBuilder: (BuildContext context, int index){
          //隐藏inkwell的水波纹
          //给inkwell加一个有颜色的空间水波纹就没了
          return InkWell(child: Container(color: Colors.white,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(alignment: Alignment.bottomCenter, color: _selectedIndex == index ? Colors.white : Colors.white, height: 2,width: 80,),
                Container(alignment: Alignment.center,width: _titleWidth,
                    child: Text(widget.screenDataList != null ? widget.screenDataList[index].title : _listName[index],
                  style: TextStyle(fontSize: _selectedIndex == index ? 18 : 14),
                ),
                    color: Colors.white),
                Container(alignment: Alignment.bottomCenter, color: _selectedIndex == index ? Colors.red : Colors.white, height: 2,width: _titleWidth - 20,)
              ],
            ),
          ),onTap: (){
            _selectedIndex = index;
            _currentContentView.jumpToPage(_selectedIndex);
          },
          );
        });
  }

  Widget _pageView() {
    int count = widget.screenDataList != null ? widget.screenDataList.length : _listColor.length;
    return Container(
      child: PageView.builder(controller: _currentContentView,
        itemCount: count,
        itemBuilder: (BuildContext context, int index){
          return widget.screenDataList != null
              ? widget.screenDataList[index].screenController
              : Container(
                color: _listColor[index],
                child: Text(index.toString()),
              );
        },
        onPageChanged: (index){
          setState(() {
            _selectedIndex = index;
            if(index >= 1 && count>5){
              if(index < count - 2){
                double width = MediaQuery.of(context).size.width / (MediaQuery.of(context).size.width / _titleWidth);
                _currentListView.animateTo((index-1) * width, duration: new Duration(seconds: 1), curve: Curves.ease);
              }
            }
          });
        },
      ),
    );
  }
}


