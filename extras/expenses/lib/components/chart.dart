import 'package:expenses/components/chartBar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final _week = DateFormat('MMMMEEEEd', 'pt_BR').format(DateTime.now());

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < widget.recentTransaction.length; i++) {
        bool sameDay = widget.recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = widget.recentTransaction[i].date.month == weekDay.month;
        bool sameYear = widget.recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += widget.recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat('E', 'pt_BR').format(
            weekDay), // DateFormat('d MMM y').format(weekDay) DateFormat.E().format(weekDay)
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

   @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$_week',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactions.map((tr) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: tr['day'],
                    value: tr['value'],
                    percentage: _weekTotalValue == 0
                        ? 0
                        : (tr['value'] as double) / _weekTotalValue,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
