import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfilePic {
//< to select image from Device-------------------------------->
  static File? imagess;
  static Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final imagetemporary = File(image.path);
    //<!-- Note added the code to XML file  to user image cropper i already added  -->
    final croppedimage = await ImageCropper().cropImage(
        sourcePath: imagetemporary.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (croppedimage == null) {
      return;
    }

    imageCache.clear();
    imagess = File(croppedimage.path);
    updatePictue(File(croppedimage.path));
  }
//<-------------------------------------------------------------------------->

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
