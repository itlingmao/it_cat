import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/Tools/tools_cat_inherited_widget.dart';

class FindControllerPage extends CatBaseWidgetPage {
  @override
  _FindControllerPageState getState() => _FindControllerPageState();
}

class _FindControllerPageState extends CatBaseWidgetPageState<FindControllerPage> {
  // http://api.bjxlxd.com/api/registerAgreement
  @override
  void initState() {
    super.initState();
    title = '发现';
    isBuild = true;
  }
  @override
  Widget buildWidget(BuildContext context) {
    return Material(
      child: Container(
        child: Text('用来写组合控件的地方！'),
      ),
    );
  }
}
