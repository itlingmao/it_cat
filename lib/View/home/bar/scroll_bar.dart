import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:it_cat/View/home/bar/navigation_bar_page.dart';

class HomeScrollBar extends StatefulWidget {
  @override
  _HomeScrollBarState createState() => _HomeScrollBarState();
}

class _HomeScrollBarState extends State<HomeScrollBar> {

  List _imageUrl =[
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
    'https://dimg04.c-ctrip.com/images/zg0f180000014vrut370F.jpg',
    'https://dimg04.c-ctrip.com/images/zg0n18000001528jhD6B2.jpg'];

  @override
  Widget build(BuildContext context) {
     return HomeNavigationBar (
       showTitle: '商业服务',
       appBarView: Container(
       height: 210,
       child: Swiper(
         //item的数量
         itemCount: _imageUrl.length,
         //自动播放
         autoplay: true,
         itemBuilder: (BuildContext context,int index){
           return Image.network(_imageUrl[index],fit: BoxFit.fill,);
         },
         //banner上添加指示器
         pagination: SwiperPagination(),
       ),
     ),
       bodyView:  Container(
         color: Colors.red,
         height: 800,
         child: ListTile(title: Text("哈哈"),),
       ),
     );
  }

  _home (){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme:IconThemeData(
            color: Colors.white
        ),
        title: Text('年会福利',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 1200,
            ),
          )
        ],
      ),
    );
  }
}
