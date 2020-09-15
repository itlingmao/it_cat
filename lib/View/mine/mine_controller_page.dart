import 'package:flutter/cupertino.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class MineControllerPage extends CatBaseWidgetPage {
  @override
  _MineControllerPageState getState() => _MineControllerPageState();
}

class _MineControllerPageState extends CatBaseWidgetPageState<MineControllerPage> {

  @override
  void initState() {
    super.initState();
    title = '我的';
    isBuild = true;
  }
  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      child: Text('说什么呢！'),
    );
  }
}
