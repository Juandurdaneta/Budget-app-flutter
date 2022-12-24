import 'dart:ffi';

import 'package:budget_app_flutter/widgets/amount_card.dart';
import 'package:budget_app_flutter/widgets/display_latest.dart';
import 'package:budget_app_flutter/widgets/header_amount_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderAmountCard(0),
        Row(
          children: [
            AmountCard(false, 0),
            AmountCard(true, 0),
          ],
        ),
        DisplayLatestMovements()
      ],
    );
  }
}
