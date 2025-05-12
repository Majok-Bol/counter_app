part of 'counter_bloc.dart';

//events are signals sent when something happens
//eg button click
@immutable
//class to create events
//blueprint for creating events
//that can take place
abstract class CounterEvent {}

//initial event
//when one opens the app
class CounterInitialEvent extends CounterEvent {}

//increment counter
//when one clicks increment button
class IncrementCounter extends CounterEvent {}

//decrement counter
//when one clicks the decrement button
class DecrementCounter extends CounterEvent {}

//reset the counter
//when one clicks the reset button
class ResetCounter extends CounterEvent {}
