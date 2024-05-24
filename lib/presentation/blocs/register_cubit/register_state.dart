part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Name firstName;
  final String lastName;
  final String email;
  final Password password;
  final String checkPassword;
  final bool isPasswordMatching;
  final bool isValid;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.firstName = const Name.pure(),
    this.lastName = '',
    this.email = '',
    this.password = const Password.pure(),
    this.checkPassword = '',
    this.isPasswordMatching = false,
    this.isValid = false,
  });
  RegisterFormState copyWith({
    Name? firstName,
    String? lastName,
    String? email,
    Password? password,
    String? checkPassword,
    bool? isPasswordMatching,
    bool? isValid,
    
  }) =>
      RegisterFormState(
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          password: password ?? this.password,
          checkPassword: checkPassword ?? this.checkPassword,
          isPasswordMatching: isPasswordMatching ?? this.isPasswordMatching,
          isValid: isValid ?? this.isValid,
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
