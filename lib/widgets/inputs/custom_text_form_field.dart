import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    );
    return TextFormField(
    onChanged: (value) {
    },
    validator: (value) {
      if (value==null) return 'Campo es requerido';
      if (value.isEmpty) return 'Campo es requerido';
      if (value.trim().isEmpty) return 'Campo es requerido';
      return null;
    },
    decoration: InputDecoration(
      enabledBorder: border,
      focusedBorder: border.copyWith(borderSide: BorderSide(
        color: colors.primary,
        width: 2,
      )),
      isDense: true,
      label: Text('data'),
      hintText: ' Placeholder',
    ),
    );
  }
}