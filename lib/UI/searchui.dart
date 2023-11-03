import 'package:cars/app_config/app_widgets.dart';
import 'package:cars/app_config/constants.dart';
import 'package:flutter/material.dart';

import '../app_config/global_styles.dart';
import '../data/data.dart';

class SearchUI extends StatefulWidget {
  const SearchUI({Key? key}) : super(key: key);

  @override
  State<SearchUI> createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {

List popularSegments = [
  {
    "name" : "SUV",
    "isActive" : true
  },
  {
    "name" : "Sedan",
    "isActive" : false
  },
  {
    "name" : "Hatchback",
    "isActive" : true
  },
  {
    "name" : "Convertible",
    "isActive" : false
  },
  {
    "name" : "Minivan",
    "isActive" : false
  },
  {
    "name" : "Compact SUV",
    "isActive" : false
  },
  {
    "name" : "Truck",
    "isActive" : true
  },
];
List allBrands = [
  {
    "name" : "HYUNDAI",
    "imgPath" : "assets/brands/hyundai.png",
    "isActive" : true,
  },
  {
    "name" : "KIA",
    "imgPath" : "assets/brands/kia.png",
    "isActive" : false
  },

  {
    "name" : "TATA",
    "imgPath" : "assets/brands/tata.png",
    "isActive" : false
  },
  {
    "name" : "TESLA",
    "imgPath" : "assets/brands/tesla.png",
    "isActive" : true
  },
  {
    "name" : "HYUNDAI",
    "imgPath" : "assets/brands/hyundai.png",
    "isActive" : true,
  },
  {
    "name" : "KIA",
    "imgPath" : "assets/brands/kia.png",
    "isActive" : false
  },

  {
    "name" : "TATA",
    "imgPath" : "assets/brands/tata.png",
    "isActive" : false
  },
  {
    "name" : "TESLA",
    "imgPath" : "assets/brands/tesla.png",
    "isActive" : true
  },
];
List fuelTypes = [
  {
    "name" : "CNG",
    "isActive" : true
  },
  {
    "name" : "Petrol",
    "isActive" : false
  },
  {
    "name" : "Diesal",
    "isActive" : true
  },
  {
    "name" : "Electric",
    "isActive" : false
  },
  {
    "name" : "Hybrid",
    "isActive" : false
  },
  {
    "name" : "Gas",
    "isActive" : false
  },
];

  imageRender(String? imgPath){
    return  Image.asset(imgPath??"assets/brands/hyundai.png", width: MediaQuery.of(context).size.width * 0.10,);
  }

List<Car> carsData = [Car(
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
  ),];

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


 commonUiCard(String names, bool? isTextWhiteBlack){
  isTextWhiteBlack = isTextWhiteBlack??false;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color : isTextWhiteBlack?Colors.black87:Colors.white,
        border: Border.all(width: 1.2,color: Colors.grey.shade400,),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
        padding: const EdgeInsets.only(left: 12,right: 12),
      child: Center(child: Text("$names", style: TextStyle(color:isTextWhiteBlack? Colors.white:Colors.black87,fontSize: 20,fontWeight: FontWeight.bold)))
    ),
  );
}
 listCommonCards(List? listData){
  return  Container(
    height:70, //commonUiCard(listData[index]['name'],listData[index]['isActive']);
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: (listData??[]).map<Widget>((e) => commonUiCard(e['name'],e['isActive'])).toList(),
      ),
    ),

  );
 }


@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search products',
                        hintStyle: const TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.only(left: 30,),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(right: 24.0, left: 16.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    double _startValue = 0.0;
                    double _endValue = 90.0;


                    List seats = [
                      {
                      "name" : "2 seats",
                      "isActive" : true
                      },
                      {
                        "name" : "4 seats",
                        "isActive" : false
                      },
                      {
                        "name" : "5 seats",
                        "isActive" : false
                      },
                      {
                        "name" : "6 seats",
                        "isActive" : false
                      },
                      {
                        "name" : "7 seats",
                        "isActive" : false
                      },
                      {
                        "name" : "8 seats",
                        "isActive" : false
                      }

                    ];
                    List transmission = [
                      {
                        "name" : "Manual",
                        "isActive" : true
                      },
                      {
                        "name" : "Automatic",
                        "isActive" : false
                      }

                    ];
                    List arrange  = [
                      {
                        "name" : "High Sale",
                        "isActive" : false
                      },
                      {
                        "name" : "A-Z",
                        "isActive" : true
                      },
                      {
                        "name" : "A-Z",
                        "isActive" : false
                      }
                    ];
                    List<Color> chooseColors = [ const Color(0xffe6e6e6),const Color(0xffb74134), const Color(0xffc7b9b8),const Color(0xff1d2976),const Color(0xffe3c8a3),Colors.yellow,Colors.blue];
                    showModalBottomSheet(
                      context: context,
                      backgroundColor:  whiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),

                      ),
                      isScrollControlled: true,

                      builder: (BuildContext context) {
                        return   StatefulBuilder(
                            builder: (context,setState) {
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.75,

                                padding: const EdgeInsets.all(8.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children:  <Widget>[
                                      Center(
                                        child: FractionallySizedBox(
                                          widthFactor: 0.25,
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 12.0,
                                            ),
                                            child: Container(
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text("Filters",style: GlobalStyles.mainHeadingStyle,),
                                      ),

                                      Text("Seats",style: GlobalStyles.headingStyle),
                                      listCommonCards(seats),
                                      AppWidgets.size10h,
                                      Text("Transmission",style: GlobalStyles.headingStyle),
                                      listCommonCards(transmission),
                                      AppWidgets.size10h,
                                      Text("Choose Colors",style: GlobalStyles.headingStyle),
                                      Container(
                                        height:60,
                                        child:  ListView.builder(
                                            itemCount: chooseColors.length,
                                            scrollDirection: Axis.horizontal,



                                            itemBuilder: (BuildContext context, int index) {
                                              return  Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: chooseColors[index],
                                                    //shape: BoxShape.circle,
                                                    //border: Border.all(width: 1.4,color: Colors.grey.shade400),
                                                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                                                  ),
                                                  // child: Center(child: Text("${transmission[index]}",style: TextStyle(color:transmission[index]=="Manul"? Colors.white:Colors.black87,fontSize: 20))),

                                                  width: 30,
                                                  //  color: Colors.blue,
                                                ),
                                              );

                                            }),

                                      ),
                                      AppWidgets.size10h,
                                      Text("Arrange by",style: GlobalStyles.headingStyle),
                                     listCommonCards(arrange),
                                      AppWidgets.size10h,
                                      Text("Offers",style: GlobalStyles.headingStyle),
                                      RangeSlider(
                                        min: 0.0,
                                        max: 100.0,
                                        divisions: 100,
                                        activeColor: blackColor,
                                        labels: RangeLabels(
                                          _startValue.round().toString(),
                                          _endValue.round().toString(),
                                        ),
                                        values: RangeValues(_startValue, _endValue),
                                        onChanged: (values) {
                                          setState(() {
                                            _startValue = values.start;
                                            _endValue = values.end;
                                          });
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("RS.${_startValue.round()} Lakh",style: const TextStyle(fontSize: 14,color: Colors.grey),),
                                          Text("RS.${_endValue.round()} Lakh",style: const TextStyle(fontSize: 14,color: Colors.grey),),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: blackColor),
                                            onPressed: (){},
                                            child: SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.80,
                                                child: Center(child: Text("Filter",style: TextStyle(color: whiteColor),)))),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    width: MediaQuery.of(context).size.width * 0.12,
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.all(8.0),

                    child: Image.asset("assets/images/more.png",color: Colors.white),
                  ),
                ),
              ],
            ),
            AppWidgets.size5h,
            Text("Popular Segments",style: GlobalStyles.headingStyle,),

            Wrap(
              children: popularSegments.map((e){
                return Padding(padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: e['isActive']?blackColor:lightGrey,
                    ),
                    padding: const EdgeInsets.only(left:12,right:12,bottom: 8,top: 8),
                    child: Text("${e['name']}",style: TextStyle(color:e['isActive']?whiteColor:greyColor ),),
                  ),
                );
              }).toList(),
            ),
            AppWidgets.size15h,
            Text("All Brands",style: GlobalStyles.headingStyle,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allBrands.map((e){
                  return Padding(padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: lightGrey,
                          ),
                          height: MediaQuery.of(context).size.height * 0.090,
                          padding: const EdgeInsets.all(12),
                          child:imageRender(e['imgPath']),),
                        Text("${e['name']}",style: TextStyle(color:blackColor,fontWeight: FontWeight.w700,fontSize: 14 )
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            AppWidgets.size15h,
            Text("Fuel Type",style: GlobalStyles.headingStyle,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: fuelTypes.map((e){
                  return Padding(padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: e['isActive']?blackColor:lightGrey,
                      ),
                      padding: const EdgeInsets.only(left:12,right:12,bottom: 8,top: 8),
                      child: Text("${e['name']}",style: TextStyle(color:e['isActive']?whiteColor:greyColor ),),
                    ),
                  );
                }).toList(),
              ),
            ),

            carCard(context,"Top Cars",0),




          ],
        ),
      ),
    );
  }
}
