import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeGesturePage extends CatBaseWidgetPage {
  @override
  _HomeGesturePageState getState() => _HomeGesturePageState();
}

class _HomeGesturePageState extends CatBaseWidgetPageState<HomeGesturePage> {
  String _operation = "No Gesture detected!"; //保存事件名
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  double _width = 200.0;
  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200.0,
              height: 100.0,
              child: Text(_operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => updateText("Tap"),//点击
            onDoubleTap: () => updateText("DoubleTap"), //双击
            onLongPress: () => updateText("LongPress"), //长按
          ),
          Positioned(
            top: _top + 100,
            left: _left + 100,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e){
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          ),
          Positioned(
            top: _top,
            child: GestureDetector(
                child: CircleAvatar(child: Text("B")),
                //垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                }
            ),
          ),
          SizedBox(height: 300,),
          // GestureDetector(
          //   //指定宽度，高度自适应
          //   child: Image.asset("assets/images/ic_hot_spots.png", width: _width),
          //   onScaleUpdate: (ScaleUpdateDetails details) {
          //     setState(() {
          //       //缩放倍数在0.8到10倍之间
          //       _width=200*details.scale.clamp(.8, 10.0);
          //     });
          //   },
          // ),

        ],
      ),
    ) ;
  }
  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  @override
  void initState() {
    super.initState();
    title = 'gesture';
  }
}