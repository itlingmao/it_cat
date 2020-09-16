import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeListViewPage extends CatBaseWidgetPage {
  @override
  _HomeListViewPageState getState() => _HomeListViewPageState();
}

class _HomeListViewPageState extends CatBaseWidgetPageState<HomeListViewPage> {

  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }
  @override
  Widget buildWidget(BuildContext context) {
    return ListView.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: (context, index) => Divider(height: .5,color: Colors.black26,),
        itemCount: _words.length);
  }

  Widget _itemBuilder(context, index){
    //如果到了表尾
    if (_words[index] == loadingTag) {
      //不足100条，继续获取数据
      if (_words.length - 1 < 100) {
        //获取数据
        _retrieveData();
        //加载时显示loading
        return Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: CircularProgressIndicator(strokeWidth: 2.0)
          ),
        );
      } else {
        //已经加载了100条数据，不再获取数据。
        return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
        );
      }
    }
    //显示单词列表项
    return ListTile(title: Text(_words[index]));
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(_words.length - 1,
            //每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
        );
      });
    });
  }
}
