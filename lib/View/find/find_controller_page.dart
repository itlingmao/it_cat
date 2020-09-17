import 'package:flutter/cupertino.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class FindControllerPage extends CatBaseWidgetPage {
  @override
  _FindControllerPageState getState() => _FindControllerPageState();
}

class _FindControllerPageState extends CatBaseWidgetPageState<FindControllerPage> {

  @override
  void initState() {
    super.initState();
    title = '发现';
    isBuild = true;
  }
  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      child: Text('用来写组合控件的地方！'),
    );
  }
}
