import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/Model/transaction.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions = [];

  TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    transactions.add(
      Transaction(
        value: 100,
        contact: Contact(name: 'Alex', accountNumber: 1000),
      ),
    );
    return Scaffold(
      appBar: MyAppBar(title: 'Transactions'),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transaction transaction = transactions[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                transaction.contact.accountNumber.toString(),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
