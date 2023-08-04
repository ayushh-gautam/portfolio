import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: ((context, Constraints) {
        return Container(
          height: Constraints.maxHeight * 0.09,
          width: Constraints.maxWidth,
          color: Colors.green,
          child: Text('hello'),
        );
      })),
    );
  }
}
