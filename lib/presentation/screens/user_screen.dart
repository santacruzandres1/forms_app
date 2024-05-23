import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.go('/'),
        child: const Icon(Icons.exit_to_app),
        ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified, size: 150, color: Colors.green,),
            Text('Registro con éxito', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
          ],
        ),
      ),
    );
  }
}