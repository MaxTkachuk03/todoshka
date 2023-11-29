// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageServices {
  ImageServices({
    required this.picker,
  });

  final ImagePicker picker;

  Future<String> getImage() async {
// Pick an image
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 1);
//TO convert Xfile into file
    //File file = File(image!.path);
    if (image == null) return '';
    final bytes = await image.readAsBytes();
    final encodBytes = base64Encode(bytes);
    debugPrint('Image picked');
    return encodBytes;
  }
}
