part of 'lock_cubit.dart';

@immutable
abstract class LockState {
  const LockState();
}

class LockInitial extends LockState {
  const LockInitial();
}
