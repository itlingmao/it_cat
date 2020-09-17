import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeSGridViewPage extends CatBaseWidgetPage {
  @override
  _HomeSGridViewPageState getState() => _HomeSGridViewPageState();
}

class _HomeSGridViewPageState extends CatBaseWidgetPageState<HomeSGridViewPage> {

  List<IconData> _icons = [
    Icons.ac_unit,
    Icons.airport_shuttle,
    Icons.all_inclusive,
    Icons.beach_access,
    Icons.cake,
    Icons.free_breakfast,
    Icons.ac_unit,
    Icons.airport_shuttle,
    Icons.all_inclusive,
  ];
  List<Color> _color = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.red,
  ];
  @override
  void initState() {
    super.initState();
    title = '流布局';
  }
  @override
  Widget buildWidget(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: _icons.length,
      itemBuilder: (BuildContext context, int index) => new Container(
          color: _color[index],
          child: new Center(
            child: Icon(_icons[index]),
            // new CircleAvatar(
            //   backgroundColor: Colors.white,
            //   child: new Icon(_icons[index]),
            // ),
          )),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 3 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
