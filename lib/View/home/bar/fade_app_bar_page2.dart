import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeAppBarWidget2 extends StatefulWidget {
  FadeAppBarWidget2({Key key, this.title = 'Flutter Demo Home Page'}) : super(key: key);
  final String title;

  @override
  _FadeAppBarWidget2State createState() => _FadeAppBarWidget2State();
}

class _FadeAppBarWidget2State extends State<FadeAppBarWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.zcool.cn/community/0372d195ac1cd55a8012062e3b16810.jpg'),
              fit: BoxFit.cover,
            )),
        child: Scaffold(
            backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
            appBar: AppBar(
              backgroundColor: Colors.transparent, //把appbar的背景色改成透明
              elevation: 0,//appbar的阴影
              title: Text(widget.title),
            ),
            body: Center(
              child: Text('Hello World'),
            )));
  }
}
