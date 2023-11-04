import 'dart:convert';

import 'package:cars/UI/signin/signup.dart';
import 'package:cars/app_config/app_navigations.dart';
import 'package:cars/app_config/app_widgets.dart';
import 'package:cars/app_config/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_config/sp.dart';
import '../../blocs/signin_bloc/signin_bloc.dart';
import '../profile/profile.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
   final SignInBloc signInBloc = SignInBloc();


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

   validate(){
     if(password.text.isNotEmpty && email.text.isNotEmpty){
       signInBloc.add(SignInValidationEvent());
     }else{
       signInBloc.add(SignInUpdateEvent());
     }
   }

   buildTextField(TextEditingController controller,String hint,String labelName){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextField(
         controller: controller,
         onChanged: (val){
           validate();
         },
         decoration: InputDecoration(
           hintText: hint,labelText: labelName,
           border: OutlineInputBorder(),
         ),
       ),
     );
   }

   @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BlocConsumer<SignInBloc,SignInState>(
          listener: (context,state)async{
            if(state is SignInSuccessState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully LogIn'),));
               AppNavigation.openPage(context, ProfileData());

            }else if(state is SignInFailureState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.msg}'),));
            }

          },
          bloc: signInBloc,
          builder: (context,state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text("Sign In", style: GlobalStyles.mainHeadingStyle,),),
                  AppWidgets.size10h,
                  buildTextField(email,"Enter Email","Email"),
                  AppWidgets.size10h,
                  buildTextField(password,"Enter Password","Password"),
                  AppWidgets.size10h,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: state is SignInButtonEnableState || state is SignInLoadingState ?Colors.blue:Colors.grey
                        ),
                        onPressed:state is SignInButtonEnableState? (){
                          Map<String,dynamic> payload = {
                            "Email": email.text,
                          "password": password.text
                          };
                          signInBloc.add(SignInCallEvent(payload: payload));

                        }:(){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check Username and Password'),));
                          },
                        child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),
                  AppWidgets.size15h,
                  Divider(),
                  AppWidgets.size15h,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(onPressed: (){

                      AppNavigation.openPage(context, UserSignUpScreen());
                    },
                        child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 16,decoration: TextDecoration.underline),)),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
