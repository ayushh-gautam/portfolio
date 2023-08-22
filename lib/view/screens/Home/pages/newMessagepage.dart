import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessagePage extends StatefulWidget {
  const NewMessagePage({super.key});

  @override
  State<NewMessagePage> createState() => _NewMessagePageState();
}

class _NewMessagePageState extends State<NewMessagePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
        child: Scaffold(backgroundColor: Colors.blue, body: _buildUserList()));
  }

  //
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            'Loading...',
            style: TextStyle(color: Colors.white, fontSize: 28),
          );
        }
        if (snapshot.hasError) {
          return Text(
            'Error',
            style: TextStyle(color: Colors.white, fontSize: 28),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return _buildUserListItem(document);
          }).toList(),
        );
      },
    );
  }

//
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_firebaseAuth.currentUser!.email != data['email']) {
      return ListTile(
          onTap: () {
            print('prineed');
          },
          title: Text(
            data['email'],
          ));
    }
    return Container();
  }
}
