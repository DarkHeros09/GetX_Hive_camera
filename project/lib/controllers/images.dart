import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImagesFile extends GetxController {
  File _storedImages;
  final ImagePicker _picker = ImagePicker();

  get storedImages => _storedImages;
  get takePicture => _takePicture();

  Future<void> _takePicture() async {
    final imageFile =
        await _picker.getImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) return;
    _storedImages = File(imageFile.path);
    update();
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
  }
}
