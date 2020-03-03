import 'package:bin2dec/conversor.dart';
import 'package:bin2dec/template/button.dart';
import 'package:bin2dec/template/inputField.dart';
import 'package:flutter/material.dart';

Conversor converter = Conversor();

TextEditingController _binaryController = TextEditingController();
TextEditingController _decimalController = TextEditingController();

void reset() {
  _binaryController.text  = '';
  _decimalController.text = '';
}
void copyDecimal(BuildContext context) {
  
}

void Function(String) _convert = (input) {
  if (input == '') _binaryController.text = '0';
  return _decimalController.text = converter.bin2dec(input).toString();
};

void binaryCounter(String val) {
  _binaryController.text += val;
}

class ConvertForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          InputField(
            label:'Decimal',
            icon: Icon(Icons.close),
            readOnly: true,
            iconAction: reset,
            enabled: false,
            controller: _decimalController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          InputField(
            label:'Binary',
            icon: Icon(Icons.close),
            readOnly: true,
            iconAction: reset,
            enabled: false,
            controller: _binaryController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Button(controller: _binaryController, type: 0,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          RaisedButton(
            padding: EdgeInsets.all(25.0),
            color: Colors.black,
            child: Text(
              'Convert!',
              style: TextStyle(
                fontSize: 20.0
              ),
              ),
            onPressed: () => _convert(_binaryController.text),
          ),
        ],
      ),
    );
  }
}