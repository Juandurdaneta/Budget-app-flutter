import 'package:budget_app_flutter/add_transaction.dart';
import 'package:budget_app_flutter/home.dart';
import 'package:budget_app_flutter/models/transaction.dart';
import 'package:budget_app_flutter/movements.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My app',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // index
  int _selectedIndex = 0;

  // transactions
  final List<Transaction> _userTransaction = [
    Transaction(
      notes: 'New shoes',
      amount: 129.99,
      isExpense: true,
      date: DateTime.now(),
    ),
    Transaction(
      notes: 'Dinner',
      amount: 12.99,
      isExpense: true,
      date: DateTime.now(),
    )
  ];

  // add new transaction

  void _addNewTransaction(String txNotes, double txAmount, bool txIsExpense) {
    final newTx = Transaction(
      notes: txNotes,
      amount: txAmount,
      isExpense: txIsExpense,
      date: DateTime.now(),
    );
  }

  // styles
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  // list of widgets to display (texts)
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    AddTransaction(),
    Movements()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Agregar Movimiento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Movimientos',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
