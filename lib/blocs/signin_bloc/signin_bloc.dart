import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signup_api.dart';
part 'signin_event.dart';
part 'signin_state.dart';


class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc() : super(SignInUpdateState()){
    on<SignInUpdateEvent>(updateState);
    on<SignInCallEvent>(signUpApi);
    on<SignInValidationEvent>(signInEnableState);

  }

  void updateState(SignInUpdateEvent event,Emitter<SignInState> emit){
    emit(SignInUpdateState());
  }
  void signInEnableState(SignInValidationEvent event,Emitter<SignInState> emit){
    emit(SignInButtonEnableState());
  }

  void signUpApi(SignInCallEvent event,Emitter<SignInState> emit)async{
    emit(SignInLoadingState());
    await SignUpApiClass.signInCall(event.payload).then((value) {
      if(value.isNotEmpty){
        emit(SignInSuccessState(loginData:jsonDecode(value)));

      }else{
        emit(SignInFailureState(msg: SignUpApiClass.msg??""));

      }

    });
  }

}