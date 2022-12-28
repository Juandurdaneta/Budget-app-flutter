import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TransactionTypeSwitch extends StatefulWidget {
  final bool isExpense;
  final Function handleTouch;
  const TransactionTypeSwitch(this.isExpense, this.handleTouch, {super.key});

  @override
  State<TransactionTypeSwitch> createState() => _TransactionTypeSwitchState();
}

class _TransactionTypeSwitchState extends State<TransactionTypeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(255, 69, 122, 157),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.isExpense
              ? [
                  const Selected(
                    displayText: 'Gasto',
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.handleTouch();
                    },
                    child: const SizedBox(
                      height: double.infinity,
                      width: 135.0,
                      child: Center(
                          child: Text('Ingreso',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 158, 208, 213),
                              ))),
                    ),
                  ),
                ]
              : [
                  GestureDetector(
                    onTap: () {
                      widget.handleTouch();
                    },
                    child: const SizedBox(
                      height: double.infinity,
                      width: 135.0,
                      child: Center(
                          child: Text('Gasto',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 158, 208, 213),
                              ))),
                    ),
                  ),
                  const Selected(
                    displayText: 'Ingreso',
                  )
                ]),
    );
  }
}

class Selected extends StatelessWidget {
  final String displayText;
  const Selected({
    Key? key,
    required this.displayText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 135.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Center(
          child: Text(
        displayText,
        style: const TextStyle(
          fontSize: 16,
        ),
      )),
    );
  }
}
