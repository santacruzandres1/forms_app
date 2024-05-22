// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:forms_app/widgets/widgets.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: 10, ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 200,),
            _RegisterForm(),
            
              SizedBox(height: 20,)
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
    return  Form(
      child: Column(
        children: [
          CustomTextFormField(),
          SizedBox(height: 10,),
          CustomTextFormField(),
          SizedBox(height: 20,),
          FilledButton.tonalIcon(onPressed: (){}, icon: Icon(Icons.save), label: Text('Crear Usuario'),),
            
        ],
      ),
    );
  }
}
