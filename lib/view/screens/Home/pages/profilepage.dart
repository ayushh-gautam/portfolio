import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';

import 'package:portfolio/view/screens/Home/elements/profileTile.dart';
import 'package:portfolio/view/screens/loginScreen/elements/customButton.dart';
import 'package:portfolio/view/screens/loginScreen/elements/textField.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!; //for current user
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? fields;
  final String userfield = 'Username';

  @override
  @override
  Widget build(BuildContext context) {
    Future<void> editprofile(String Field) async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: Color(0xff666666),
          title: MyText(
              text: userfield,
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600),
          content: TextField(
            autofocus: true,
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Container(
                      decoration: BoxDecoration(),
                      child: MyText(
                        text: "Cancel",
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: MyButton(
                  ontap: () {},
                  bottom: 0,
                  height: 50,
                  left: 0,
                  myText: 'Done',
                  width: 134,
                  top: 0),
            )
          ],
        ),
      );
    }

    // firestore database
    CollectionReference users = FirebaseFirestore.instance.collection('users');
//update
    void updatedata() async {
      Container();
      try {
        await users.doc(user.email!).update({
          'username': usernameController.text.trim(),
          'email': emailController.text.trim(),
          'gender': genderController.text.trim(),
          'number': numberController.text.trim()
        });
      } on FirebaseAuthException catch (e) {
        print(e.code);
      }
    }

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user.email!).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return Scaffold(
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.15,
                          ),
                          Center(
                            child: Container(
                              height: constraints.maxHeight * 0.18,
                              decoration: BoxDecoration(
                                  color: Color(0xff434343),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: ("$data['photoUrl']" == '')
                                      ? Image.asset(
                                          'lib/assets/images/person.png',
                                          scale: 0.5,
                                        )
                                      : Image.network(
                                          data['photoUrl'],
                                          scale: 1,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.05,
                                left: constraints.maxWidth * 0.05,
                                right: constraints.maxWidth * 0.05),
                            child: ProfileTiles(
                                onPressed: () => editprofile(userfield),
                                height: constraints.maxHeight * 0.08,
                                Field: userfield,
                                Value: 'Azzaya'),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
                child: Container(child: const CircularProgressIndicator()));
          }
        }));
  }
}
