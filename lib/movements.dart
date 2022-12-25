import 'dart:convert';

import 'package:budget_app_flutter/widgets/no_movements_text.dart';
import 'package:budget_app_flutter/widgets/transaction_cards.dart';
import 'package:budget_app_flutter/widgets/transaction_switch.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Movements extends StatefulWidget {
  const Movements({super.key});

  @override
  State<Movements> createState() => _MovementsState();
}

class _MovementsState extends State<Movements> {
  bool isExpense = true;
  List transactions = [];

  void selectMovement() {
    setState(() {
      isExpense = !isExpense;
    });
  }

  List get expensesValues {
    return transactions.where((tx) => tx['isExpense'] == true).toList();
  }

  List get incomeValues {
    return transactions.where((tx) => tx['isExpense'] == false).toList();
  }

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  void fetchTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedTx = prefs.getString('MOVEMENTS');
    List previouslyStoredTxDecoded = jsonDecode(encodedTx!);

    setState(() {
      transactions = previouslyStoredTxDecoded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Movimientos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          TransactionTypeSwitch(isExpense, selectMovement),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(238, 238, 238, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: isExpense
                  ? expensesValues.isNotEmpty
                      ? TransactionCards(expensesValues)
                      : const NoMovementsFound(displayText: 'gastos')
                  : incomeValues.isNotEmpty
                      ? TransactionCards(incomeValues)
                      : const NoMovementsFound(displayText: 'ingresos'),
            ),
          )
        ],
      ),
    );
  }
}
