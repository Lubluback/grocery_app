import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:grocery_application/services/sharedpreferences/sharedpreference.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // Reactive variable to store the selected image
  Rx<File?> selectedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker

  // Pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      print("No image selected.");
    }
    update();
  }

  // Capture an image using the camera
  Future<void> captureImageWithCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    log("${pickedFile?.path}");

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      print("No image captured.");
    }
    update();
  }

  logout()async {
  await  Sharedpreference.clearUser();
  }
}
