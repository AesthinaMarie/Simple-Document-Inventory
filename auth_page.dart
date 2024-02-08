import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pitbiarhive/dashboard.dart';
import 'package:pitbiarhive/view/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Dashboard();
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}
