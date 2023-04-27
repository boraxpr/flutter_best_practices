import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_best_practices/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'cubit/lock_cubit.dart';
// Cubit
// A Cubit is a subset of the Bloc pattern which has no notion of events and relies on methods to emit new states.
// Cubits are ideal for simple use cases that do not require events and/or transformations.
// Cubits are also ideal for use cases where you want to expose a single synchronous stream of state.
// Cubits are also a great choice for beginners who want to start learning about the Bloc pattern.
// Cubits are also a great choice for Flutter widgets that are not mounted on the widget tree.
// Cubits are also a great choice for use cases where you want to emit new states imperatively.
// Cubits are also a great choice for use cases where you want to emit new states synchronously.
// Cubits are also a great choice for use cases where you want to emit new states in response to method calls.
// Cubits are also a great choice for use cases where you want to emit new states in response to external changes (e.g. Firebase Firestore).

void main() {
  runApp(const MaterialApp(
    home: CountingPage(),
  ));
  log('main');
}

//Stateless build once and never change
//Does stateful widget build again when state change?
//Stateful widget build again when state change
class CountingPage extends StatelessWidget {
  const CountingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // BlocProvider is a Flutter widget from the flutter_bloc package
    // that provides a bloc to its children via BlocProvider.of<CounterCubit>(context)

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
            // The context.read method can be used to access the bloc
            // and call methods on it
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
// Stateful Widget vs BLoc Pattern
// why use bloc pattern ? 1. state management 2. code reuse 3. testability 4. code organization
// 5. asynchronous events 6. stream of states 7. single source of truth
// 8. separation of concerns 9. debugging 10. hot reload
// 11. performance 12. scalability 13. simplicity 14. predictability
