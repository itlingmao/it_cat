import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:it_cat/Tools/tools_base_page.dart';

class HomeImagePage extends CatBaseWidgetPage {

  @override
  CatBaseWidgetPageState<CatBaseWidgetPage> getState() => _HomeImagePageState();
}

class _HomeImagePageState extends CatBaseWidgetPageState<HomeImagePage> {

  @override
  Widget buildWidget(BuildContext context) => _addPageView();

  Widget _addPageView() {
    double width = MediaQuery.of(context).size.width;
    String wz = 'assets/images/wz.jpg';
    String wzd = 'assets/images/wzd.jpg';
    String urlImage = 'https://pics6.baidu.com/feed/9922720e0cf3d7ca346340aa93bcf90e6963a9fb.jpeg?token=0b9cf38f5bfa2cd40107ba622f2f6715';
    String urlImage2 = 'https://pics0.baidu.com/feed/1c950a7b02087bf4b824bce6bf49112b10dfcf13.jpeg?token=323e00a3b3ebeb9977f893411cced683';
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ///没有宽度就以图片原来大小设置
          Image.network(urlImage,width: width,fit: BoxFit.fill,
            ///color：是要混合的颜色，如果你只设置color是没有意义的。
            ///colorBlendMode:是混合模式，相当于我们如何混合。
            color: Colors.greenAccent,
            colorBlendMode: BlendMode.darken,
          ),
          Image.network(urlImage2,
            width: width,
            repeat: ImageRepeat.repeat,),
          Image.network(urlImage2,
            width: width,
            repeat: ImageRepeat.repeatX,),
          Image.network(urlImage2,
            width: width,
            repeat: ImageRepeat.repeatY,),
          Image.asset(wz),
          Image(image: AssetImage(wzd),),

        ],
      ),
    );
  }
}

// fit：
// BoxFit.fill:全图显示，图片会被拉伸，并充满父容器。
//
// BoxFit.contain:全图显示，显示原比例，可能会有空隙。
//
// BoxFit.cover：显示可能拉伸，可能裁切，充满（图片要充满整个容器，还不变形）。
//
// BoxFit.fitWidth：宽度充满（横向充满），显示可能拉伸，可能裁切。
//
// BoxFit.fitHeight ：高度充满（竖向充满）,显示可能拉伸，可能裁切。
//
// BoxFit.scaleDown：效果和contain差不多，但是此属性不允许显示超过源图片大小，可小不可大。

// repeat：
// ImageRepeat.repeat : 横向和纵向都进行重复，直到铺满整个画布。
//
// ImageRepeat.repeatX: 横向重复，纵向不重复。
//
// ImageRepeat.repeatY：纵向重复，横向不重复。