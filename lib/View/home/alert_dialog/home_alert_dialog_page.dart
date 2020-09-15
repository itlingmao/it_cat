import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeAlertDialogPage extends CatBaseWidgetPage {
  @override
  _HomeAlertDialogPageState getState() => _HomeAlertDialogPageState();
}

class _HomeAlertDialogPageState extends CatBaseWidgetPageState<HomeAlertDialogPage> {

  RoundedRectangleBorder _border = RoundedRectangleBorder(//圆角设置
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  TextStyle _textStyle = TextStyle(color: Colors.red);
  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('系统默认弹窗',style: _textStyle,),onPressed: (){  showAlertDialog(); },),

          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('列表弹窗',style: _textStyle,),onPressed: (){  showSimpleDialog(); },),

          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('List弹窗',style: _textStyle,),onPressed: (){  showListDialog(); },),

          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('Bottom弹窗',style: _textStyle,),onPressed: (){  showBottomDialog(); },),

          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('loading弹窗',style: _textStyle,),onPressed: (){  showLoadingDialog(); },),

          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('OptimizeLoading弹窗',style: _textStyle,),onPressed: (){  showOptimizeLoadingDialog(); },),

          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('日历弹窗',style: _textStyle,),onPressed: (){  showOptimizeLoadingDialog(); },),

          OutlineButton( borderSide:  BorderSide(color: Colors.red), shape: _border,
            child: Text('OptimizeLoading弹窗',style: _textStyle,),onPressed: (){  showOptimizeLoadingDialog(); },),
        ],
      ),
    );
  }
  void showDatePicker(){

  }

  void showAlertDialog(){
    showDialog(
      context: context,
      barrierDismissible: true,//默认是true
      builder: (context){
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            FlatButton(
              child: Text("确认"),
              onPressed: () {
                // ... 执行删除操作
                Navigator.of(context).pop(true); //关闭对话框
              },
            ),
          ],
        );
      },
    );

  }

  void showSimpleDialog() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }

  }

  void showListDialog() async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  void showBottomDialog() {

    showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  void showLoadingDialog(){
    showDialog(
      context: context,
      barrierDismissible: true, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
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
        );
      },
    );
  }
//  如果我们嫌Loading框太宽，想自定义对话框宽度，这时只使用SizedBox或ConstrainedBox是不行的，原因是showDialog中已经给对话框设置了宽度限制，根据我们在第五章“尺寸限制类容器”一节中所述，我们可以使用UnconstrainedBox先抵消showDialog对宽度的限制，然后再使用SizedBox指定宽度，代码如下：
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
