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
        if (state is CounterLoadingSuccessfulState ||
            state is CounterMaximumValue ||
            state is CounterMinimumValue) {
          int count = 0;
          if (state is CounterLoadingSuccessfulState) {
            count = state.count;
          } else if (state is CounterMaximumValue) {
            count = 10;
          } else if (state is CounterMinimumValue) {
            count = 0;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter App'),
              centerTitle: true,
              backgroundColor: Colors.grey.shade400,
            ),
            body: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: $count', style: TextStyle(fontSize: 22)),
                  SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          counterBloc.add(IncrementCounter());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          counterBloc.add(DecrementCounter());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          counterBloc.add(ResetCounter());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade200,
                        ),
                        child: Text('Reset', style: TextStyle(fontSize: 15)),
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
