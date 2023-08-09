import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class GetUsername extends StatelessWidget {
  final String documentEmail;
  GetUsername({super.key, required this.documentEmail});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentEmail).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text('User email:${data['email']}');
      }
      return Text('loadingg');
    }));
  }
}
