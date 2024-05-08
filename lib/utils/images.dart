import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> pickImage({bool useCamera = false}) async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  final File image = File(pickedImage!.path);
  return image;
}
