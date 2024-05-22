import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
BlocProvider.of<CounterBloc>(context).add(CounterIncreased(value));
  }// Se utiliza BlocProvider.of() para acceder al Bloc de forma organizada, segura y eficiente, siguiendo las mejores prácticas de inyección de dependencias y gestión del ciclo de vida.


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.restart_alt_outlined)),
        ],
        ),
      body:  Center(
        child: context.select((CounterBloc counterBloc) => Text('Counter value: ${counterBloc.state.counter}'),),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: (){
              increaseCounterBy(context, 3);

            },
            child: const Text('+3'),
            ),
            const SizedBox(height: 10,),
            FloatingActionButton(
              heroTag: '2',
            onPressed: (){
              increaseCounterBy(context, 2);
              


            },
            child: const Text('+2'),
            ),
            const SizedBox(height: 10,),
              FloatingActionButton(
              heroTag: '3',
            onPressed: (){
              increaseCounterBy(context);
            },
            child: const Text('+1'),
            ),
            const SizedBox(height: 10,),
    
        ],
      ),
    );
  }
}