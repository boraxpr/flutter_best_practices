import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_best_practices/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //A method to random FloatingActionButtonLocation
  FloatingActionButtonLocation randomFloatingActionButtonLocation() {
    final random = Random.secure();
    final locations = [
      FloatingActionButtonLocation.endTop,
      FloatingActionButtonLocation.endFloat,
      FloatingActionButtonLocation.startTop,
      FloatingActionButtonLocation.startFloat,
    ];
    return locations[random.nextInt(locations.length)];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: state.count % 2 == 0
                  ? Colors.white
                  : Colors.black.withOpacity(0.5),
              floatingActionButtonLocation:
                  randomFloatingActionButtonLocation(),
              floatingActionButton: FloatingActionButton(
                highlightElevation: 20,
                backgroundColor: //random color
                    Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(Random().nextDouble() * 1),
                splashColor: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(Random().nextDouble() * 1),
                onPressed: () {
                  context.read<CounterCubit>().changeCount();
                },
                child: AutoSizeText(
                  '${state.count}',
                  style: const TextStyle(fontSize: 10000),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
