import 'package:flutter/material.dart';

class NoMovementsFound extends StatelessWidget {
  final String displayText;
  const NoMovementsFound({
    Key? key,
    required this.displayText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Center(
          child: Column(
        children: [
          Text(
            'Aun no se han agregado \n$displayText...',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Agregar',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      )),
    );
  }
}
