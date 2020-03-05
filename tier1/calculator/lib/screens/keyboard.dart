import 'package:calculator/template/button.dart';
import 'package:calculator/template/buttonRow.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {

  final void Function(String) cb;

  Keyboard(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button(text: 'AC', textColor: Colors.deepOrangeAccent, cb: cb,),
            Button(text: 'C', textColor: Colors.orangeAccent, cb: cb,),
            Button(text: '%', textColor: Button.GREEN, cb: cb,),
            Button(text: '/', textColor: Button.GREEN, cb: cb,),
          ]),
          ButtonRow([
            Button(text: '7', cb: cb,),
            Button(text: '8', cb: cb,),
            Button(text: '9', cb: cb,),
            Button(text: 'x', textColor: Button.GREEN, cb: cb,),
          ]),
          ButtonRow([
            Button(text: '4', cb: cb,),
            Button(text: '5', cb: cb,),
            Button(text: '6', cb: cb,),
            Button(text: '-', textColor: Button.GREEN, cb: cb,),
          ]),
          ButtonRow([
            Button(text: '1', cb: cb,),
            Button(text: '2', cb: cb,),
            Button(text: '3', cb: cb,),
            Button(text: '+', textColor: Button.GREEN, cb: cb,),
          ]),
          ButtonRow([
            Button(text: '+/-', cb: cb,),
            Button(text: '0', cb: cb,),
            Button(text: '.', cb: cb,),
            Button.operation(text: '=', cb: cb,),
          ]),
        ],

      ),
    );
  }
}