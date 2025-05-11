//handle counter page
import 'package:counter_app/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  //dispatch initial event
  @override
  void initState() {
    // TODO: implement initState
    counterBloc.add(CounterInitialEvent());
    super.initState();
  }

  //creat instance of counter bloc
  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: counterBloc,
      listener: (context, state) {
        if (state is CounterMaximumValue) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Reached maximum value')));
        }
        if (state is CounterMinimumValue) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Reached minimum value')));
        }

        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is CounterLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is CounterLoadingSuccessfulState) {
          return Scaffold(
            appBar: AppBar(title: Text('Counter App'), centerTitle: true),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: ${state.count}'),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          counterBloc.add(IncrementCounter());
                        },
                        child: Text('+'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          counterBloc.add(DecrementCounter());
                        },
                        child: Text('-'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          counterBloc.add(ResetCounter());
                        },
                        child: Text('Reset'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
