import 'package:expenses/components/authenticate/authenticate.dart';
import 'package:expenses/components/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either Home or Authenticate widget

    return Authenticate();
  }
}