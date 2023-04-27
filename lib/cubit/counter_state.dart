part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int count;
  const CounterState({this.count = 0});
}

class CounterInitial extends CounterState {
  const CounterInitial({super.count = 0});
}
