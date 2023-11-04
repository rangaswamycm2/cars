import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signup_api.dart';
part 'signup_event.dart';
part 'signup_state.dart';


class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  SignUpBloc() : super(SignUpInitial()){

    on<UpdateEvent>(updateState);
    on<SignUpCallEvent>(signUpApi);
    on<SignUpValidationEvent>(signUpEnableState);

  }

  void updateState(UpdateEvent event,Emitter<SignUpState> emit){
    emit(SignUpUpdateState());
  }
  void signUpEnableState(SignUpValidationEvent event,Emitter<SignUpState> emit){
    emit(SignUpButtonEnableState());
  }

  void signUpApi(SignUpCallEvent event,Emitter<SignUpState> emit)async{
    emit(SignUpLoadingState());
    await SignUpApiClass.registerCall(event.payload).then((value) {
      if(value){
        emit(SignUpUpdateState());
        emit(SignUpSuccessState());
      }else{
        emit(SignUpFailureState());
        emit(SignUpButtonEnableState());
      }

    });
  }

}