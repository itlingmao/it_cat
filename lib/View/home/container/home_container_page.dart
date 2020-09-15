import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeContainerPage extends CatBaseWidgetPage {
  @override
  _HomeContainerPageState getState() => _HomeContainerPageState();
}

class _HomeContainerPageState extends CatBaseWidgetPageState<HomeContainerPage> {

  @override
  void initState() {
    super.initState();
    title = 'Container';
  }
  @override
  Widget buildWidget(BuildContext context) {
    double all = 100;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: all,
            height: all,
            margin: EdgeInsets.only(top: 1),
            padding: EdgeInsets.all(5),
            alignment: Alignment(1,0),
            child: Text('Container+all'),
          ),
          Container(
            color: Colors.red,
            width: all,
            height: all,
            child: Text('Container'),
            foregroundDecoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, .2),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(left: 30),
            padding: const EdgeInsets.all(30.0),
            alignment: Alignment(1, 0),
            child: Text('text'),
            transform: Matrix4.skew(0.1, 0.1),
            decoration: new BoxDecoration(
                color: Colors.red,
                border: Border.all(
                    color: Colors.blue,
                    width: 2,
                    style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(5, 5))]
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Container(
              width: all,
              height: all,
              color: Colors.blue,
            ),
          ),
          Center(
            widthFactor: 1,
            heightFactor: 0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Text('text'),
            ),
          ),
          Align(alignment: Alignment.center,
            ///宽高比例
            widthFactor: 3,
            heightFactor: 1,
            child: Container(width: all,height: all,color: Colors.blue,),
          ),
          ///自适应的布局，根据内容
          FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/images/wzd.jpg',width: 100,height: 100,),
          ),
          ///设置占用的宽高比
          AspectRatio(
            aspectRatio: 7/1,
            child: Container(
              width: all,
              height: all,
              color: Colors.red,
            ),
          ),
          ///用来约束子控件的大小
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 80,
              maxHeight: 100,
              minWidth: 10,
              maxWidth: 20,
            ),
            child: Container(
              width: 100,
              height: 200,
              color: Colors.red,
            ),
          )

        ],
      ),
    );
  }
}
