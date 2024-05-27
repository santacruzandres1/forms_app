import 'package:formz/formz.dart';

// Define input validation errors
enum LastNameError { empty, length, characters, numbers }

// Extend FormzInput and provide the input type and error type.
class LastName extends FormzInput<String, LastNameError> {
  // Call super.pure to represent an unmodified form input.
  const LastName.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const LastName.dirty(super.value) : super.dirty();
  String? get errorMessage {
    if (isValid || isPure) return null;

    if  (displayError == LastNameError.numbers) return 'Este campo no admite números';
    if  (displayError == LastNameError.characters) return 'Este campo no admite caracteres especiales';
    if  (displayError == LastNameError.empty) return 'El campo es requerido';
    if  (displayError == LastNameError.length) return 'El campo debe dener al menos 6 caracteres';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  LastNameError? validator(String value) {
final characterRegExp = RegExp(r'.*[^\w\s-]');
    final numberCaseRegExp = RegExp(r'[0-9]');
    if (numberCaseRegExp.hasMatch(value)) return LastNameError.numbers;
    if (characterRegExp.hasMatch(value)) return LastNameError.characters;
    if (value.isEmpty || value.trim().isEmpty) return LastNameError.empty;
    if (value.length < 6) return LastNameError.length;

    return null;
  }
}
