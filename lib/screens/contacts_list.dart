import 'package:bytebank/screens/home/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: MyAppBar(title: 'Contatos'),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Gabriel', style: TextStyle(fontSize: 24)),
              subtitle: const Text('100000', style: TextStyle(fontSize: 16)),
              onTap: () {
                // Implement navigation to contact details
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement navigation to add new contact
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
