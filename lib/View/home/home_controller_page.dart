
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/Tools/tools_cat_inherited_widget.dart';
import 'package:it_cat/View/home/button/home_button_page.dart';
import 'package:it_cat/View/home/container/home_container_row_column_page.dart';
import 'package:it_cat/View/home/customScrollView/home_custom_scroll_page.dart';
import 'package:it_cat/View/home/gridView/home_staggered_grid_view_page.dart';
import 'package:it_cat/View/home/inheritedWidget/home_inherited_widget_page.dart';
import 'package:it_cat/View/home/list/home_list_page.dart';
import 'package:it_cat/View/home/pointer/home_gesture_page.dart';
import 'package:it_cat/View/home/pointer/home_pointer_page.dart';
import 'package:it_cat/View/home/screenshot/home_screenshot_page.dart';
import 'package:it_cat/View/home/streamBuilder/home_stream_builder_page.dart';
import 'package:it_cat/View/home/text/home_text_page.dart';
import 'package:it_cat/View/home/text_field/home_text_field_page.dart';
import 'package:it_cat/View/home/wrap/home_wrap_page.dart';

import 'alert_dialog/home_alert_dialog_page.dart';
import 'bar/fade_app_bar_page.dart';
import 'bar/fade_app_bar_page2.dart';
import 'bar/navigation_bar_page.dart';
import 'bar/scroll_bar.dart';
import 'container/home_container_page.dart';
import 'gridView/home_grid_view_page.dart';
import 'image/home_image_page.dart';
import 'listView/home_list_view_page.dart';

class HomeControllerPage extends CatBaseWidgetPage {

  @override
  _HomeControllerPageState getState() => _HomeControllerPageState();
}

class _HomeControllerPageState extends CatBaseWidgetPageState<HomeControllerPage> {
 
  @override
  void initState() {
    super.initState();
    isBuild = true;
  }
  
  @override
  Widget buildWidget(BuildContext context) {
    return Material(
      child: ListView.separated(
          itemCount: _listName.length,
          separatorBuilder: (context, index) => Divider(height: .5,color: Colors.black26,),
          itemBuilder: (BuildContext context, int index){
        return InkWell(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(_listName[index]),
                Icon(Icons.chevron_right,color: Theme.of(context).accentColor,),
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
                return HomeAlertDialogPage();
              }));
            }else if(index == 7){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeWrapPage();
              }));
            }else if(index == 8){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeListViewPage();
              }));
            }else if(index == 9){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeGridViewPage();
              }));
            }else if(index == 10){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeSGridViewPage();
              }));
            }else if(index == 11){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeCustomScrollPage();
              }));
            }else if(index == 12){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeInheritedWidgetPage();
              }));
            }else if(index == 13){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeStreamBuilderPage();
              }));
            }else if(index == 14){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomePointerPage();
              }));
            }else if(index == 15){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeGesturePage();
              }));
            }else if(index == 16){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeScrollBar();
              }));
            }else if(index == 17){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FadeAppBarWidget2();
              }));
            }else if(index == 18){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomeScreenshotPage();
              }));
            }



          },
        );
      }),
    );
  }
  
  List _listName = [
    'Button',
    'Text',
    'TextField',
    'Image',
    'Container',
    'ListView-Container',
    'AlertDialog',
    'wrap',
    'ListView',
    'GridView',
    'staggeredGridView',
    'customScrollView',
    'inheritedWidget',
    'streamBuilder',
    'pointer',
    'gesture',
    'HomeNavigationBar',
    'FadeAppBarWidget',
    'screenshot',

  ];
}
