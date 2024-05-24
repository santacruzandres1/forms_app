import 'package:formz/formz.dart';

// Define input validation errors
enum NameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Name extends FormzInput<String, NameError> {
  // Call super.pure to represent an unmodified form input.
  const Name.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Name.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  NameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NameError.empty;
    if (value.length < 6) return NameError.length;
    return null;
  }
}
//               final characterRegExp = RegExp(r'.*[!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]+');
//               final numberCaseRegExp = RegExp(r'[0-9]');
//               if (value == null) return 'Campo requerido';
//               if (value.trim().isEmpty) return 'Campo requerido';
//               if (characterRegExp.hasMatch(value))
//                 return 'Este campo no admite caracteres especiales';
//               if (numberCaseRegExp.hasMatch(value))
//                 return 'Este campo no admite números';
//               if (value.length < 6) return 'Más de 6 letras';
//               return null