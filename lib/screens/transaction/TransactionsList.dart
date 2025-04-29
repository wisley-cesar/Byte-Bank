import 'package:bytebank/Model/my_transaction.dart';
import 'package:bytebank/service/http/webc_client.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:bytebank/widget/my_progressor_indequetor.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Transactions'),
      body: FutureBuilder<List<MyTransaction>>(
        future: findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: MyProgressorIndequetor());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro: Por vor favor, tente novamente mais tarde',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Não tem transações'));
          }
          final List<MyTransaction>? transactions = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              final MyTransaction transaction = transactions![index];
              return Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(
                    transaction.value.toString(),
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    transaction.contact.accountNumber.toString(),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
            itemCount: transactions!.length,
          );
        },
      ),
    );
  }
}
