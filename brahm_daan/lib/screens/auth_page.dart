import 'package:brahm_daan/screens/register_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLogin = true;

  void toogleScreen() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(showRegisterPage: toogleScreen);
    }else {
      return RegisterPage(showLoginPage: toogleScreen);
    }
  }
}
