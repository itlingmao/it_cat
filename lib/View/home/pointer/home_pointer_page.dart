import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomePointerPage extends CatBaseWidgetPage {
  @override
  _HomePointerPageState getState() => _HomePointerPageState();
}

class _HomePointerPageState extends CatBaseWidgetPageState<HomePointerPage> {

  //定义一个状态，保存当前指针位置
  PointerEvent _event;

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 300.0,
            height: 150.0,
            child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
          ),
          onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
          onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
          onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
        ),
        Listener(
          child: AbsorbPointer(
            child: Listener(
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
                child: Text('忽略点击'),
              ),
              onPointerDown: (event)=>print("in"),
            ),
          ),
          onPointerDown: (event)=>print("up"),
        ),
        Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.blue)),
              ),
              onPointerDown: (event) => print("down0"),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                child: Center(child: Text("左上角200*100范围内非文本区域点击")),
              ),
              onPointerDown: (event) => print("down1"),
              //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
            )
          ],
        ),
        Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(250.0, 120.0)),
              child: Center(child: Text("Box A")),
            ),
            //behavior: HitTestBehavior.opaque,
            onPointerDown: (event) => print("down A")
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    title = 'pointer';
  }
}