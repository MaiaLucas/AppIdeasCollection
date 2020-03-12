import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  final void Function(String, double, DateTime) onEdit;

  TransactionList(this.transactions, this.onRemove, this.onEdit);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: widget.transactions.isEmpty
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
                  onDismissed: (direction) {
                    widget.onRemove(tr.id);
                  },
                  background: Container(
                    color: Theme.of(context).errorColor,
                    height: 10,
                    width: 10,
                  ),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: Text('R\$${tr.value}'),
                      dense: true,
                      onLongPress: () {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('Edição?!'),
                            content: Text('Deseja editar a transação (${tr.title})?!'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('No'),
                                onPressed: () {print('context');},
                              ),
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () => widget.onEdit(tr.title, tr.value, tr.date),
                              ),
                            ],
                            elevation: 25,
                          )
                        );
                      },
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y', "pt_BR").format(tr.date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Theme.of(context).errorColor,
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
