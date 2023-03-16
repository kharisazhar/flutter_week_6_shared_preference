import 'package:flutter/material.dart';
import 'package:flutter_week_6_shared_preference/feature/contact/ui/contact_page.dart';
import 'package:flutter_week_6_shared_preference/utils/shared_preference_key.dart';

import '../../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const String emailData = "alterra@gmail.com";
  static const String passwordData = "alterra";

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Alterra Contact Book')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (emailValue) {
                email = emailValue;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              obscureText: true,
              onChanged: (passwordValue) {
                password = passwordValue;
              },
              decoration: const InputDecoration(
                  prefix: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  labelText: 'Password'),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () async {
                    /// Check jika username & password valid
                    if (email.contains(emailData) &&
                        password.contains(passwordData)) {
                      await sharedPref.setString(
                          SharedPreferenceKey.username, email);

                      /// TODO Encrypt
                      await sharedPref.setString(
                          SharedPreferenceKey.password, password);

                      /// SAVE DATA isLogin = true
                      await sharedPref
                          .setBool(SharedPreferenceKey.isLogin, true)
                          .then((value) {
                        /// Navigation
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ContactPage(),
                          ),
                        );
                      });
                    } else {
                      /// SAVE DATA isLogin = false
                      await sharedPref
                          .setBool(SharedPreferenceKey.isLogin, false)
                          .then((value) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text('Oops ...'),
                              content: Text('Email atau Password salah'),
                            );
                          },
                        );
                      });
                    }
                  },
                  child: const Text('LOGIN'),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
