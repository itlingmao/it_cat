import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class MineControllerPage extends CatBaseWidgetPage {
  @override
  _MineControllerPageState getState() => _MineControllerPageState();
}

class _MineControllerPageState extends CatBaseWidgetPageState<MineControllerPage> {

  @override
  void initState() {
    super.initState();
    title = '我的';
    isBuild = true;
  }
  @override
  Widget buildWidget(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(alignment: Alignment.center,
                child: Text('本产品为Cat开发',style: TextStyle(fontWeight: FontWeight.w800),)),
            SizedBox(height: 14,),
            Text('项目已在GitHub上面开源',style: TextStyle(fontWeight: FontWeight.w300),),
            Row(
              children: <Widget>[
                Text('https://github.com/itlingmao/it_cat.git',style: TextStyle(fontWeight: FontWeight.w300),),
                SizedBox(width: 8,),
                OutlineButton(child: Text('复制'),onPressed: (){
                  ClipboardData data = ClipboardData(text: 'https://github.com/itlingmao/it_cat.git');
                  Clipboard.setData(data);
                },),

              ],
            ),
            SizedBox(height: 2,),
            Text('项目内容来自Flutter中文社区',style: TextStyle(fontWeight: FontWeight.w300),),
          ],
        ),
      ),
    );
  }
}

@immutable
class ClipboardData {
  /// Creates data for the system clipboard.
  const ClipboardData({this.text});

  /// Plain text variant of this clipboard data.
  final String text;
}

class Clipboard {
  Clipboard._();


  static const String kTextPlain = 'text/plain';

  /// Stores the given clipboard data on the clipboard.
  ///将ClipboardData中的内容复制的粘贴板
  static Future<void> setData(ClipboardData data) async {
    await SystemChannels.platform.invokeMethod<void>(
      'Clipboard.setData',
      <String, dynamic>{
        'text': data.text,
      },
    );
  }
}
