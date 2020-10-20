
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//滚动最大距离
const APPBAR_SCROLL_OFFSET = 100;
class HomeNavigationBar extends StatefulWidget {
  final Widget bodyView;
  final Widget appBarView;
  final String showTitle;

  const HomeNavigationBar({Key key, this.bodyView, this.appBarView, this.showTitle}) : super(key: key);

  @override
  _TabNavigatorState createState() =>_TabNavigatorState();
}

class _TabNavigatorState extends State<HomeNavigationBar> {
  double appBarAlpha = 0;
  __onScroll(offset){
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha = 0;
    }else if(alpha>1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });

  }
  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;

    return Scaffold(
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(context: context,
                removeTop: true,
                //监听列表的滚动
                child: NotificationListener(
                  //监听滚动后要调用的方法
                  // ignore: missing_return
                  onNotification: (scrollNotification){
                    //只有当是更新状态下和是第0个child的时候才会调用
                    if(scrollNotification is ScrollUpdateNotification &&scrollNotification.depth==0){
                      __onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: ListView(
                    children: <Widget>[
                      widget.appBarView,
                      widget.bodyView,
                    ],
                  ),
                )
            ),
            //通过Opacity的透明度来控制appBar的显示与隐藏
            // opacity:透明度，0.0 到 1.0，0.0表示完全透明，1.0表示完全不透明
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: top + kToolbarHeight,
                decoration: BoxDecoration(color: Theme.of(context).accentColor,),
                child: Container(
                  padding: EdgeInsets.only(top: 20,left: 8,right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: (){Navigator.pop(context);},),
                      Text(widget.showTitle ,style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w700),),
                      Text("首页",style: TextStyle(color: Theme.of(context).accentColor,fontSize: 19,fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}