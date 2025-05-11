part of 'counter_bloc.dart';

//states are the results to show
//after handling events
//eg show users logged in
//or display products
@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

//check if value changed
class CounterValueChanged extends CounterState {
  final int count;
  CounterValueChanged({required this.count});
}

//maximum increment value
class CounterMaximumValue extends CounterState {}

//minimum decrement value
class CounterMinimumValue extends CounterState {}

//check loading state
class CounterLoadingState extends CounterState {}

//check if successfully loaded
class CounterLoadingSuccessfulState extends CounterState {
  final int count;

  CounterLoadingSuccessfulState({required this.count});
}

//check if error occurred during loading
class CounterErrorLoadingState extends CounterState {}
