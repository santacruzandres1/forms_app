part of 'register_bloc.dart';

enum FormStatus { invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
// sealed class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String firstName;
  final String lastName ;
  final String email;
  final String password ;
  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.firstName='', 
    this.lastName='', 
    this.email='', 
    this.password='',
    });

  RegisterFormState copyWith({
FormStatus? formStatus,
String? firstName,
String? lastName,
String? email,
String? password,

  }) =>
      RegisterFormState(
        formStatus: formStatus ?? this.formStatus,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
      );


  @override
  List<Object> get props => [formStatus,firstName, lastName, email, password];
}

final class RegisterFormInitial extends RegisterFormState {}
