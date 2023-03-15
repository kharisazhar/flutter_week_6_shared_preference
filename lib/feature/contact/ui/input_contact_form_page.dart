import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class InputContactFormPage extends StatelessWidget {
  InputContactFormPage({Key? key}) : super(key: key);

  String? _fullName = '';
  String? _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Book Alterra')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (valueFullName) {
                _fullName = valueFullName;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Full Name'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              onChanged: (valuePhoneNumber) {
                _phoneNumber = valuePhoneNumber;
              },
              decoration: const InputDecoration(
                  prefix: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number'),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      DataContact(
                        name: _fullName ?? '',
                        phoneNumber: _phoneNumber ?? '',
                      ),
                    );
                  },
                  child: const Text('SUBMIT'),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
