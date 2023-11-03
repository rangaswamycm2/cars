import 'package:cars/UI/searchui.dart';
import 'package:cars/app_config/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../data/data.dart';
import 'homepage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  List<ModelTabs> modelTabsData = [];
  ModelTabs currentTab = ModelTabs();
  void buildTabs(){
    modelTabsData = AppDataClass.tabsList.map((e) =>
        ModelTabs.fromJson(e)
    ).toList();

    currentTab = modelTabsData[0];
    modelTabsData[0].isActive = true;
    currentTab.isActive = true;
    ++updateUi.value;
   /* setState(() {

    });*/

  }
  @override
  void initState() {
    buildTabs();
    super.initState();
  }

  ValueNotifier<int> updateUi = ValueNotifier<int>(0);

buildUI(){
  if(currentTab.cd=="HOME"){
    return HomeScreen();
  }else if(currentTab.cd=="SEARCH"){
    return SearchUI();
  }else {
    return HomeScreen();
  }
}

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: updateUi,
        builder: (context,value,child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("${currentTab.tName}"),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            leading: Icon(Icons.grid_view_outlined),
            actions: [
              badges.Badge(
                badgeContent: Text(' '),
                  showBadge: true,
                  position: badges.BadgePosition.topEnd(top: 0, end: 10),
                badgeStyle: badges.BadgeStyle(badgeColor: Colors.red),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 28,))
              ),

            ],
          ),
          body:buildUI(),
          bottomNavigationBar: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...modelTabsData.map((e) => buildNavigationItem(e)).toList(),
              ],//buildNavigationItems(),
            ),
          ),
        );
      }
    );
  }

  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in modelTabsData) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(ModelTabs item){
    return GestureDetector(
      onTap: () {
        for (var element in modelTabsData) {element.isActive = false ;}
        item.isActive = true;
        currentTab = item;
        ++updateUi.value;
      },
      child: item.isActive?Container(
        height: MediaQuery.of(context).size.height * 0.07,
        padding: EdgeInsets.only(left: 15,right: 15,top: 4,bottom: 4),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30.0),

        ),
        child: Row(
          children: [
            Icon(item.iconData,size: 28,color : Colors.grey[400]),
            AppWidgets.size5w,
            Text(item.tName??"",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
          ],
        ),
      ):Container(
        child: Icon(item.iconData,size: 28,color : Colors.grey[400]),
      )
    );
  }

}
