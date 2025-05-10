part of 'counter_bloc.dart';

//events are signals sent when something happens
//eg button click
@immutable
abstract class CounterEvent {}

//increment counter
class IncrementCounter extends CounterEvent {}

//decrement counter
class DecrementCounter extends CounterEvent {}

//reset the counter
class ResetCounter extends CounterState {}
