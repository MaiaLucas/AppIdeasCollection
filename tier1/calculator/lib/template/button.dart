import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  static const DARK      = Colors.black12;
  static const GREEN     = Colors.green;
  static const DEFAULT   = Colors.black12;
  static const OPERATION = Colors.green ;

  final String text;
  final bool big;
  final Color color;
  final Color textColor;
  final void Function(String) cb;

  Button({
    @required this.text,
    this.big = false,
    this.color = DEFAULT,
    this.textColor = Colors.white,
    @required this.cb,
  });

  Button.big({
    @required this.text,
    this.big = true,
    this.color = DEFAULT,
    this.textColor = DEFAULT,
    @required this.cb,
  });

  Button.operation({
    @required this.text,
    this.big = false,
    this.color = OPERATION,
    this.textColor = Colors.black,
    @required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: RaisedButton(
        color: this.color,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 32,
          ),
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}