import 'package:budget_app_flutter/widgets/transaction_cards.dart';
import 'package:flutter/material.dart';

class DisplayLatestMovements extends StatefulWidget {
  final List transactions;
  final Function deleteTransactions;
  const DisplayLatestMovements(
      {super.key,
      required this.transactions,
      required this.deleteTransactions});

  @override
  State<DisplayLatestMovements> createState() => _DisplayLatestMovementsState();
}

class _DisplayLatestMovementsState extends State<DisplayLatestMovements> {
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
              children: [
                const Text(
                  'Ultimos movimientos',
                  style: TextStyle(fontSize: 17),
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: (() => {}),
                  child: const Text(
                    'Ver todos',
                    style: TextStyle(fontSize: 17, color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            widget.transactions.isNotEmpty
                ? TransactionCards(
                    widget.transactions, widget.deleteTransactions)
                : Container(
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
