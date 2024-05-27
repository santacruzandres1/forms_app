import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infraestructure/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());
  void onSubmit() {
    emit(
      state.copyWith(
          formStatus: FormStatus.validating,
          firstName:  Name.dirty( state.firstName.value),
          lastName: Name.dirty(state.lastName.value),
          password: Password.dirty(state.password.value),
          email: Email.dirty(state.email.value),
          isValid: Formz.validate([
            state.firstName,
            state.lastName,
            state.email,
            state.password

            ])
    ));
  }

  void firstNameChanged(String value) {
    final firstName = Name.dirty(value);
    emit(state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([firstName, state.lastName, state.email, state.password])));
  }

  void lastNameChanged(String value) {
    final lastName = Name.dirty(value);
    emit(state.copyWith(
      lastName: lastName,
      isValid: Formz.validate([lastName, state.firstName, state.email, state.password])
    ));
  }

  void emailChanged(String value) {
        final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.firstName, state.lastName, state.password])


    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate(
            [password, state.firstName, state.lastName, state.email]) //Cambiar first name por email

        ));
  }

  // void checkPasswordChanged(String value) {
  //   emit(state.copyWith(checkPassword: value));
  // }

  // void checkPasswordMatch(String password, String confirmPassword) {
  //   if (password == confirmPassword) {
  //     emit(state.copyWith(isPasswordMatching: true));
  //   } else {
  //     emit(state.copyWith(isPasswordMatching: false));
  //   }
  // }
}
