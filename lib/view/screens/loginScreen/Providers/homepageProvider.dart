import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);
    if (result != null) {
      PlatformFile pickfile = result.files.first;
      print(pickfile.name);
      print(pickfile.bytes);
      print(pickfile.path);
      print(pickfile.extension);
    }
    notifyListeners();
  }
//
}
