part of 'signup_bloc.dart';

abstract class SignUpState{
  String? selectDropDownValue;

  SignUpState({this.selectDropDownValue});


}

class SignUpInitial extends SignUpState{
  String? selectDropDownValue;
  SignUpInitial({this.selectDropDownValue});
}

class SignUpLoadingState extends SignUpState{

}
class SignUpSuccessState extends SignUpState{

}
class SignUpFailureState extends SignUpState{

}
class SignUpUpdateState extends SignUpState{

}

class SignUpButtonEnableState extends SignUpState{

}
