import 'package:budget_app_flutter/widgets/transaction_cards.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DisplayLatestMovements extends StatefulWidget {
  const DisplayLatestMovements({super.key});

  @override
  State<DisplayLatestMovements> createState() => _DisplayLatestMovementsState();
}

class _DisplayLatestMovementsState extends State<DisplayLatestMovements> {
  List transactions = [];

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  void fetchTransactions() async {
    const storage = FlutterSecureStorage();
    String? previouslyStoredTXEncoded = await storage.read(key: 'MOVEMENTS');
    List previouslyStoredTxDecoded = jsonDecode(previouslyStoredTXEncoded!);

    setState(() {
      transactions = previouslyStoredTxDecoded;
    });
  }

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
                  onPressed: (() => (print('hello'))),
                  child: const Text(
                    'Ver todos',
                    style: TextStyle(fontSize: 17, color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            transactions.isNotEmpty
                ? TransactionCards(transactions)
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
