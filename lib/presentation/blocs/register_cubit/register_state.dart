part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Name firstName;
  final Name lastName;
  final Email email;
  final Password password;
  final Password checkPassword;
  final bool isPasswordMatching;
  final bool isValid;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.firstName = const Name.pure(),
    this.lastName = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.checkPassword = const Password.pure(),
    this.isPasswordMatching = false,
    this.isValid = false,
  });
  RegisterFormState copyWith({
    Name? firstName,
    Name? lastName,
    Email? email,
    Password? password,
    Password? checkPassword,
    bool? isPasswordMatching,
    bool? isValid,
    FormStatus? formStatus,
    
  }) =>
      RegisterFormState(
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          password: password ?? this.password,
          checkPassword: checkPassword ?? this.checkPassword,
          isPasswordMatching: isPasswordMatching ?? this.isPasswordMatching,
          isValid: isValid ?? this.isValid,
          formStatus: formStatus ?? this.formStatus,
          );
          
  @override
  List<Object> get props => [
        formStatus,
        firstName,
        lastName,
        email,
        password,
        checkPassword,
        isPasswordMatching,
        isValid
      ];
}
