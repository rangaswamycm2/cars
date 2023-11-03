import 'package:cars/app_config/app_widgets.dart';
import 'package:cars/app_config/global_styles.dart';
import 'package:flutter/material.dart';

import '../app_config/constants.dart';
import '../data/data.dart';


List<Car> getCarList(){
  return <Car>[
    Car(
      "Land Rover",
      "Discovery",
      "Rs7.03 - 11.54 Lakh*",
      "Avg Ex-Showroom price",

      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
      true,
    ),
    Car(
      "Alfa Romeo",
      "C4",
      "Rs31.03 - 48.54 Lakh*",
      "Avg Ex-Showroom price",
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
      true,
    ),
    Car(
        "Nissan",
        "GTR",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/nissan_gtr_0.png",
          "assets/images/nissan_gtr_1.png",
          "assets/images/nissan_gtr_2.png",
          "assets/images/nissan_gtr_3.png",
        ],false
    ),
    Car(
        "Acura",
        "MDX 2020",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/acura_0.png",
          "assets/images/acura_1.png",
          "assets/images/acura_2.png",
        ],false
    ),
    Car(
        "Chevrolet",
        "Camaro",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/camaro_0.png",
          "assets/images/camaro_1.png",
          "assets/images/camaro_2.png",
        ],false
    ),
    Car(
        "Ferrari",
        "Spider 488",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/ferrari_spider_488_0.png",
          "assets/images/ferrari_spider_488_1.png",
          "assets/images/ferrari_spider_488_2.png",
          "assets/images/ferrari_spider_488_3.png",
          "assets/images/ferrari_spider_488_4.png",
        ],false
    ),
    Car(
        "Ford",
        "Focus",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/ford_0.png",
          "assets/images/ford_1.png",
        ],false
    ),
    Car(
        "Fiat",
        "500x",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/fiat_0.png",
          "assets/images/fiat_1.png",
        ],false
    ),
    Car(
        "Honda",
        "Civic",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/honda_0.png",
        ],false
    ),
    Car(
        "Citroen",
        "Picasso",
        "Rs17.03 - 12.54 Lakh*",
        "Avg Ex-Showroom price",
        [
          "assets/images/citroen_0.png",
          "assets/images/citroen_1.png",
          "assets/images/citroen_2.png",
        ],false
    ),
  ];
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Car> carsData = getCarList();

  Widget exploreCard(context){
    return  Container(
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 0.94,
     // margin: EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: yellowCardColor,
          border: Border.all(color: yellowCardColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Explore Latest",style: GlobalStyles.subheadingStyle,),
                      Text("Cars with Price"),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: (){}, child: Text("Explore",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),))
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                transform: Matrix4.translationValues(32, 0, 0),
                child: Image.asset("assets/images/car11.png",fit: BoxFit.fill),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget carCard(context,String title ,index){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$title",style: GlobalStyles.headingStyle,),
            Text("View all",style: TextStyle(color: yellowCardColor),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.buildCar(context, carsData[index], 0),
            AppWidgets.buildCar(context, carsData[index+1], 0),
          ],
        ),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Hi Jenifer!",style: GlobalStyles.mainHeadingStyle,),
          Text("Search your favorite car here",style: TextStyle(fontSize: 14,color: Colors.grey),),
            AppWidgets.size15h,
            exploreCard(context),
            AppWidgets.size15h,
            carCard(context,"The most searched cars",0),
            AppWidgets.size15h,
            carCard(context,"Recommended Cars For You",2),
        ],
        ),
      ),
    );
  }
}
