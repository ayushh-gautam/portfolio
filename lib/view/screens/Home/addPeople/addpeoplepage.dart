import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/models/UserModel.dart';
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
    final Screenheight = MediaQuery.of(context).size.height;
    final Screenwidth = MediaQuery.of(context).size.width;

    // String emails = '';
    return Scaffold(
      body: Column(
        children: [
          MyTextField(
            obscureText: false,
            controller: usernameController,
            text: 'Search users',
            left: Screenwidth * 0.032,
            right: Screenwidth * 0.032,
            top: Screenheight * 0.1,
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
              ? StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('username', isEqualTo: username)
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<UserModel> userdata = [];
                    if (snapshot.connectionState == ConnectionState.done) {
                      final data = snapshot.data!.docs;
                      userdata = data
                          .map((e) => UserModel.fromJson(
                              e.data() as Map<String, dynamic>))
                          .toList();
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Screenwidth * 0.02),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff323232),
                                    borderRadius: BorderRadius.circular(12)),
                                height: Screenwidth * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        child: ((userdata[0]).photoUrl == '')
                                            ? Image.asset(
                                                'lib/assets/images/person.png',
                                                scale: 1.0)
                                            : Image.network(
                                                (userdata[0]).photoUrl,
                                                scale: 1.0),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      MyText(
                                          text: (userdata[0]).username,
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)
                                    ],
                                  ),
                                )),
                          )
                          //
                        ],
                      );
                    }
                    return Container();
                  })
              : Container(),
        ],
      ),
    );
  }
}
