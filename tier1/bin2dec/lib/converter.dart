import 'package:bin2dec/binaryForm.dart';
import 'package:bin2dec/decimalForm.dart';
// import 'package:bin2dec/form.dart';
import 'package:flutter/material.dart';

class ConverterBin2Dec extends StatefulWidget {
  @override
  _ConverterBin2DecState createState() => _ConverterBin2DecState();
}

class _ConverterBin2DecState extends State<ConverterBin2Dec> {
  int tabController = 0;
  final List<Widget> pages = [
    BinaryForm(),
    DecimalForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary to Decimal')
      ),
      body: pages[tabController],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        unselectedItemColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 25,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            title: Text('Binary'),
            activeIcon: Icon(Icons.filter_1, color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_9),
            title: Text('Decimal'),
            activeIcon: Icon(Icons.filter_1, color: Colors.white),
          ),
        ]
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      tabController = index;
    });
  }
}