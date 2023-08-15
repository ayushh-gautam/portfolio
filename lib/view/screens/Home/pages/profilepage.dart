// ignore_for_file: non_constant_identifier_names
//import section
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/Home/elements/profileTile.dart';

//-----------main clas ProfilePage
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
//-----------Veriable and Instance Declarations.--------------------------\\
  final user = FirebaseAuth.instance.currentUser!; //for current user
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? fields;
  final String userfield = 'Username';
  final String proffield = 'Profession';
  final String genderfield = 'Gender';
  final String numfield = 'Number';
//-----------------------------------------------------------------------------\\
  @override
  @override
  Widget build(BuildContext context) {
    //------------------Function to edit profile (Update with Alert box)-------------------\\
    Future<void> editprofile(
        String Field, double boxheight, double boxwidth) async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          backgroundColor: Color(0xff666666),
          title: MyText(
              text:
                  Field, //-------------------------This field is for the name of each alert box------------\\
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600),
          content: const TextField(
            autofocus: true,
          ),
          actions: [
//------------------------------Cancel button of alert box starts ----------------------------------\\
            Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                      height: boxheight,
                      width: boxwidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xff03b44a)),
                      child: Center(
                        child: MyText(
                          text: "Cancel",
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                )),

//---------------------------Cancel button of alert box closed.-------------------------------\\

            //---------------------------Done button Startss .-------------------------------\\

            Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Container(
                      height: boxheight,
                      width: boxwidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xff03b44a)),
                      child: Center(
                        child: MyText(
                          text: "Done",
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                )),
          ],
        ),
      );
    }
//-------------------------------------------------------------------------------------------\\
//-------------------------------------------------------------------------------------------\\
// -------------------------------Code for Firestore Database----------------------------------------------\\
//---------------------------------------------------------------------------------------------\\

    CollectionReference users = FirebaseFirestore.instance.collection('users');
//--------------------------------------------------------------------------------Update Function----\\
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

//--------------------------------------------------------------------------------Futue Builder to Fetch data (data) ----\\
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user.email!).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
//---------------------------------------------------------------------------------Scaffold startss(main body)----\\
            return Scaffold(
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
//-------------------------------------------------Sized box to manage the open space above the profile image =>
                        SizedBox(
                          height: constraints.maxHeight * 0.09,
                        ),
//-------------------------------------------------------------------------------------------\\
//---------------------------------------------Profile Image starts ----------------------------------------------\\
                        Center(
                          child: Container(
                            height: constraints.maxHeight * 0.18,
                            decoration: BoxDecoration(
                                color: const Color(0xff434343),
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
//-------------------------------------------------------------------------------------------------------------\\
//-----------------------------------------user filed starts--------------------------------------------------\\
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.05,
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05),
                          child: ProfileTiles(
                              onPressed: () => editprofile(
                                  userfield,
                                  constraints.maxHeight * 0.05,
                                  constraints.maxWidth * 0.3),
                              height: constraints.maxHeight * 0.08,
                              Field: userfield,
                              Value: data['username']),
                        ),
//-------------------------------------------------------------------------------------------\\
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.05,
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05),
                          child: ProfileTiles(
                              onPressed: () => editprofile(
                                  proffield,
                                  constraints.maxHeight * 0.05,
                                  constraints.maxWidth * 0.3),
                              height: constraints.maxHeight * 0.08,
                              Field: proffield,
                              Value: 'Developer'),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.05,
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05),
                          child: ProfileTiles(
                              onPressed: () => editprofile(
                                  genderfield,
                                  constraints.maxHeight * 0.05,
                                  constraints.maxWidth * 0.3),
                              height: constraints.maxHeight * 0.08,
                              Field: genderfield,
                              Value: data['gender']),
                        ),
                        /////////////////////////////////////////////////// k garya aafai edit do tyo alert box ko text
                        Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.05,
                              left: constraints.maxWidth * 0.05,
                              right: constraints.maxWidth * 0.05),
                          child: ProfileTiles(
                              onPressed: () => editprofile(
                                  numfield,
                                  constraints.maxHeight * 0.05,
                                  constraints.maxWidth * 0.3),
                              height: constraints.maxHeight * 0.08,
                              Field: numfield,
                              Value: '9812231312'),
                        ),
                      ],
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
