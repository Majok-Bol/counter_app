//handle counter page
import 'package:counter_app/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  // //load initial state
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   CounterBloc.add(CounterInitial(count: 0));
  // }

  //creat instance of counter bloc
  //which manages the bloc
  final CounterBloc counterBloc = CounterBloc();
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
        switch (state.runtimeType) {
          case CounterLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case CounterLoadingSuccessfulState:
            return Scaffold(
              appBar: AppBar(title: Text('Counter App'), centerTitle: true),
            );
        }
        return Container();
      },
    );
  }
}
