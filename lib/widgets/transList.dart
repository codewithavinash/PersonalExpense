import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_Item.dart';

class TransList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/fonts/images/rocket.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (context, index) {
                //   return Card(
                //     child: Row(
                //       children: <Widget>[
                //         Container(
                //           margin:
                //               EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Theme.of(context).primaryColorDark,
                //                 width: 2),
                //           ),
                //           padding: EdgeInsets.all(10),
                //           child: Text(
                //             '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                //             style: Theme.of(context).textTheme.headline6,
                //           ),
                //         ),
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               transactions[index].title,
                //               style: Theme.of(context).textTheme.headline6,
                //             ),
                //             Text(
                //               DateFormat.yMMMd().format(transactions[index].date),
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Colors.grey,
                //               ),
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   );
                return TransactionItem(
                  transaction: transactions[index],
                  deleteTx: deleteTx,
                );
              },
              itemCount: transactions.length,
              // children: transactions.map((tx) {}
            ),
      //.toList()
    );
  }
}
