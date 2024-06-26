import 'package:formz/formz.dart';

// Define input validation errors
enum NameError { empty, length, characters, numbers }

// Extend FormzInput and provide the input type and error type.
class Name extends FormzInput<String, NameError> {
  // Call super.pure to represent an unmodified form input.
  const Name.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Name.dirty(super.value) : super.dirty();
  String? get errorMessage {
    if (isValid || isPure) return null;

    if  (displayError == NameError.numbers) return 'Este campo no admite números';
    if  (displayError == NameError.characters) return 'Este campo no admite caracteres especiales';
    if  (displayError == NameError.empty) return 'El campo es requerido';
    if  (displayError == NameError.length) return 'El campo debe dener al menos 6 caracteres';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NameError? validator(String value) {
final characterRegExp = RegExp(r'.*[^\w\s-]');
    final numberCaseRegExp = RegExp(r'[0-9]');
    if (numberCaseRegExp.hasMatch(value)) return NameError.numbers;
    if (characterRegExp.hasMatch(value)) return NameError.characters;
    if (value.isEmpty || value.trim().isEmpty) return NameError.empty;
    if (value.length < 6) return NameError.length;

    return null;
  }
}
