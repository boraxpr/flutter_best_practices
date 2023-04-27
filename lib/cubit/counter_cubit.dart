import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  increment() {
    emit(CounterInitial(count: state.count + 1));
  }

  decrement() {
    emit(CounterInitial(count: state.count - 1));
  }
}
