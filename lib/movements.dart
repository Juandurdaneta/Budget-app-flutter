import 'package:budget_app_flutter/widgets/transaction_switch.dart';
import 'package:flutter/material.dart';

class Movements extends StatefulWidget {
  const Movements({super.key});

  @override
  State<Movements> createState() => _MovementsState();
}

class _MovementsState extends State<Movements> {
  bool isExpense = true;

  void selectMovement() {
    setState(() {
      isExpense = !isExpense;
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(238, 238, 238, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
