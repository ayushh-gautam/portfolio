// ignore_for_file: unnecessary_new

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/Home/database/updateprofile.dart';
import 'package:portfolio/view/screens/Home/pages/home/pdfViewer.dart';

class HomePageProvider with ChangeNotifier {
  void pickFile(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
        ],
        allowMultiple: false);

    if (result != null) {
      PlatformFile pickfile = result.files.first;
      File filess = File(pickfile.path!);
      updateCV(filess).whenComplete(() {
        Navigator.pop(context);
      });
    }

    notifyListeners();
  }

//futue function
  Future<void> updateCV(File file) async {
    //to get the extention of image
    //update image to storage
    final ref = FirebaseStorage.instance
        .ref()
        .child('Cvs/${ChangeProfilePic.user.email}.pdf');
    await ref
        .putFile(file, SettableMetadata(contentType: 'CVs.pdf'))
        .then((p0) => print("data transfer :${p0.bytesTransferred / 1000} kb"));

    ref.getDownloadURL().then((value) {
      //updating data in firestore
      FirebaseFirestore.instance
          .collection('pdf')
          .doc(ChangeProfilePic.user.email)
          .set({'pdf': value});
    });
  }

  void openfile() {}

//-------------------------------------------------------------------------------
  void showOptions(context) {
    showDialog(
        context: context,
        builder: (ctxt) => new AlertDialog(
              backgroundColor: Colors.black54,
              //title: Text("Cv/Resume"),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => pickFile(context),
                      child: Container(
                          height: 70,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xff03b44a)),
                          child: Center(
                            child: MyText(
                              text: "Pick File",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),

//--------------------------- Cancel button of alert box closed.-------------------------------\\

                    //--------------------------- Open file button Starts .-------------------------------\\

                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 70,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xff03b44a)),
                          child: Center(
                            child: MyText(
                              text: "Open file",
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ));
  }
}
