import 'package:calculator/model/memory.dart';
import 'package:calculator/screens/display.dart';
import 'package:calculator/screens/keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {

  final Memory memory = Memory();

  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Display(memory.value),
          Keyboard(_onPressed)
        ],
      ),
    );
  }
}