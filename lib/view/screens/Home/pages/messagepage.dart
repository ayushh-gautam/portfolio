import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view/screens/Home/database/getUsername.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<String> documentEmail = [];
  Future getDocEmail() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapchot) => snapchot.docs.forEach((element) {
              print(element.reference);
              documentEmail.add(element.reference.id);
            }));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDocEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getDocEmail(),
          builder: (context, snapshot) {
            return Center(
              child: Text(
                GetUsername(documentEmail: documentEmail[0]) as String,
              ),
            );
          }),
    );
  }
}
