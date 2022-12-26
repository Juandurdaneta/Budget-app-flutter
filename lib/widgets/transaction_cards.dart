import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionCards extends StatelessWidget {
  final List transactions;
  final Function deleteTransaction;
  TransactionCards(this.transactions, this.deleteTransaction);

  void _openModalOptions(BuildContext ctx, transaction) {
    showMaterialModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () => deleteTransaction(transaction),
              child: Row(
                children: const [
                  Icon(Icons.delete),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map(
      (tx) {
        return GestureDetector(
          onTap: () => _openModalOptions(context, tx),
          child: Container(
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
                        Text(DateFormat.yMMMd()
                            .format(DateTime.parse(tx['date'])))
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
          ),
        );
      },
    ).toList());
  }
}
