part of 'counter_bloc.dart';

//states are the results to show
//after handling events
//eg show users logged in
//or display products
@immutable
abstract class CounterState {}

//start count at 0
class CounterInitial extends CounterState {
  final int count;
  CounterInitial({required this.count});
}

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
class CounterLoadingSuccessfulState extends CounterState {}

//check if error occurred during loading
class CounterErrorLoadingState extends CounterState {}
