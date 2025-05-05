import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/Model/my_transaction.dart';
import 'package:bytebank/service/http/webc_client.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm({super.key, required this.contact});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Transferir'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.contact.name, style: TextStyle(fontSize: 24.0)),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,

                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                    labelText: 'Value',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ), // Cor quando focado
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ), // Cor quando não focado
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text(
                      'Transferir',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      final double value = double.parse(_valueController.text);
                      final transactionCreated = MyTransaction(
                        value: value,
                        contact: widget.contact,
                      );
                      save(transactionCreated).then((transactionId) {
                        if (transactionId != null) {
                          Navigator.pop(context);
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
