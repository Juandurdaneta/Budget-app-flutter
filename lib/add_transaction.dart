import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime selectedDate = DateTime.now();

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
          const Text(
            'Nuevo gasto',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 69, 122, 157),
            ),
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 6.0),
                  child: const Text(
                    'Gasto',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text('Ingreso',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 158, 208, 213),
                    )),
              ],
            ),
          ),
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
