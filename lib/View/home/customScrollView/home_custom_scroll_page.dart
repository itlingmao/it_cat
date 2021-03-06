import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeCustomScrollPage extends CatBaseWidgetPage {
  @override
  _HomeCustomScrollPageState getState() => _HomeCustomScrollPageState();
}

class _HomeCustomScrollPageState extends CatBaseWidgetPageState<HomeCustomScrollPage> {

  @override
  void initState() {
    super.initState();
    isBuild = true;
  }

  @override
  Widget buildWidget(BuildContext context) {
    String image = "assets/images/ic_hot_spots.png";
    // String image = "assets/images/wz.jpg";
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
              Navigator.pop(context);
            },),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('customScrollView'),
              background: Image.asset(
                image , fit: BoxFit.cover,),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 5 //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}
