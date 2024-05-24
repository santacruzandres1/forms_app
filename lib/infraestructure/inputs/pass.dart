import 'package:formz/formz.dart';

// Define input validation errors
enum PassError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Pass extends FormzInput<String, PassError> {
  // Call super.pure to represent an unmodified form input.
  const Pass.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Pass.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PassError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PassError.empty;
    if (value.length < 6) return PassError.length;
    return value.isEmpty ? PassError.empty : null;
  }
}