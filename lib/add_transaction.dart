import 'package:budget_app_flutter/widgets/transaction_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool isExpense = true;
  DateTime selectedDate = DateTime.now();

  void handleTransactionType() {
    setState(() {
      isExpense = !isExpense;
    });
  }

  // date selector
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nuevo ${isExpense ? "Gasto" : "Ingreso"}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          TransactionTypeSwitch(isExpense, handleTransactionType),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Cuanto?'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Notas'),
            ),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Fecha'),
              TextButton(
                  onPressed: () => _selectDate(context),
                  child: Row(
                    children: [
                      Text(DateFormat.yMMMd('es').format(selectedDate)),
                      const SizedBox(width: 5),
                      const Icon(Icons.calendar_month)
                    ],
                  )),
            ]),
            const SizedBox(height: 20),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(width: 1.0, color: Colors.black),
                ),
                onPressed: (() {}),
                child: const Text(
                  'Agregar',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ))
          ]),
        ],
      ),
    );
  }
}
