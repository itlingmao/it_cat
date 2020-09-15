import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeButtonPage extends CatBaseWidgetPage {

  @override
  CatBaseWidgetPageState<CatBaseWidgetPage> getState()  => _HomeButtonPageState();
}

class _HomeButtonPageState extends CatBaseWidgetPageState<HomeButtonPage> {
  @override
  Widget build(BuildContext context) {
    return _addScaffoldView();
  }
  Widget _addScaffoldView() => Scaffold(
    appBar: AppBar(
      title: Text('button'),
      actions: <Widget>[
        PopupMenuButton(onSelected: (value){},itemBuilder: (BuildContext context){
            List title = ['早晨','中午','夜晚',];
            return title.map((e) => PopupMenuItem(
                child: Text(e),
                value: e,
              )
            ).toList();
          },
        ),
      ],
    ),
    body: _bodyView(),
  );

  Widget _bodyView() => Container(
    padding: EdgeInsets.only(left: 6,right: 6,top: 6),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: FlatButton(child: Text('我就是觉得这个语言很有意思，',
                style: TextStyle(color: Colors.red),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 1,
              ), onPressed: (){},),
            ),
            CatButtonWidget('CatButtonWidget', colorBackground: Colors.blue, direction: CatDirection.horizontal,
              tapChanged: (){
                print('object');
              },),
            CatButtonWidget('CatButtonWidget', direction: CatDirection.horizontal, lineBorder:
              BorderRadius.circular((4),),
              tapChanged: (){
                print('object');
              },),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(child: Text('FlatButton'), onPressed: (){},),
            FlatButton(
              child: Text('FlatButton',style: TextStyle(color: Colors.white),), onPressed: (){},
              color: Colors.blue,//按钮颜色
            ),
            FlatButton(
              child: Text('FlatButton',style: TextStyle(color: Colors.white),), onPressed: (){},
              color: Colors.blue,//按钮颜色
              shape: RoundedRectangleBorder(//圆角设置
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('FB.icon')),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('FB.icon'),
              color: Colors.blue,
            ),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('FB.icon'),
              color: Colors.blue,
              shape: RoundedRectangleBorder(//圆角设置
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            OutlineButton(child: Text('Outline'),onPressed: (){},),
            OutlineButton(child: Text('Outline'),onPressed: (){},color: Colors.red,),
            OutlineButton(child: Text('Outline',style: TextStyle(color: Colors.red),),onPressed: (){},
              borderSide:  BorderSide(color: Colors.red),//线的颜色
              shape: RoundedRectangleBorder(//圆角设置
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              // color: Colors.red,//不管用
              // textColor: Colors.red,//点击背景色
              // disabledBorderColor: Colors.blue,
              // focusColor: Colors.red,//不管用
              // highlightColor: Colors.blue,//点击后背景色
              // highlightedBorderColor: Colors.red,//点击时线框颜色
              // hoverColor: Colors.red,//不管用
              // splashColor: Colors.blue,//水波纹颜色
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(child: Text('RB'), onPressed: (){},),
            RaisedButton(child: Text('RB'), onPressed: (){},color: Colors.blue,),
            RaisedButton(child: Text('RB'), onPressed: (){},color: Colors.white,
              shape: RoundedRectangleBorder(//圆角设置
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),

        RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('RaisedButton.icon')),



        IconButton(icon:Icon(Icons.add) ,onPressed: (){},),

        FloatingActionButton(child: Text('浮动'), onPressed: (){},),

        DropdownButton(
          items: _getItems(),
          hint: Text(_selectName),
          // itemHeight: 30,
          onChanged: (value){
            _selectName = value;
            setState(() {

            });
          },
        ),

        ButtonBar(
          alignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(child: Text('RaisedButton'), onPressed: (){},),
            Icon(Icons.ac_unit),
            Text("ButtonBar1"),
          ],
        ),
      ],
    )
  );

  String _selectName = '请选择';
  List<DropdownMenuItem> _getItems(){
    List items = ['北京','上海','武汉','广州','深圳','北京','上海','武汉','广州','深圳'];
    return items.map((item) => DropdownMenuItem(
      value: item,
      child: Text(item),
    )).toList();
    // items.add(DropdownMenuItem(child:Text('shanghai'),value: 'sh',));
    // items.add(DropdownMenuItem(child: Text('beijing'), value: 'bj',));
    // items.add(DropdownMenuItem(child: Text('guangzhou'), value: 'gz',));
    // items.add(DropdownMenuItem(child: Text('wuhan'), value: 'wh',));
    // items.add(DropdownMenuItem(child: Text('shenzhen'), value: 'sz',));
    // return items;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return _addScaffoldView();
  }
}
