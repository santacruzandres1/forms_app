import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length, numbers, characters, lowerCase, upperCase }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();
    String? get errorMessage {
    if (isValid || isPure) return null;
    if  (displayError == PasswordError.empty) return 'El campo es requerido';
    if  (displayError == PasswordError.length) return 'El campo debete contener más de 8 caracteres';
    if  (displayError == PasswordError.upperCase) return 'El campo debete contener al menos 1 letra Mayúscula';
    if  (displayError == PasswordError.lowerCase) return 'El campo debete contener al menos 1 letra minúscula';
    if  (displayError == PasswordError.numbers) return 'El campo debete contener al menos 1 número';
    if  (displayError == PasswordError.characters) return 'El campo debe contener al menos 1 caracter especial';

    return null;
  }
  // Override validator to handle validating a given input value.
@override
PasswordError? validator(String value) {
  final characterRegExp = RegExp(r'.*[!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]+');
  final lowerCaseRegExp = RegExp(r'[a-z]');
  final upperCaseRegExp = RegExp(r'[A-Z]');
  final numberCaseRegExp = RegExp(r'[0-9]');
  if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
  if (value.length < 8) return PasswordError.length;
  if (!lowerCaseRegExp.hasMatch(value)) return PasswordError.lowerCase;
  if (!upperCaseRegExp.hasMatch(value)) return PasswordError.upperCase;
  if (!numberCaseRegExp.hasMatch(value)) return PasswordError.numbers;
  if (!characterRegExp.hasMatch(value)) return PasswordError.characters;
  return null;
}
}

