import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeWrapPage extends CatBaseWidgetPage {
  @override
  _HomeWrapPageState getState() => _HomeWrapPageState();
}

class _HomeWrapPageState extends CatBaseWidgetPageState<HomeWrapPage> {

  List _list = [
    {'name':'极客','title':'A'},
    {'name':'极客空间','title':'A'},
    {'name':'极客空间','title':'A'},
    {'name':'极客空间','title':'A'},
    {'name':'极客空间','title':'A'},
    {'name':'极客空间','title':'A'},
    {'name':'需要一个空间','title':'B'},
    {'name':'一个能提供给他们的空间','title':'C'},
    {'name':'要有足够的吸引力','title':'D'},
    {'name':'有什么可以吸引人呢','title':'E'},
    {'name':'表演、电视节目、还是什么','title':'F'},
    {'name':'空间利用','title':'G'},
  ];
  List<Widget> _addList(){
    List<Widget> wrapList = [];
    _list.forEach((element) {
      wrapList.add(
          Chip(
            avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text(element['title'])),
            label: new Text(element['name']),
          )
        // Container(
        //   color: Colors.red,
        //   child: Text(element['name']),
        // ),
        //   Text(element['name'])
      );
    });
    return wrapList;
  }

  @override
  void initState() {
    super.initState();
    title = 'Wrap、Flow';
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8),
      child: Column(
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.center, //沿主轴方向居中
            children: _addList(),
          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              new Container(width: 60.0, height:80.0, color: Colors.red,),
              new Container(width: 20.0, height:80.0, color: Colors.green,),
              new Container(width: 220.0, height:80.0, color: Colors.blue,),
              new Container(width: 20.0, height:80.0,  color: Colors.yellow,),
              new Container(width: 120.0, height:80.0, color: Colors.brown,),
              new Container(width: 20.0, height:80.0,  color: Colors.purple,),
            ],
          ),
        ],
      ),
    );
  }
}


class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,300.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}