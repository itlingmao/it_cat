import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/Tools/tools_global_page.dart';

class HomeStreamBuilderPage extends CatBaseWidgetPage {
  @override
  _HomeStreamBuilderPageState getState() => _HomeStreamBuilderPageState();
}

class _HomeStreamBuilderPageState extends CatBaseWidgetPageState<HomeStreamBuilderPage> {
  
  @override
  void initState() {
    super.initState();
    title = 'stream';
  }
  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 2), (i) {
      return i;
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return StreamBuilder(
        stream: counter(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          if(snapshot.connectionState == ConnectionState.waiting){
            // showOptimizeLoadingDialog();
          }else if (snapshot.connectionState == ConnectionState.active){
            // Navigator.of(context).pop(true);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      semanticsLabel: 'semanticsLabel',
                      semanticsValue: 'semanticsValue',
                    ),
                    SizedBox(height: 6,),
                    Text('拼命加载中...'
                    ,style: TextStyle(color: CatGlobal.themes[4]),),
                  ],
                ),
              );
            case ConnectionState.active:
              return Text('active: ${snapshot.data}');
            case ConnectionState.done:
              return Text('Stream已关闭');
          }
          return CircularProgressIndicator(
            semanticsLabel: 'semanticsLabel',
            semanticsValue: 'semanticsValue',
          ); // unreachable
        }
    );
  }

  void showOptimizeLoadingDialog(){
    showDialog(
      context: context,
      barrierDismissible: true, //点击遮罩不关闭对话框
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}