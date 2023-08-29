import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/view/screens/Home/database/updateprofile.dart';

class changeProfileImage {
  static File? imagess;
  static Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final imagetemporary = File(image.path);
    final croppedimage = await ImageCropper().cropImage(
        sourcePath: imagetemporary.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
    if (croppedimage == null) {
      return;
    }

    imageCache.clear();
    imagess = File(croppedimage.path);
    updateprofilePic.updatePictue(File(croppedimage.path));
  }
}
