import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

//bloc
//handles what to do when
//something happens
//its like the boss
//that listens to events and decides
//what to do
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // ignore: unused_field
  int _counter = 0;
  //start black page
  // ignore: empty_constructor_bodies
  CounterBloc() : super(CounterInitial()) {
    //initial event

    on<CounterInitialEvent>(counterInitialEvent);
    //when one clicks increment counter button
    on<IncrementCounter>(incrementCounter);
    //when one clicks the decrement button
    on<DecrementCounter>(decrementCounter);
    //when one clicks reset counter button
    on<ResetCounter>(resetCounter);
  }
  //first state
  //wait for 3 seconds
  //show loading icon
  FutureOr<void> counterInitialEvent(
    CounterInitialEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(CounterLoadingSuccessfulState(count: 0));
  }
  //handle increment event button

  FutureOr<void> incrementCounter(
    IncrementCounter event,
    Emitter<CounterState> emit,
  ) {
    _counter++;
    emit(CounterLoadingSuccessfulState(count: _counter));
    //check if maximum counter is reached
    if (_counter >= 10) {
      emit(CounterMaximumValue());
    }
  }

  //handle decrement event button
  FutureOr<void> decrementCounter(
    DecrementCounter event,
    Emitter<CounterState> emit,
  ) {
    _counter--;
    emit(CounterLoadingSuccessfulState(count: _counter));
    //check if minimum counter is reached
    if (_counter <= 0) {
      emit(CounterMinimumValue());
    }
  }
  //handle reset counter button

  FutureOr<void> resetCounter(ResetCounter event, Emitter<CounterState> emit) {
    _counter = 0;
    emit(CounterLoadingSuccessfulState(count: _counter));
  }
}
