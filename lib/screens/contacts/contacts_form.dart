import 'package:bytebank/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class ContactsForm extends StatelessWidget {
  const ContactsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: 'Novo Contato'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(label: Text('Nome Completo')),
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text('Numero da Conta')),
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 20),

            Material(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Criar',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
