//handle counter page
import 'package:counter_app/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  //creat instance of counter bloc
  //which manages the bloc
  // final CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listener: (context, state) {
        if (state is CounterMaximumValue) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Reached maximum count')));
        } else if (state is CounterMinimumValue) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Reached minimum value')));
        }
      },
      builder: (context, state) {
        if (state is CounterLoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        // handle successful state
        // final count = state.count;

        return Scaffold(
          appBar: AppBar(title: Text('Counter App'), centerTitle: true),
          body: Center(
            child: Column(
              children: [
                // Text('Counter: $count'),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: Text('Increment'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: Text('Decrecrement'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
