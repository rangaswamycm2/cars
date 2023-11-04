import 'package:cars/app_config/app_widgets.dart';
import 'package:cars/app_config/global_styles.dart';
import 'package:cars/blocs/signupbloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({Key? key}) : super(key: key);

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {

  final SignUpBloc signUpBloc = SignUpBloc();
  TextEditingController loginName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController proSkills = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController country = TextEditingController();

  validate(){

    if(loginName.text.isNotEmpty && name.text.isNotEmpty && password.text.isNotEmpty &&
    email.text.isNotEmpty && mobile.text.isNotEmpty && proSkills.text.isNotEmpty && selectedContactType != null){
      signUpBloc.add(SignUpValidationEvent());
    }else{
      signUpBloc.add(UpdateEvent());
    }
  }


  int? subscriptionId = 1; // dropdown Value
  String? selectedContactType;
  List addStores = [];
  List<int> subscriptionList = [1];
  List contactTypes = ["Customer"];

  bool? isPrimaryAddress = false;  // check box

  buildTextField(TextEditingController controller,String hint,String labelName,{bool isKeyboardTypeNum = false}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        onChanged: (val){
          validate();
        },
        keyboardType: isKeyboardTypeNum?TextInputType.number:TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,labelText: labelName,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: bRadius,
          ),
        ),
      ),
    );
  }

  BorderRadius bRadius =  BorderRadius.all(
    Radius.circular(8.0),
  );

  void showBottomSheet({required BuildContext context}){
    TextEditingController storeText = TextEditingController();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context){
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                AppWidgets.size10h,
                buildTextField(storeText,"Enter Text","Enter Text"),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    if(storeText.text.trim().isNotEmpty){
                      addStores.add({
                        "Text":storeText.text
                      });
                      Navigator.of(context).pop();
                    }
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                      child: Text("Add Text",style: TextStyle(color: Colors.white,fontSize: 16),)),
                ),
              ],
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BlocConsumer<SignUpBloc,SignUpState>(
        listener: (context,state){
          if(state is SignUpSuccessState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Register'),));
          }else if(state is SignUpFailureState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('LoginName, Mobile, Email are dublicate'),));
          }

        },
        bloc: signUpBloc,
          builder: (context,state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("User Registration"),
                centerTitle: true,
                backgroundColor: Colors.blue,

              ),
              body : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Type : ",style:GlobalStyles.labelHeadingStyle,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: bRadius,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.6),
                            )
                        ),
                        child: DropdownButton<String>(
                          underline: const SizedBox(),
                          isExpanded: true,
                          padding: const EdgeInsets.only(left:4),
                          hint: const Text(
                            "Select Customer Type",
                            style: TextStyle(color: Color(0xFFc7c7c7), fontSize: 15),
                          ),
                          borderRadius: bRadius,
                          items: contactTypes.map((val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Container(
                                padding: const EdgeInsets.only(left:2),
                                child: Text(val,),
                              ),
                            );
                          },
                          ).toList(),
                          value: selectedContactType,
                          onChanged: (String? value)async {
                            selectedContactType = value;

                            validate();
                          },
                        ),
                      ),

                      AppWidgets.size5h,
                      Text("Subscription Id : ",style:GlobalStyles.labelHeadingStyle,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: bRadius,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.6),
                            )
                        ),
                        child: DropdownButton<int>(
                          underline: const SizedBox(),
                          isExpanded: true,
                          padding: const EdgeInsets.only(left:4),
                          hint: const Text(
                            "Select Customer Type",
                            style: TextStyle(color: Color(0xFFc7c7c7), fontSize: 15),
                          ),
                          borderRadius: bRadius,
                          items: subscriptionList.map((val) {
                            return DropdownMenuItem<int>(
                              value: val,
                              child: Container(
                                padding: const EdgeInsets.only(left:2),
                                child: Text("$val",),
                              ),
                            );
                          },
                          ).toList(),
                          value: subscriptionId,
                          onChanged: (int? value)async {
                            subscriptionId = value;
                            validate();
                          },
                        ),
                      ),
                      AppWidgets.size5h,
                      buildTextField(loginName,"Enter Login Name","Login Name"),
                      AppWidgets.size5h,
                      buildTextField(name,"Enter Name","Name"),
                      AppWidgets.size5h,
                      buildTextField(email,"Enter Email","Email"),
                      AppWidgets.size5h,
                      buildTextField(password,"Enter Password","Password"),
                      AppWidgets.size5h,
                      buildTextField(mobile,"Enter Mobile Number","Mobile",isKeyboardTypeNum: true),
                      AppWidgets.size5h,
                      buildTextField(proSkills,"Enter Professional Skills","Professional Skills"),
                      AppWidgets.size5h,
                      Row(
                        children: [
                          Checkbox(value: isPrimaryAddress, onChanged: (bool? val){
                            isPrimaryAddress = val;
                            validate();
                          }), Text("Show Address"),
                          AppWidgets.size15w,
                          AppWidgets.size15w,
                          IconButton(onPressed: (){
                            showBottomSheet(context: context);
                          }, icon: Icon(Icons.add))
                        ],
                      ),
                      Visibility(
                          visible: isPrimaryAddress!,
                          child: Column(
                        children: [
                          buildTextField(address,"Enter Address","Address"),
                          AppWidgets.size5h,
                          buildTextField(city,"Enter City","City"),
                          AppWidgets.size5h,
                          buildTextField(stateController,"Enter State","State"),
                          AppWidgets.size5h,
                          buildTextField(zipCode,"Enter Pin Code","Pin Code",isKeyboardTypeNum: true),
                          AppWidgets.size5h,
                          buildTextField(country,"Enter Country","Country"),
                          AppWidgets.size5h,
                        ],
                      )),

                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state is SignUpButtonEnableState || state is SignUpLoadingState ?Colors.blue:Colors.grey
                  ),
                  onPressed: state is SignUpButtonEnableState?()async{
                    Map<String, dynamic> payload = {
                      "isDefaultBranchLocation":false,
                      "companyId": "DEF56C4F-808D-4F81-993C-EF67C77A5F91",
                      "accountTypeId": 2,
                      "isEnableProductUpload": false,
                      "contactType": selectedContactType??"",
                      "company": "JBS991",
                      "loginName": loginName.text,
                      "name": name.text,
                      "password": password.text,
                      "emailId": email.text,
                      "mobile": mobile.text,
                      "identityType": "Pancard",
                      "identityNumber": "99KSHSK0991",
                      "uploadIdentity": "Pan//Image path991",
                      "professionalSkills": proSkills.text,
                      "subscriptionId": 1,
                      "stores": addStores,
                      "isPrimaryAddress": isPrimaryAddress,
                      "address": address.text,
                      "city": city.text,
                      "state": stateController.text,
                      "zipCode": zipCode.text,
                      "country": country.text,
                      "contactCompany": "JBS991",
                      "mid":"MIN#00"
                    };
                     signUpBloc.add(SignUpCallEvent(payload: payload));
                    }:(){
                    print("Please Enter all Fields");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter all Fields'),));
                  },
                  child: state is SignUpLoadingState ? CircularProgressIndicator(): Text("Register",style: TextStyle(color: Colors.white)),
                ),
              ),
          );
        }
      ),
    );
  }
}
