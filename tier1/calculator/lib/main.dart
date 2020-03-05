import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculatorHome.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF100a1c) ,
      systemNavigationBarColor: Color(0xFF100a1c) 
      )
    );

    return MaterialApp(
      
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF100a1c),
        accentColor: Color(0xFF100a1c),
        canvasColor: Color(0xFF100a1c),
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}