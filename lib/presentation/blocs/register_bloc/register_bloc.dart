import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  RegisterBloc() : super(const RegisterFormState()) {
    on<FirstNameChanged>(onFirstNameChanged);
    on<LastNameChanged>(onLastNameChanged);
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    // on<FormSubmitted>(_onFormSubmitted); // New event for form submission
  }
  void onFormSubmitted() {
    print("Submit:$state");
}
  void onFirstNameChanged(FirstNameChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(firstName: event.firstname));
  }

  void onLastNameChanged(LastNameChanged event, Emitter<RegisterFormState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  void onEmailChanged(EmailChanged event, Emitter<RegisterFormState> emit) {
    final email = event.email;
    emit(state.copyWith(
      email: email,
      formStatus: _validateForm(email: email,password:  state.password) ? FormStatus.valid : FormStatus.invalid,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterFormState> emit) {
    final password = event.password;
    emit(state.copyWith(
      password: password,
      formStatus: _validateForm(email: state.email, password: password) ? FormStatus.valid : FormStatus.invalid,
    ));
  }

  // void _onFormSubmitted(FormSubmitted event, Emitter<RegisterFormState> emit) async {
  //   // Implement your form submission logic here (e.g., API call)
  //   // Update form status accordingly (validating, success, error)
  //   emit(state.copyWith(formStatus: FormStatus.posting)); // Update to posting
  //   // ... (Your form submission logic)
  //   emit(state.copyWith(formStatus: FormStatus.valid)); // Example success state
  // }

  bool _validateForm({required String email, required String password}) {
    // Implement your custom validation logic here, including:
    // - Check if email and password are not empty
    // - Validate email format
    // - Validate password strength (length, complexity)
    // ...
    return email.isNotEmpty && password.isNotEmpty; // Example basic validation
  }
}
