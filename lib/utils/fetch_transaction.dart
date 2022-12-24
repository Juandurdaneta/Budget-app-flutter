import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<List> fetchTransactions() async {
  const storage = FlutterSecureStorage();
  String? previouslyStoredTXEncoded = await storage.read(key: 'MOVEMENTS');
  List previouslyStoredTxDecoded = jsonDecode(previouslyStoredTXEncoded!);

  return previouslyStoredTxDecoded;
}
