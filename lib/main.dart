import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountingState {
  final int count;

  CountingState(this.count);
}

class CountingCubit extends Cubit<CountingState> {
  CountingCubit() : super(CountingState(0));

  void increment() => emit(CountingState(state.count + 1));
  void decrement() => emit(CountingState(state.count - 1));
}

class CountingPage extends StatelessWidget {
  const CountingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountingCubit(),
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
      body: BlocBuilder<CountingCubit, CountingState>(
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
            onPressed: () => context.read<CountingCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CountingCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}

main() => runApp(const MaterialApp(home: CountingPage()));
