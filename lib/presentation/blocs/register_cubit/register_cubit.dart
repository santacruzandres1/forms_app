import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infraestructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());
void onSubmit(){
  print('Submit: $state');
}
void firstNameChanged(String value){
  final firstName = Name.dirty(value: value);
  emit(state.copyWith(
    firstName: firstName,
    isValid: Formz.validate([firstName])
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
  final password = Password.dirty(value: value);
  emit(state.copyWith(
    password: password,
    isValid: Formz.validate([password, state.firstName])//Cambiar first name por email

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
