import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transactionForm.dart';
import 'package:expenses/components/transactionList.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(
          days: 7,
        ),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _editTransaction(String title, double value, DateTime date) {

    print('$title - $value - $date');
    setState(() {
    });
    Navigator.of(context).pop();
  }

  double get _weekTotalValue {
    return _transactions.fold(0.0, (sum, tr) {
      return sum + tr.value;
    });
  }
  
  void _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id );
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    _weekTotalValue > 0 ? 'Total: ' : '',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    _weekTotalValue > 0 ?' - R\$ ${_weekTotalValue.toStringAsFixed(2)}' : 'Sem despesas',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 5,),
            TransactionList(_transactions, _removeTransaction, _editTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}
