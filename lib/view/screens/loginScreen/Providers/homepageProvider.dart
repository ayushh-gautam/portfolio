// ignore_for_file: unnecessary_new

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/loginScreen/elements/customButton.dart';

class HomePageProvider with ChangeNotifier {
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
        ],
        allowMultiple: false);
    if (result != null) {
      PlatformFile pickfile = result.files.first;
      print(pickfile.name);
      print(pickfile.bytes);
      print(pickfile.path);
      print(pickfile.extension);
    }
    notifyListeners();
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
                      onTap: () => pickFile(),
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

                    //--------------------------- Done button Startss .-------------------------------\\

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
