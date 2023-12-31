import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/view/screens/Home/elements/navigationbar_2.dart';

import 'package:portfolio/view/screens/loginScreen/screens/loginScreen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyNavigationBar2();
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}
