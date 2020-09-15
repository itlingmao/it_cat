import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:it_cat/Tools/tools_base_page.dart';
import 'package:it_cat/View/home/container/home_container_row_column_page.dart';

class HomeListPage extends CatBaseWidgetPage {
  @override
  _HomeListPageState getState() => _HomeListPageState();
}

class _HomeListPageState extends CatBaseWidgetPageState<HomeListPage> {

  List _list = [
    Combination(name: 'ListView',isEmpty: true,item: [
      CombinationItem('row'),
      CombinationItem('container'),
      CombinationItem('column'),
      CombinationItem('container+row+column'),
      CombinationItem('stack+positioned'),
    ]),
  ];
  @override
  void initState() {
    super.initState();
    title = 'ListView';
  }
  @override
  Widget buildWidget(BuildContext context) {
    return _addPageView();
  }

  Widget _addPageView() {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index){
        Combination model = _list[index];
        if(model.item != null){
          return ExpansionTile(
            initiallyExpanded: true,
            title: Text(model.name),
            children: _addBuildItems(model),
          );
        }else {
          return ListTile(
            title: Text(model.name),
          );
        }
      },
    );
  }

  List<Widget> _addBuildItems(Combination items) {
    List<Widget> itemWidget = [];
    items.item.forEach((element) {
      itemWidget.add(
          ListTile(
            title: Text(element.name),
            onTap: (){
             print(element.name);
             if(element.name == 'row'){
               popView(HomeContainerRowColumnPage(pageType: HomePageType.row,));
             }else if(element.name == 'column'){
               popView(HomeContainerRowColumnPage(pageType: HomePageType.column,));
             }else if(element.name == 'container'){
               popView(HomeContainerRowColumnPage(pageType: HomePageType.container,));
             }else if(element.name == 'stack+positioned'){
               popView(HomeContainerRowColumnPage(pageType: HomePageType.stack,));
             }else {
               popView(HomeContainerRowColumnPage(pageType: HomePageType.all,));
             }

            },
          ),

      );
    });
    return  itemWidget;
  }


}

class Combination {
  final String name;
  final List<CombinationItem> item;
  final bool isEmpty;

  Combination({this.name, this.item,this.isEmpty = false});

}
class CombinationItem {
  final String name;

  CombinationItem(this.name);
}