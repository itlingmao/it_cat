
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/View/home/button/home_button_page.dart';
import 'package:it_cat/View/home/container/home_container_row_column_page.dart';
import 'package:it_cat/View/home/list/home_list_page.dart';
import 'package:it_cat/View/home/text/home_text_page.dart';
import 'package:it_cat/View/home/text_field/home_text_field_page.dart';

import 'container/home_container_page.dart';
import 'image/home_image_page.dart';

class HomeControllerPage extends StatefulWidget {
  final title;

  const HomeControllerPage(this.title,{Key key, }) : super(key: key);

  @override
  _HomeControllerPageState createState() => _HomeControllerPageState();
}

class _HomeControllerPageState extends State<HomeControllerPage> {

  List _listName = [
    'Button',
    'Text',
    'TextField',
    'Image',
    'Container',
    'ListView-Container',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _listName.length,
        itemBuilder: (BuildContext context, int index){
      return InkWell(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_listName[index]),
              Icon(Icons.chevron_right,color: Colors.blue,),
            ],
          ),
        ),
        onTap: (){
          print(index);

          if (index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context){
            return HomeButtonPage();
            }));
          }else if(index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeTextPage();
            }));
          }else if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeTextFieldPage();
            }));
          }else if(index == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeImagePage();
            }));
          }else if(index == 4){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeContainerPage();
            }));
          }else if(index == 5){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeListPage();
            }));
          }else if(index == 6){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeListPage();
            }));
          }
        },
      );
    });
  }
}
