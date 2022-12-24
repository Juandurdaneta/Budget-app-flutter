import 'package:flutter/material.dart';

class AmountCard extends StatelessWidget {
  final bool isExpense;
  final int amount;

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
            Text(
              isExpense ? '-\$$amount' : '\$$amount',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }
}
