import 'package:flutter/cupertino.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/Tools/tools_cat_inherited_widget.dart';

import 'home_inherited_min_page.dart';

class HomeInheritedWidgetPage extends CatBaseWidgetPage {
  @override
  _HomeInheritedWidgetPageState getState() => _HomeInheritedWidgetPageState();
}

class _HomeInheritedWidgetPageState extends CatBaseWidgetPageState<HomeInheritedWidgetPage> {

  @override
  void initState() {
    super.initState();

    title = 'inheritedWidget';
  }
  @override
  Widget buildWidget(BuildContext context) {
    return HomeInheritedMinPage();
  }
}