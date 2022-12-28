import 'dart:ffi';

import 'package:budget_app_flutter/widgets/amount_card.dart';
import 'package:budget_app_flutter/widgets/display_latest.dart';
import 'package:budget_app_flutter/widgets/header_amount_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List transactions = [];

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  void fetchTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedTx = prefs.getString('MOVEMENTS');
    List previouslyStoredTxDecoded =
        encodedTx != null ? jsonDecode(encodedTx) : [];

    previouslyStoredTxDecoded.sort(((a, b) => b['date'].compareTo(a['date'])));

    setState(() {
      transactions = previouslyStoredTxDecoded;
    });
  }

  Future<void> _deleteTransaction(transaction) async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedTx = prefs.getString('MOVEMENTS');
    List previouslyStoredTxDecoded =
        encodedTx != null ? jsonDecode(encodedTx) : [];

    previouslyStoredTxDecoded
        .removeWhere((tx) => tx['id'] == transaction['id']);

    await prefs.setString('MOVEMENTS', jsonEncode(previouslyStoredTxDecoded));

    previouslyStoredTxDecoded.sort(((a, b) => b['date'].compareTo(a['date'])));

    setState(() {
      transactions = previouslyStoredTxDecoded;
    });

    Navigator.of(context).pop();
  }

  double get totalAmount {
    return transactions.fold(0, (previousValue, element) {
      if (!element['isExpense']) {
        return previousValue + element['amount'];
      } else {
        return previousValue - element['amount'];
      }
    });
  }

  double get totalIncome {
    return transactions.fold(0, (previousValue, element) {
      if (!element['isExpense']) {
        return previousValue + element['amount'];
      } else {
        return previousValue;
      }
    });
  }

  double get totalExpense {
    return transactions.fold(0, (previousValue, element) {
      if (element['isExpense']) {
        return previousValue + element['amount'];
      } else {
        return previousValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderAmountCard(totalAmount),
        Row(
          children: [
            AmountCard(false, totalIncome),
            AmountCard(true, totalExpense),
          ],
        ),
        DisplayLatestMovements(
          transactions: transactions,
          deleteTransactions: _deleteTransaction,
        )
      ],
    );
  }
}
