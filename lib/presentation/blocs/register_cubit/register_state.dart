part of 'register_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
final String firstName;
final String lastName;
final String email;
final String password;
final String checkPassword;
final bool isPasswordMatching;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, 
    this.firstName = '', 
    this.lastName = '', 
    this.email = '', 
    this.password = '', 
    this.checkPassword = '',
    this.isPasswordMatching = false,
    });
  RegisterFormState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? checkPassword,
    bool? isPasswordMatching,
  })=> RegisterFormState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        checkPassword: checkPassword ?? this.checkPassword,
        isPasswordMatching: isPasswordMatching ?? this.isPasswordMatching
  );
  @override
  List<Object> get props => [formStatus, firstName, lastName, email, password, checkPassword, isPasswordMatching];
}

