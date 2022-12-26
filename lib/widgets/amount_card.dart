import 'package:flutter/material.dart';

class AmountCard extends StatelessWidget {
  final bool isExpense;
  final double amount;

  AmountCard(this.isExpense, this.amount);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      width: 159.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isExpense ? 'Egreso total' : 'Ingreso Total',
              style: const TextStyle(fontSize: 18.0),
            ),
            FittedBox(
              child: Text(
                isExpense
                    ? '-\$${amount.toStringAsFixed(2)}'
                    : '\$${amount.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
