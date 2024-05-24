part of 'register_bloc.dart';

sealed class RegisterFormEvent extends Equatable {

  const RegisterFormEvent();

  @override
  List<Object> get props => [];
}

class FormStatusChanged extends RegisterFormEvent{
  const FormStatusChanged();

}
class FirstNameChanged extends RegisterFormEvent{
  final String firstname;
  const FirstNameChanged(this.firstname);
}
class LastNameChanged extends RegisterFormEvent{
  final String lastName;
  const LastNameChanged(this.lastName);
}
class EmailChanged extends RegisterFormEvent{
  final String email;
  const EmailChanged(this.email);
}
class PasswordChanged extends RegisterFormEvent{
  final String password;
  const PasswordChanged(this.password);
}