import 'dart:convert';
import 'dart:ffi';

import 'package:budget_app_flutter/models/transaction.dart';
import 'package:budget_app_flutter/widgets/transaction_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool isExpense = true;
  DateTime selectedDate = DateTime.now();
  final notesController = TextEditingController();
  final amountController = TextEditingController();

  void handleTransactionType() {
    setState(() {
      isExpense = !isExpense;
    });
  }

  Future<void> handleSubmit() async {
    try {
      final enteredNotes = notesController.text;
      final enteredAmount = double.parse(amountController.text);
      var uuid = Uuid();

      final newTx = {
        "id": uuid.v1(),
        "notes": enteredNotes,
        "amount": enteredAmount,
        "isExpense": isExpense,
        "date": selectedDate.toIso8601String(),
      };

      if (enteredNotes.isEmpty || enteredAmount < 0) {
        return;
      }

      // CODE TO STORE DATA

      // create storage

      final prefs = await SharedPreferences.getInstance();

      final String? encodedTx = prefs.getString('MOVEMENTS');

      if (encodedTx != null) {
        List decodedTx = jsonDecode(encodedTx);
        decodedTx.add(newTx);
        await prefs.setString('MOVEMENTS', jsonEncode(decodedTx));
      } else {
        final List<Object> txList = [];
        txList.add(newTx);
        await prefs.setString('MOVEMENTS', jsonEncode(txList));
      }

      // END CODE TO STORE DATA

      amountController.text = "";
      notesController.text = "";

      setState(() {
        selectedDate = DateTime.now();
      });
      const snackBar = SnackBar(
        content: Text('Transaccion guardada exitosamente!'),
        backgroundColor: Colors.green,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      var snackBar = SnackBar(
        content: Text('Algo ha salido mal... \n${e.toString()}'),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
            TextField(
              decoration: const InputDecoration(labelText: 'Cuanto?'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Notas'),
              controller: notesController,
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
                onPressed: handleSubmit,
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
