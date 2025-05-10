//handle home page
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() {
  // }
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
    );
  }
}
