part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent{}


class EmailEvent extends SignUpEvent{
  String? email;
  EmailEvent({this.email});
}


class UpdateEvent extends SignUpEvent{}

class SignUpCallEvent extends SignUpEvent{
  Map<String,dynamic> payload = {};
  SignUpCallEvent({required this.payload});
}

class SignUpValidationEvent extends SignUpEvent{

}

