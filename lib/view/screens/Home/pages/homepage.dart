// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/Home/elements/Timeline%20Tiles%20Elements/myTimeLineTiles.dart';
import 'package:portfolio/view/screens/Home/pages/profilepage.dart';
import 'package:portfolio/view/screens/loginScreen/Providers/homepageProvider.dart';
import 'package:provider/provider.dart';

import '../elements/Timeline Tiles Elements/TimelineChild.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  final user = FirebaseAuth.instance.currentUser!;

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
    super.build(context);
    final provs = Provider.of<HomePageProvider>(context);
    return LayoutBuilder(builder: (context, Constraints) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: StreamBuilder(
              //---------------------------------- stream builder
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(user.email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Constraints.maxHeight * 0.1,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProfilePage();
                          })),
                          child: Container(
                            height: Constraints.maxHeight * 0.18,
                            decoration: BoxDecoration(
                                color: Color(0xff434343),
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: (data['photoUrl'] == null)
                                    ? Image.asset(
                                        'lib/assets/images/person.png',
                                        scale: 0.5,
                                      )
                                    : Image.network(
                                        data['photoUrl'],
                                        scale: 0.5,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyText(
                            text: data['profession'] ?? '',
                            color: Color(0xffB1B1B1),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: MyText(
                            text: (data['display name'] == null)
                                ? user.email!.split('@')[0]
                                : data['display name'],
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: Constraints.maxWidth * 0.15),
                        child: Column(
                          children: [
                            // on the OnTap function of the Timeline Tiles just add navigation.push and navigate
                            MyTimeLineTiles(
                                isfirst: true,
                                islast: false,
                                endChild: TimelineChild(
                                  text: 'CV / Resume',
                                  ontap: () {
                                    provs.showOptions(context);
                                  },
                                )),
                            MyTimeLineTiles(
                                isfirst: false,
                                islast: false,
                                endChild: TimelineChild(
                                  ontap: () {
                                    provs.showOptions(context);
                                  },
                                  text: 'Project',
                                )),
                            MyTimeLineTiles(
                                isfirst: false,
                                islast: true,
                                endChild: TimelineChild(
                                  ontap: () {},
                                  text: 'Socials',
                                )),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Container(
                    alignment: Alignment(0, 0),
                    child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      );
    });
  }
}
