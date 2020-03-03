import 'package:flutter/material.dart';

class InputField extends StatefulWidget {

  final String label;
  final bool readOnly;
  final bool enabled;
  final Icon icon;
  final Function iconAction;
  final TextEditingController controller;

  InputField({
    @required this.label,
    @required this.readOnly,
    @required this.enabled,
    @required this.icon,
    @required this.iconAction,
    @required this.controller,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: widget.label,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            controller: widget.controller,
            readOnly: widget.readOnly,
            enabled: widget.enabled,
          ),
        ),
        IconButton(icon: widget.icon, onPressed: widget.iconAction)
      ],
    );
  }
}