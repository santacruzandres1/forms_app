import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());
void onSubmit(){
  print('Submit: $state');
}
void firstNameChanged(String value){
  emit(state.copyWith(
    firstName: value
    ));  
}
void lastNameChanged(String value){
  emit(state.copyWith(
    lastName: value
    ));  
}
void emailChanged(String value){
  emit(state.copyWith(
    email: value
    ));  
}
void passwordChanged(String value){
  emit(state.copyWith(
    password: value
    ));  
}
void checkPasswordChanged(String value){
  emit(state.copyWith(
    checkPassword: value
    ));  
}

  void checkPasswordMatch(String password, String confirmPassword) {
    if (password == confirmPassword) {
      emit(state.copyWith(isPasswordMatching: true));
    } else {
      emit(state.copyWith(isPasswordMatching: false));
    }
  }

}
