import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class updateprofilePic {
  static final user = FirebaseAuth.instance.currentUser!;

  //futue function
  static Future<void> updatePictue(File file) async {
    final ext = file.path.split('.').last; //to get the extention of image
    //update image to storage
    final ref =
        FirebaseStorage.instance.ref().child('profilePic/${user.email}.${ext}');
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/${ext}'))
        .then((p0) => print("data transfer :${p0.bytesTransferred / 1000} kb"));
    //update image to fireabase
    await ref.getDownloadURL().then((value) {
      print(value);
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.email!)
          .update({'photoUrl': value});
    });
  }
}
