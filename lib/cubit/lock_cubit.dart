import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lock_state.dart';

class LockCubit extends Cubit<LockState> {
  LockCubit() : super(const LockInitial());
}
