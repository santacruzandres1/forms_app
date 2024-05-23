import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
final String? label;
final String? hint;
final String? errorMessage;
final Function(String)? onChanged;
final bool? obscureText;
final String? Function(String?)? validator;


  const CustomTextFormField({super.key, this.label, this.hint, this.errorMessage, this.onChanged, this.validator, this.obscureText});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    );
    return TextFormField(
      obscureText: obscureText??false,
    onChanged: onChanged,
    validator:validator, 
    decoration: InputDecoration(
      enabledBorder: border,
      focusedBorder: border.copyWith(borderSide: BorderSide(
        color: colors.primary,
        width: 2,
      )),
      errorBorder: border.copyWith(borderSide: const BorderSide(color:Color(0xFFF44336))),
      focusedErrorBorder: border.copyWith(borderSide: const BorderSide(color:Color(0xFFF44336))),
      isDense: true,
      label: label != null ? Text(label!) : null,
      hintText: hint,
      errorText: errorMessage,
    ),
    );
  }
}