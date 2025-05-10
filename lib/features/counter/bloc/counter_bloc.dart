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
  CounterBloc() : super(CounterInitial(count: 0)) {
    on<IncrementCounter>((event, emit) {
      //increase counter
      _counter++;
      //counter value has changed
      emit(CounterValueChanged(count: _counter));
      //check if counter maximum is reached
      if (_counter == 100) {
        emit(CounterMaximumValue());
      }
      //next decrement counter
      on<DecrementCounter>((event, emit) {
        //reduce counter value
        _counter--;
        //counter value has changed
        emit(CounterValueChanged(count: _counter));
        //check if minimum value is reached
        if (_counter == 0) {
          emit(CounterMinimumValue());
        }
      });
    });
  }
}
