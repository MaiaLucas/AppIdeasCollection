import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final TextEditingController controller;
  final int type;

  Button({ @required this.controller, @required this.type});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  void binaryCounter(String val) {
    widget.controller.text += val;
  }
  
  List<int> _input;

  void listInput(int type) {
    if(type == 0) {
      _input = [0, 1];
    } else {
      _input = [0,1,2,3,4,5,6,7,8,9];
    }
  }

  @override
  void initState() {
    listInput(widget.type);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0, 
      runSpacing: 10.0, 
      children: _input.map((int i) {
        return RaisedButton(
          color: Colors.black,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(25.0),
          splashColor: Colors.blueAccent,
          onPressed: () => binaryCounter(i.toString()),
          child: Text(
            i.toString(),
            style: TextStyle(
              fontSize: 30.0,
            ),
            ),
        );
      }).toList(),
    );
  }
}