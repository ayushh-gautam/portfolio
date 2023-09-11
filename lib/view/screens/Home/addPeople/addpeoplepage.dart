import 'package:flutter/material.dart';
import 'package:portfolio/view/screens/loginScreen/elements/textField.dart';

class AddPeoplePage extends StatelessWidget {
  AddPeoplePage({super.key});
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyTextField(
        obscureText: false,
        controller: usernameController,
        text: 'Search users',
        left: MediaQuery.of(context).size.width * 0.032,
        right: MediaQuery.of(context).size.width * 0.032,
        top: MediaQuery.of(context).size.height * 0.1,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          color: Colors.white,
        ),
      ),
    );
  }
}
