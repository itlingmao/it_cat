import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeTextPage extends CatBaseWidgetPage {
  @override
  CatBaseWidgetPageState<CatBaseWidgetPage> getState() => _HomeTextPageState();

}

class _HomeTextPageState extends CatBaseWidgetPageState<HomeTextPage> {

  @override
  void initState() {
    super.initState();
    title = 'Text';
  }
  @override
  Widget buildWidget(BuildContext context) => _appPageWidget();


  Widget _appPageWidget(){

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text('xx',style: TextStyle(color: Colors.red),),

          Text('xx',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),),

          Text('xx'),

          Text('xx',style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w800,),),

          Text('xx',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 18),),

          Text('我就是觉得这个语言很有意思，就是想要研究他，研究他使我快乐',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
            style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 18),),


          ///1.在Row中处理文字溢出的时候，没有成功，需要做其他设置
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1),
                        // color: Colors.grey
                      ),
                      child: Text('我就是觉得这个语言很有意思，',style: TextStyle(color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                      ),
                    ),

                    Text('xx'),

                    Text('xx',style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),


              Expanded(///3.同时添加了Expanded两个文字都会处理溢出
                flex: 1,
                child: Text('就是想要研究他，研究他使我快乐',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                ),
              ),

              CatTextWidget('我就是觉得这个语言很有意思，就是想要研究他，研究他使我快乐'),
            ],
          ),
          CatTextWidget('我就是觉得这个语言很有意思，就是想要研究他，研究他使我快乐'),
          Expanded(
            flex: 1,
            child: Text('我就是觉得这个语言很有意思，就是想要研究他，研究他使我快乐',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 1,
              style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 18),),
          ),

        ],
      ),
    );
  }


}



