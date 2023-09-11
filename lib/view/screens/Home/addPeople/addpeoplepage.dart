import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/loginScreen/elements/textField.dart';

class AddPeoplePage extends StatefulWidget {
  const AddPeoplePage({super.key});

  @override
  State<AddPeoplePage> createState() => _AddPeoplePageState();
}

class _AddPeoplePageState extends State<AddPeoplePage>
    with AutomaticKeepAliveClientMixin<AddPeoplePage> {
  bool get wantKeepAlive => true;

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    //database
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user.email!).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
//////////////////////////////////////////////////////////////////////////////////////
            return Scaffold(
                body: LayoutBuilder(builder: ((context, Constraints) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    child: Column(
                      children: [
                        MyTextField(
                          obscureText: false,
                          text: 'Search users',
                          left: Constraints.maxWidth * 0.032,
                          right: Constraints.maxWidth * 0.032,
                          top: Constraints.maxHeight * 0.135,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                            color: Colors.white,
                          ),
                        ),
                        peopleTile(data, Constraints)
                      ],
                    ),
                  ),
                ),
              );
            })));
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}

Widget peopleTile(data, Constraints) {
  return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(Constraints.maxWidth * 0.02),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff323232),
                          borderRadius: BorderRadius.circular(12)),
                      height: Constraints.maxWidth * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: ("${data['photoUrl']}" == '')
                                  ? Image.asset('lib/assets/images/person.png',
                                      scale: 1.0)
                                  : Image.network('${data['photoUrl']}',
                                      scale: 1.0),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            MyText(
                                text: data['username'],
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)
                          ],
                        ),
                      )),
                )
              ],
            );
          }));
}
