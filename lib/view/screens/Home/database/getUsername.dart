import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';

class GetUsername extends StatelessWidget {
  final String documentids;
  GetUsername({super.key, required this.documentids});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentids).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ("${data['photoUrl']}" == '')
                      ? Image.asset('lib/assets/images/person.png', scale: 1.0)
                      : Image.network('${data['photoUrl']}', scale: 1.0),
                )
              ],
            );
          }
          return Text('loadingg');
        }));
  }
}
