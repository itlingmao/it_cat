import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeGridViewPage extends CatBaseWidgetPage {
  @override
  _HomeGridViewPageState getState() => _HomeGridViewPageState();
}

class _HomeGridViewPageState extends CatBaseWidgetPageState<HomeGridViewPage> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, //每行三列
            childAspectRatio: 1.0, //显示区域宽高相等,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,

        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Container(
            color: Colors.blue,
              child: Icon(_icons[index]));
        }
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
