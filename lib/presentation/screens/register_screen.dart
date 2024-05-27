// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

import 'package:forms_app/widgets/widgets.dart';
// import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final firstName = registerCubit.state.firstName;
    final lastName = registerCubit.state.lastName;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'First Name',
            onChanged: registerCubit.firstNameChanged,
            errorMessage: firstName.errorMessage,

          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Last Name',
            onChanged:registerCubit.lastNameChanged,
            errorMessage: lastName.errorMessage,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            hint: ' example@email.com',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,

          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Password ${password.value}',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,

          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Confirmar Contraseña',
            // onChanged: (value) {
            //   // Llamamos al método del cubit para verificar si las contraseñas coinciden
            //   registerCubit.checkPasswordMatch(
            //     registerCubit.state.password,
            //     value,
            //   );
            //   _formKey.currentState?.validate();
            // },
            // validator: (value) {
            //   // Validamos que las contraseñas coincidan
            //   if (value != registerCubit.state.password) {
            //     return 'Las contraseñas no coinciden';
            //   }
            //   return null;
            // },
          ),
          SizedBox(
            height: 20,
          ),
          // if (!registerCubit.state.isPasswordMatching)
          //   FilledButton.tonalIcon(
          //     onPressed: null,
          //     icon: Icon(Icons.save),
          //     label: Text('Crear Usuario'),
          //   )
          // else
          //   FilledButton.tonalIcon(
          //     onPressed: () {
          //       final isValid = _formKey.currentState?.validate();
          //       registerCubit.onSubmit();
          //       if (isValid!) {
          //         Future.delayed(Duration(milliseconds: 100));
          //         context.push('/user');
          //       }
          //     },
          //     icon: Icon(Icons.save),
          //     label: Text('Crear Usuario'),
          //   ),
          FilledButton.tonalIcon(
            onPressed: () {
          
              registerCubit.onSubmit();

            },
            icon: Icon(Icons.save),
            label: Text('Crear Usuario'),
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
