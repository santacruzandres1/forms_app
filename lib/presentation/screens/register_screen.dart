// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:forms_app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 200,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? email;
  String? pass;
  String? checkPass;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'First Name',
            onChanged: (value) => firstName = value,
            validator: (value) {
              final characterRegExp =
                  RegExp(r'.*[!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]+');
              final numberCaseRegExp = RegExp(r'[0-9]');
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Más de 6 letras';
              if (characterRegExp.hasMatch(value))return 'Este campo no admite caracteres especiales';
              if (numberCaseRegExp.hasMatch(value))return 'Este campo no admite números';
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Last Name',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Más de 6 letras';
              return null;
            },
            onChanged: (value) => lastName = value,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            hint: ' example@email.com',
            onChanged: (value) => email = value,
            validator: (value) {
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (value!.trim().isEmpty) return 'Campo requerido';
              if (!emailRegExp.hasMatch(value))
                return 'No tiene formato de correo: example@email.com';

              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) => pass = value,
            validator: (value) {
              final characterRegExp =
                  RegExp(r'.*[!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]+');
              final lowerCaseRegExp = RegExp(r'[a-z]');
              final upperCaseRegExp = RegExp(r'[A-Z]');
              final numberCaseRegExp = RegExp(r'[0-9]');

              if (value!.trim().isEmpty) return 'Campo requerido';
              if (value.length < 8) {
                return 'La contraseña ebe contener 8 o más caracteres';
              }
              if (!upperCaseRegExp.hasMatch(value))
                return 'Debe contener al menos 1 letra Mayúscula';
              if (!lowerCaseRegExp.hasMatch(value))
                return 'Debe contener al menos 1 letra minúscula';
              if (!numberCaseRegExp.hasMatch(value))
                return 'Debe contener al menos 1 número';
              if (!characterRegExp.hasMatch(value))
                return 'Debe contener al menos 1 caracter especial';
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Confirm your Password',
            obscureText: true,
            onChanged: (value) => checkPass = value,
            validator: (value) {
              if (value != pass) return 'Las contraseñas no coinciden';
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () async {
              final isValid = _formKey.currentState?.validate();
              if (isValid!) {
                await Future.delayed(Duration(
                    milliseconds:
                        100)); // Short delay to simulate an asynchronous operation
                // ignore: use_build_context_synchronously
                context.push('/user');
              }
            },
            icon: Icon(Icons.save),
            label: Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
