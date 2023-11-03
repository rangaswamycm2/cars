import 'package:flutter/material.dart';

class AppDataClass{

  static List tabsList = [
    {
      "tname" : "Home",
      "tcode" : "HOME",
    },
    {
      "tname" : "Search",
      "tcode" : "SEARCH",
    },
    {
      "tname" : "Favorate",
      "tcode" : "FAVORATE",
    },
    {
      "tname" : "Bookmark",
      "tcode" : "BOOKMARK",
    }
  ];
}

class ModelTabs{
  String? tName;
  String? cd;
  IconData? iconData;
  bool isActive = false;
  ModelTabs();
  factory ModelTabs.fromJson(Map<String,dynamic> jsonData){
    ModelTabs mt= ModelTabs();
    mt.tName = jsonData['tname'];
    mt.cd = jsonData['tcode'];

    if(mt.cd=="HOME"){
      mt.iconData = Icons.home_outlined;

    }
    else if(mt.cd=="FAVORATE"){
      mt.iconData = Icons.favorite_border_outlined;
    }
    else if(mt.cd=="SEARCH"){
      mt.iconData = Icons.search_outlined;
    }
    else if(mt.cd=="BOOKMARK"){
      mt.iconData = Icons.bookmark_border_outlined;
    }
    return mt;
  }

}




class Car {

  String brand;
  String model;
  String price;
  String avgEx;
  List<String> images;
  bool isFavorite;

  Car(this.brand, this.model, this.price, this.avgEx, this.images,this.isFavorite);

}


