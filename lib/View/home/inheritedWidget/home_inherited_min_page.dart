import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/Tools/tools_cat_inherited_widget.dart';

class HomeInheritedMinPage extends CatBaseWidgetPage {
  @override
  _HomeInheritedMinPageState getState() => _HomeInheritedMinPageState();
}

class _HomeInheritedMinPageState extends CatBaseWidgetPageState<HomeInheritedMinPage> {

  @override
  void initState() {
    super.initState();
    isBuild = true;
  }
  @override
  Widget buildWidget(BuildContext context) {
    CatShareData catShareData = CatInheritedWidget.of(context).data;
    return Container(
      child: Column(
        children: <Widget>[
          Text('${' '+catShareData.color +'，'+ catShareData.login + '，'+catShareData.userId}'),
          FlatButton(child: Text('1'),onPressed: (){setState(() {
            catShareData.color = '白色';
            catShareData.login = '登录中1';
            catShareData.userId = '11';
          });},),
          FlatButton(child: Text('2'),onPressed: (){setState(() {
            catShareData.color = '青色';
            catShareData.login = '登录中2';
            catShareData.userId = '12';
          });},),
          FlatButton(child: Text('3'),onPressed: (){setState(() {
            catShareData.color = '绿色';
            catShareData.login = '登出';
            catShareData.userId = '13';
          });},),
          FlatButton(child: Text('4'),onPressed: (){setState(() {
            catShareData.color = '红色';
            catShareData.login = '登录';
            catShareData.userId = '14';
          });},),
        ],
      ),
    );
  }
}