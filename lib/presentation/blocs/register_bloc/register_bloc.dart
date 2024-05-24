import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infraestructure/inputs/inputs.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterBloc() : super(const RegisterFormState()) {
    on<FirstNameChanged>(onFirstNameChanged);
    on<LastNameChanged>(onLastNameChanged);
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  void onFirstNameChanged(FirstNameChanged event, Emitter<RegisterFormState> emit) {
    final firstName = event.firstName; 
    emit(state.copyWith(
      firstName: firstName,
      isValid: Formz.validate([firstName])
      ));
  }

  void onLastNameChanged(LastNameChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void onEmailChanged(EmailChanged event, Emitter<RegisterFormState> emit) {
    final email = event.email;
    emit(state.copyWith(
      email: email,
      formStatus: _validateForm(email: email,password:  state.email) ? FormStatus.valid : FormStatus.invalid,
      //TODO isValid: Formz.validate([email, state.password]),

    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterFormState> emit) {
    final password = event.password;
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password]),
      //TODO isValid: Formz.validate([password, state.email]),
    ));
  }

  bool _validateForm({required String email, required String password}) {
    // Implement your custom validation logic here, including:
    // - Check if email and password are not empty
    // - Validate email format
    // - Validate password strength (length, complexity)
    // ...
    return email.isNotEmpty && password.isNotEmpty; // Example basic validation
  }
}
