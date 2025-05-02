import 'package:bytebank/screens/bytebankApp.dart';
import 'package:bytebank/service/http/webc_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bytebankapp());
  findAll().then((transactions) => print('transactions: $transactions'));
}