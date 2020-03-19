import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'Nenhuma transação cadastrada!',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemCount: widget.transactions.length,
            itemBuilder: (ctx, index) {
              final tr = widget.transactions[index];

              return Dismissible(
                key: Key(tr.id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  widget.onRemove(tr.id);
                },

                background: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.redAccent
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: const Icon(
                        Icons.delete_outline,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    dense: true,
                    onLongPress: () {
                      print('ok');
                    },
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y', "pt_BR").format(tr.date),
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: Text(
                      'R\$${tr.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
