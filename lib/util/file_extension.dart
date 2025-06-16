import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

extension FileConverter on String {
  Future<XFile> base64toXFile() async {
    final bytes = base64Decode(this);
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/temp_image.png';
    final file = File(tempPath);
    await file.writeAsBytes(bytes);
    return XFile(tempPath);
  }
}
