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
    //on increment button click
    on<CounterInitialEvent>(counterInitialEvent);
    on<IncrementCounter>(incrementCounter);
    on<DecrementCounter>(decrementCounter);
    on<ResetCounter>(resetCounter);
  }
  FutureOr<void> counterInitialEvent(
    CounterInitialEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(CounterLoadingSuccessfulState(count: 0));
  }

  FutureOr<void> incrementCounter(
    IncrementCounter event,
    Emitter<CounterState> emit,
  ) {
    _counter++;
    emit(CounterLoadingSuccessfulState(count: _counter));
    if (_counter == 100) {
      emit(CounterMaximumValue());
    }
  }

  FutureOr<void> decrementCounter(
    DecrementCounter event,
    Emitter<CounterState> emit,
  ) {
    _counter--;
    emit(CounterLoadingSuccessfulState(count: _counter));
    if (_counter == 0) {
      emit(CounterMinimumValue());
    }
  }

  FutureOr<void> resetCounter(ResetCounter event, Emitter<CounterState> emit) {
    _counter = 0;
    emit(CounterLoadingSuccessfulState(count: _counter));
  }
}
