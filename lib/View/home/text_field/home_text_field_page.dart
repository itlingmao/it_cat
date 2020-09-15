import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/View/controller_page.dart';

class HomeTextFieldPage extends CatBaseWidgetPage {

  @override
  CatBaseWidgetPageState<CatBaseWidgetPage> getState() => _HomeTextFieldPageState();

}

class _HomeTextFieldPageState extends CatBaseWidgetPageState<HomeTextFieldPage> {

  @override
  void initState() {
    super.initState();
    title = 'textField';
  }
  @override
  Widget buildWidget(BuildContext context) => _addBuildWidget();

  TextEditingController _controllerPage = TextEditingController();
  Widget _addBuildWidget() {
    _controllerPage.addListener(() {
      print(_controllerPage.text);
    });
    ///添加了SingleChildScrollView防止界面超出的异常
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            // color: Colors.blue.shade100,
            child: TextField(
              controller: _controllerPage,
              decoration: InputDecoration(
                  labelText: '请输入',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
              ),
            ),
          ),
          Theme(
            data: ThemeData(primaryColor: Colors.red,hintColor: Colors.blue),
            child: TextField(
              controller: _controllerPage,
              decoration: InputDecoration(
                labelText: '请输入',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          TextField(controller: _controllerPage,),
          TextField(controller: _controllerPage,obscureText: true,),//密码
          TextField(
            controller: _controllerPage,
            decoration: InputDecoration(
              fillColor: Colors.blue.shade100,
              filled: true,
              labelText: '请输入',
              errorText: 'error',
            ),
          ),
          TextField(
            controller: _controllerPage,
            decoration: InputDecoration(
              fillColor: Colors.blue.shade100,
              filled: true,
              labelText: '请输入',
              ///只显示一个
              errorText: 'error',//错误
              helperText: 'help',//帮助
              icon: Icon(Icons.add),
              prefixIcon: Icon(Icons.add),
              suffixText: '结尾',
            ),
          ),

        ],
      ),
    );
  }

}


