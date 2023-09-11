import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/loginScreen/elements/textField.dart';

class AddPeoplePage extends StatefulWidget {
  AddPeoplePage({super.key});

  @override
  State<AddPeoplePage> createState() => _AddPeoplePageState();
}

class _AddPeoplePageState extends State<AddPeoplePage> {
  TextEditingController usernameController = TextEditingController();
  String username = '';
  @override
  Widget build(BuildContext context) {
    // String emails = '';
    return Scaffold(
      body: Column(
        children: [
          MyTextField(
            obscureText: false,
            controller: usernameController,
            text: 'Search users',
            left: MediaQuery.of(context).size.width * 0.032,
            right: MediaQuery.of(context).size.width * 0.032,
            top: MediaQuery.of(context).size.height * 0.1,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  username = 'azzaya2060';
                });
              },
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          ),
          (username != '')
              ? StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('email', isEqualTo: username)
                      .snapshots(),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        MyText(
                            text: '00000000000',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal)
                        //
                      ],
                    );
                  })
              : Container(),
        ],
      ),
    );
  }
}
