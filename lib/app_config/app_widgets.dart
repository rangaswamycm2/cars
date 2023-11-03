import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import 'constants.dart';
import 'global_styles.dart';

class AppWidgets{

  static SizedBox size10h = SizedBox(height:10 ,);
  static SizedBox size5h = SizedBox(height:5 ,);
  static SizedBox size15h = SizedBox(height:15 ,);

  static SizedBox size10w = SizedBox(width: 10 ,);
  static SizedBox size5w = SizedBox(width: 5 ,);
  static SizedBox size15w = SizedBox(width:15 ,);

 static Widget buildCar(context,Car car, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffe7e7e7),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: car.isFavorite?Icon(Icons.favorite,color: yellowCardColor,):Icon(Icons.favorite_border_outlined,color: blackColor,),
              ),
            ),
          ),

          Container(
            height: 100,
            child: Center(
              child: Hero(
                tag: car.model,
                child: Image.asset(
                  car.images[0],
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),

          Container(
            // width: MediaQuery.of(context).size.width * 0.50,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10.0), border: Border.all(color:whiteColor)),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.brand,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Text(
                  car.price,
                  style: TextStyle(
                      fontSize: 13,color: Colors.grey[400]
                  ),
                ),
                Text(
                  car.avgEx,
                  style: TextStyle(
                      fontSize: 11,color: Colors.grey[400]
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}