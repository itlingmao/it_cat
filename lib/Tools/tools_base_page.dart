import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class CatBaseWidgetPage extends StatefulWidget {
  @override
  CatBaseWidgetPageState createState() => getState();

  ///子类实现
  CatBaseWidgetPageState getState();
}

abstract class CatBaseWidgetPageState<T extends CatBaseWidgetPage> extends State<T>{

  String title = '界面名称';
  bool isBuild = false;
  var size;
  void popView(Widget item){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return item;
    }));
  }
  Color _themeColor = Colors.teal; //当前路由主题色
  @override
  Widget build(BuildContext context) {

    // return Theme(
    //   data:  ThemeData(
    //       primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
    //       iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
    //   ),
    //   child: isBuild == false ? _isBuildDefault(context)
    //         : buildWidget(context),
    // );
    return MaterialApp(
      theme: ThemeData(
              primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
              iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
          ),
      debugShowCheckedModeBanner: false,
      home: isBuild == false ? _isBuildDefault(context)
          : buildWidget(context),
    );

  }

  Widget _isBuildDefault(BuildContext context){
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: buildWidget(context),);
  }
  Widget unBuild(BuildContext context){
    size = MediaQuery.of(context).size;
    return buildWidget(context);
  }


  Widget buildWidget(BuildContext context);

  Widget buildAppBar() {
    return AppBar(
      elevation: 1,
      title: Text( title),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
        Navigator.pop(context);
      },),
    );
  }
}
enum CatDirection{
  vertical,
  horizontal,
}

class CatTextWidget extends StatelessWidget {
  final String textTitle;
  final int textFlex;
  final TextOverflow textOverflow;
  final int textMaxLines;
  final Color textColor;
  final FontWeight textFontW;
  final double textFontSize;

  const CatTextWidget(this.textTitle,
      {Key key,
        this.textFlex,
        this.textOverflow,
        this.textMaxLines,
        this.textColor,
        this.textFontW,
        this.textFontSize
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
      child: Text(textTitle,
        overflow: textOverflow ?? TextOverflow.ellipsis,
        softWrap: true,
        maxLines: textMaxLines ?? 1,
        style: TextStyle(
            color: textColor ?? Colors.black,
            fontWeight: textFontW ?? FontWeight.w800,
            fontSize: textFontSize ?? 12),),
    );
  }
}

class CatButtonWidget extends StatelessWidget {

  final String title;
  final CatDirection direction;
  final GestureTapCallback tapChanged;
  final Icon buttonIcon;
  final EdgeInsets paddingText;
  // final Text buttonText;
  final Color colorBackground;
  final Color colorBorder;
  final BorderRadius lineBorder;

  const CatButtonWidget(this.title, {Key key, this.direction = CatDirection.vertical,
    this.tapChanged, this.buttonIcon,
    this.paddingText,
    this.colorBackground = Colors.transparent,
    this.colorBorder = Colors.transparent,
    this.lineBorder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: new Border.all(color: colorBorder, width: 1),
        color: colorBackground,
        borderRadius: lineBorder ?? new BorderRadius.circular((4),),
      ),
      child:InkWell(
        // splashColor: Colors.red,//
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: tapChanged,
        child: direction == CatDirection.vertical
            ? Column(
          children: _listWidget(),
        )
            : Row(
          children: _listWidget(),
        ),
      ) ,
    );
  }

  List<Widget> _listWidget (){
    return <Widget>[
      buttonIcon != null ? Container(padding: EdgeInsets.all(6),child: Icon(Icons.add)) : Container(),
      Container(padding: paddingText ?? EdgeInsets.symmetric(vertical: 10,horizontal: 16,),
          child: Text(title ,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,
          ),
      ),
    ];
  }
}