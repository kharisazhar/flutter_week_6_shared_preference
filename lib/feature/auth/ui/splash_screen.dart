import 'package:flutter/material.dart';
import 'package:flutter_week_6_shared_preference/feature/auth/ui/login_page.dart';

import '../../../main.dart';
import '../../../utils/shared_preference_key.dart';
import '../../contact/ui/contact_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    /// GET DATA isLogin
    isLogin = sharedPref.getBool(SharedPreferenceKey.isLogin) ?? false;

    checkRouting();
  }

  void checkRouting() async {
    Future.delayed(const Duration(seconds: 2), () {
      if (isLogin == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const ContactPage(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_bg.jpg',
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
