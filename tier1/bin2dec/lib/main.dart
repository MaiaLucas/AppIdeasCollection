import 'package:bin2dec/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF212121),
      systemNavigationBarColor: Color(0xFF212121) 
      )
    );

    return MaterialApp(
      
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.white,
        canvasColor: Colors.grey[900],
      ),
      debugShowCheckedModeBanner: false,
      home: ConverterBin2Dec(),
    );
  }
}