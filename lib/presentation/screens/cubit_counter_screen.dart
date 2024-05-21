import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    // final counterIncrease = context.read<CounterCubit>().increaseBy;
    return Scaffold(
      appBar: AppBar(
        title:  context.select((CounterCubit value){
          return Text('Cubit Counter ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              }, icon: const Icon(Icons.restart_alt_outlined)),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: _CounterButtons(),
      // floatingActionButton: _CounterButtons(),
    );
  }
}

class _CounterButtons extends StatelessWidget {

  // final void Function(int value) counterIncrease;

  @override
  Widget build(BuildContext context) {
    final counterIncrease = BlocProvider.of<CounterCubit>(context).increaseBy;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: '1',
          onPressed: () {
            counterIncrease(3);
            
          },
          child: const Text('+3'),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          heroTag: '2',
          onPressed: () {
            counterIncrease(2);
          },
          child: const Text('+2'),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          heroTag: '3',
          onPressed: (){
          counterIncrease(1);
          },
          child: const Text('+1'),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
