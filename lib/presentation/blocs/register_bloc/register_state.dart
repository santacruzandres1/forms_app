part of 'register_bloc.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
// sealed class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Name firstName;
  final String lastName;
  final String email;
  final Pass password;
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.firstName = const Name.pure(),
    this.lastName = '',
    this.email = '',
    this.password = const Pass.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Name? firstName,
    String? lastName,
    String? email,
    Pass? password,
  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object> get props => [formStatus, isValid, firstName, lastName, email, password];
}

final class RegisterFormInitial extends RegisterFormState {}
