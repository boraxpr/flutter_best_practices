part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int count;
  const CounterState(this.count);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterChanged extends CounterState {
  final int newCount;
  const CounterChanged(this.newCount) : super(newCount);
}
