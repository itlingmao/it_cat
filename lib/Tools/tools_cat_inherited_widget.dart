import 'package:flutter/cupertino.dart';

class CatInheritedWidget extends InheritedWidget {

  CatInheritedWidget({
    @required this.data,
    Widget child
  }) :super(child: child);

  final CatShareData data;//需要在子树中共享的数据，保存点击次数

  @override
  bool updateShouldNotify(CatInheritedWidget oldWidget) {

    return oldWidget.data != data;
  }
  static CatInheritedWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CatInheritedWidget>();
  }
}

class CatShareData{
  String userId = '12';
  String login = '登录';
  String color = '绿色';

}