
import 'package:flutter/material.dart';

import '../../models/signin_user_data.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Name : "),
              Text("${AppLoginUserData.loginData['fullName']??""}"),
            ],
          ),
          Row(
            children: [
              Text("Email : "),
              Text("${AppLoginUserData.loginData['email']??""}"),
            ],
          ),

         /* Row(
            children: [
              Text("Token : "),
              Text("${AppLoginUserData.authToken }"),
            ],
          ),*/



        ],
      ),
    );
  }
}
