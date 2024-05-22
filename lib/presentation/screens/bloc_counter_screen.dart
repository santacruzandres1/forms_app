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
    // context.read<CounterBloc>().add(CounterIncreased(value));//--->Asi lo hizo Fernando
// BlocProvider.of<CounterBloc>(context).add(CounterIncreased(value));
BlocProvider.of<CounterBloc>(context).increaseCounterBy(value);//disparando el evento desde el bloc y no desde el boton
  }
  //NOTA: Se utiliza BlocProvider.of() para acceder al Bloc de forma organizada, segura y eficiente, siguiendo las mejores prácticas de inyección de dependencias y gestión del ciclo de vida.

  void resetCounter(BuildContext context, [int value = 0]) {
    // BlocProvider.of<CounterBloc>(context).add(const CounterReseted());
    BlocProvider.of<CounterBloc>(context).resetCounter();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  context.select((CounterBloc transactionBloc)=> Text('Bloc Counter ${transactionBloc.state.transactionCount}')),
        actions: [
          IconButton(onPressed: (){
                resetCounter(context);
          }, icon: const Icon(Icons.restart_alt_outlined)),
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