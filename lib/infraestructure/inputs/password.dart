import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.length;
    return value.isEmpty ? PasswordError.empty : null;
  }
}

  // final characterRegExp = RegExp(r'.*[!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]+');
  // final lowerCaseRegExp = RegExp(r'[a-z]');
  // final upperCaseRegExp = RegExp(r'[A-Z]');
  // final numberCaseRegExp = RegExp(r'[0-9]');
  // if (value!.trim().isEmpty) return 'Campo requerido';
  // if (value.length < 8) {
    // return 'La contraseña ebe contener 8 o más caracteres';
  // }
  // if (!upperCaseRegExp.hasMatch(value))
    // return 'Debe contener al menos 1 letra Mayúscula';
  // if (!lowerCaseRegExp.hasMatch(value))
    // return 'Debe contener al menos 1 letra minúscula';
  // if (!numberCaseRegExp.hasMatch(value))
    // return 'Debe contener al menos 1 número';
  // if (!characterRegExp.hasMatch(value))
    // return 'Debe contener al menos 1 caracter especial';
  // return null;