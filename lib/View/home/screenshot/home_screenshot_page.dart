import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeScreenshotPage extends CatBaseWidgetPage {
  @override
  _HomeScreenshotPageState getState() => _HomeScreenshotPageState();
}

class _HomeScreenshotPageState extends CatBaseWidgetPageState<HomeScreenshotPage> {
  List<Uint8List> images = List();

  Future<Uint8List> _capturePng() async {
    //TODO 进行截图
    try {
      RenderRepaintBoundary boundary =
      rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      // final result = await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes));
      // if(result != null && result != ""){
      //   showToast('成功保存到相册');
      //   String str = Uri.decodeComponent(result);
      // }else{
      //   //File: '/data/user/0/company.xinglong.com.conferenceplatform/cache/二维码截图.png'
      //   showToast('保存失败');
      // }
      images.add(pngBytes);
      setState(() {

      });
      return pngBytes;//这个对象就是图片数据
    } catch (e) {
      print(e);
    }
    return null;
  }
  GlobalKey rootWidgetKey = GlobalKey();

  Widget _addPage(){
    return RepaintBoundary(
      key: rootWidgetKey,
      child:Column(
        children: <Widget>[
          Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603943537980&di=2421033eb6e23e8da2da120a506e6304&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180103%2F87c6ca450dfb4f1bb13ed453846baea4.gif",
            width: 300,
            height: 300,
          ),
          FlatButton(
            onPressed: () {
              this._capturePng();
            },
            child: Text("全屏截图"),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Image.memory(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
            ),
          ),

        ],
      ),
    );

  }
  @override
  Widget buildWidget(BuildContext context) {
    return _addPage();
  }
}