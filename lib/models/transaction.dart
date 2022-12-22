import 'package:flutter/foundation.dart';

class Transaction {
  String notes;
  double amount;
  bool isExpense;
  DateTime date;

  Transaction({
    required this.notes,
    required this.amount,
    required this.isExpense,
    required this.date,
  });
}
