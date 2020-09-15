import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

enum HomePageType{
  row,
  column,
  container,
  all,
  stack,
}

class HomeContainerRowColumnPage extends CatBaseWidgetPage {

  final HomePageType pageType;

  HomeContainerRowColumnPage({this.pageType});

  @override
  CatBaseWidgetPageState<CatBaseWidgetPage> getState() => _HomeContainerRowColumnPage();
}

class _HomeContainerRowColumnPage extends CatBaseWidgetPageState<HomeContainerRowColumnPage> {

  @override
  void initState() {
    super.initState();

    if(widget.pageType == null){
      title = 'Container+Row+Column';
    }else{
      if(widget.pageType.index == 0){
        title = 'row';
      }else if(widget.pageType.index == 1){
        title = 'column';
      }else if(widget.pageType.index == 2){
        title = 'container';
      }else if(widget.pageType.index == 4){
        title = 'stack';
      }else{
        title = 'Container+Row+Column';
      }
    }
  }
  @override
  Widget buildWidget(BuildContext context) => _addPageView();

  Widget _addPageView(){
    if(widget.pageType == null){
      return _addPageAllView();
    }else{
      if(widget.pageType.index == 0){
        return _addPageRowView();
      }else if(widget.pageType.index == 1){
        return _addPageColumnView();
      }else if(widget.pageType.index == 2){
        return _addPageContainerView();
      }else if(widget.pageType.index == 4){
        return _addPageStackView();
      }else {
        return _addPageAllView();
      }
    }

  }

  Widget _addPageAllView(){
    EdgeInsets all = EdgeInsets.all(10);
    double size = 60;
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,///控制column占用大小
              children: <Widget>[

                Container(width: size,height: size,child: Text('无边距'), color: Colors.red, ),
                SizedBox(height: 6,),
                SizedBox(height: 1,child: Container(color: Colors.blue,),),
                Container(margin: all, width: size,height: size,child: Text('外边距'),
                  decoration: new BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                          color: Colors.blue,
                          width: 2,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(5, 5))]
                  ),),
                SizedBox(height: 1,child: Container(color: Colors.blue,),),
                SizedBox(height: 6,),
                Container(padding: all, width: size,height: size,child: Text('内边距'),decoration: BoxDecoration(
                  color: Colors.red,///这个颜色和父控件的颜色只能有一个
                  borderRadius: BorderRadius.circular(5.0), // 圆角边框
                ),),

                Container(color: Colors.deepOrangeAccent,
                  child: Center(
                    child: Container(color: Colors.red,width: size,height: size,child: Text('无边距'),),
                  ),
                ),
                Container(color: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Container(color: Colors.red,width: size,height: size,child: Text('无边距'),),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.green,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(color: Colors.red,width: size,height: size,child: Text('无边距'),),
                SizedBox(width: 6,child: Container(color: Colors.blue,),),
                SizedBox(height:size+20, width: 2,child: Container(color: Colors.blue,),),SizedBox(width: 6,child: Container(color: Colors.blue,),),
                Container(margin: all,color: Colors.red,width: size,height: size,child: Text('外边距'),),
                SizedBox(height:size+20, width: 2,child: Container(color: Colors.blue,),),
                SizedBox(width: 6,child: Container(color: Colors.blue,),),
                Spacer(),///可以撑开控件
                Container(padding: all, width: size,height: size,child: Text('内边距'),decoration: BoxDecoration(
                  color: Colors.red,///这个颜色和父控件的颜色只能有一个
                  borderRadius: BorderRadius.circular(5.0), // 圆角边框
                ),),
              ],),
          ),
        ],
      ),
    );
  }

  double all = 30;
  Color redColor = Colors.red;
  Color blueColor = Colors.blue;
  Widget _addPageRowView(){
    return Column(
      children: <Widget>[
        _rowItems( MainAxisAlignment.start,blueColor,CrossAxisAlignment.start),
        _rowItems( MainAxisAlignment.center,redColor,CrossAxisAlignment.center),
        _rowItems( MainAxisAlignment.end,blueColor,CrossAxisAlignment.end),
        _rowItems( MainAxisAlignment.spaceEvenly,redColor,CrossAxisAlignment.end),///会飞出去
        _rowItems( MainAxisAlignment.spaceBetween,blueColor,CrossAxisAlignment.end),
        _rowItems( MainAxisAlignment.spaceAround,redColor,CrossAxisAlignment.end),
        // _rowItems( MainAxisAlignment.start,redColor,CrossAxisAlignment.stretch),///会飞出去
        // _rowItems( MainAxisAlignment.start,blueColor,CrossAxisAlignment.baseline),///需要设置textBaseline
      ],
    );

  }

  Widget _rowItems(MainAxisAlignment mainAxisAlignment,color,CrossAxisAlignment crossAxisAlignment){
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
        Container(color: color,width: all,height: all+5,),
        Container(color: color,width: all,height: all,),
        Container(color: color,width: all,height: all+15,),
      ],
    );
  }

  Widget _addPageColumnView(){
    return Row(
      children: <Widget>[
        _columnItems( MainAxisAlignment.start,blueColor),
        _columnItems( MainAxisAlignment.center,redColor),
        _columnItems( MainAxisAlignment.end,blueColor),
        _columnItems( MainAxisAlignment.spaceEvenly,redColor),
        _columnItems( MainAxisAlignment.spaceBetween,blueColor),
        _columnItems( MainAxisAlignment.spaceAround,redColor),
      ],
    );
  }

  Widget _columnItems(MainAxisAlignment mainAxisAlignment,color){
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        Container(color: color,width: all,height: all,),
        Container(color: color,width: all,height: all,),
        Container(color: color,width: all,height: all,),
      ],
    );
  }

  Widget _addPageContainerView(){
    return Center(
      child: Container(
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
    );
  }

  Widget _addPageStackView() {
    return Stack(
      // StackFit.expand的效果优先
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height,
          color: Colors.red,
        ),
        Container(
          width: size.width-50,
          height: size.height-50,
          color: Colors.blue,
        ),
        Container(
          width: size.width-100,
          height: size.height-100,
          color: Colors.green,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 90,
                height: 90,
                color: Colors.blue,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),
            ],
          ),
        ),
        Positioned(
          top: 100.0,
          left: 0,
          right: 20,
          child: Container(
            color: Colors.blue,
            child: Text("第一个组件"),
          ),
        ),
        Positioned(
          top: 200,
          right: 100,
          child: Container(
            color: Colors.yellow,
            child: Text("第二个组件"),
          ),
        ),
        Positioned(
          left: 100.0,
          child: Container(
            color: Colors.red,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: [ //阴影
                      BoxShadow(
                          color:Colors.black54,
                          offset: Offset(2.0,2.0),
                          blurRadius: 4.0
                      )
                    ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("第三个组件", style: TextStyle(color: Colors.white),),
                )
            ),
          ),
        ),
      ],
    );
  }
}
