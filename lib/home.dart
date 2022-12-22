import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderAmountCard(0),
        Row(
          children: [
            AmountCard(false, 0),
            AmountCard(true, 0),
          ],
        ),
        DisplayLatestMovements()
      ],
    );
  }
}

class DisplayLatestMovements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(238, 238, 238, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Ultimos movimientos',
                  style: TextStyle(fontSize: 17),
                ),
                Spacer(),
                Text(
                  'Ver todos',
                  style: TextStyle(fontSize: 17, color: Colors.blueAccent),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Center(
                  child: Column(
                children: const [
                  Text(
                    'Aun no se han agregado \nmovimientos...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Agregar',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

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

class HeaderAmountCard extends StatelessWidget {
  final double amount;
  HeaderAmountCard(this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Balance Total',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$${amount.floor()}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
