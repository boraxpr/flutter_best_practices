import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_best_practices/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MaterialApp(home: CountingPage()));
  log('main');
}

class CountingPage extends StatelessWidget {
  const CountingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CountingView(),
    );
  }
}

class CountingView extends StatelessWidget {
  const CountingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counting')),
      // BlocBuilder is a widget that listens to state changes in the bloc
      // and rebuilds the UI with the new state
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(
              '${state.count}',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
