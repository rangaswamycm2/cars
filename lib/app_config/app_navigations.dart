
import 'package:flutter/material.dart';

class AppNavigation{
 static Future openPage(BuildContext context,Widget? childUi)async {
   Navigator.push(context, MaterialPageRoute(builder: (context)=>childUi!));
  }
}