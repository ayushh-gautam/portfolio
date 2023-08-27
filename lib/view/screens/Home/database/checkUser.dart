import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfolio/view/screens/Home/model/userModel.dart';

class CheckUser {
  static final auth = FirebaseAuth.instance;

  static final user = FirebaseAuth.instance.currentUser;
  static final firestore = FirebaseFirestore.instance;

  static Future<bool> checkUser() async {
    return (await firestore.collection('users').doc(user!.email).get()).exists;
  }

  static Future<void> createUser() async {
    final newUser = UserModel(
        display_name: user!.displayName.toString(),
        email: user!.email.toString(),
        gender: '',
        number: '',
        photoUrl: user!.photoURL.toString(),
        profession: '',
        username: user!.email!.split('@')[0].toString());

    await firestore.collection('users').doc(user!.email).set(newUser.toJson());
  }
}
