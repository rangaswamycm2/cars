part of 'signin_bloc.dart';

@immutable
abstract class SignInEvent{}

class SignInUpdateEvent extends SignInEvent{}

class SignInCallEvent extends SignInEvent{
  Map<String,dynamic> payload = {};
  SignInCallEvent({required this.payload});
}

class SignInValidationEvent extends SignInEvent{

}

