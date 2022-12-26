import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCards extends StatelessWidget {
  final List transactions;
  TransactionCards(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map(
      (tx) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10.0, top: 2),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${tx['notes']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                          DateFormat.yMMMd().format(DateTime.parse(tx['date'])))
                    ],
                  ),
                ),
                FittedBox(
                  child: Text(
                    "${tx['isExpense'] ? '-' : ''}\$${tx['amount'].toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 17,
                        color: tx['isExpense'] ? Colors.red : Colors.green),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ).toList());
  }
}
