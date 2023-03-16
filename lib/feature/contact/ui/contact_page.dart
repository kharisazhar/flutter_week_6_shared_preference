import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_6_shared_preference/utils/shared_preference_key.dart';

import '../../../main.dart';
import '../model/contact_model.dart';
import 'input_contact_form_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ContactModel _contactData = ContactModel(data: []);

  @override
  void initState() {
    super.initState();
    initDataLocal();
  }

  void initDataLocal() {
    /// TODO 1. GET DATA
    var dataLocal = sharedPref.getString(SharedPreferenceKey.contactListPref);
    var contactDataLocal = ContactModel(data: []);

    /// TODO 2. CHECK DATA SHARED PREFERENCE
    if (dataLocal != null) {
      contactDataLocal = ContactModel.fromJson(
        jsonDecode(dataLocal),
      );
    }

    /// TODO 3. CHECK DATA HASIL PARSING
    if (contactDataLocal.data.isNotEmpty) {
      _contactData = contactDataLocal;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Book Alterra')),
      body: ListView.builder(
        itemCount: _contactData.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(_contactData.data[index].name),
                subtitle: Text(_contactData.data[index].phoneNumber),
              ),
              const Divider(
                thickness: 1.0,
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context)
              .push(CupertinoPageRoute<DataContact>(
                  builder: (_) => InputContactFormPage()))
              .then((navigationData) async {
            /// Update List dari Input Contact
            _contactData.data.add(
              DataContact(
                  name: navigationData?.name ?? '',
                  phoneNumber: navigationData?.phoneNumber ?? ''),
            );

            /// TODO 4. SAVE DATA
            await sharedPref.setString(
              SharedPreferenceKey.contactListPref,
              jsonEncode(
                _contactData.toJson(),
              ),
            );

            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
