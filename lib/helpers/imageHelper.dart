// ignore_for_file: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

class ImageHelper {
  Future<String?> getImagePicker(ImageSource imageSource) async {
    // XFile? image = await ImagePicker().pickImage(
    //   source: imageSource,
    //   maxWidth: 1024,
    //   maxHeight: 1024,
    //   imageQuality: 90,
    // );
    // if (image != null) {
    // int maxSize = 5 * 1024 * 1024;
    // if (File(image.path).lengthSync() <= maxSize) {
    //   print("Camera image djfgnlkfdngng,mdfng..");
    //   print(image);
    //   return image;
    // } else {
    //   errorToast(msg: 'Size of selected image exceeds 5 MB.');
    // }
    // }

    return null;
  }

  Future<List<XFile>?> getMultiImagePicker() async {
    List<XFile>? image = await ImagePicker()
        .pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    return image;
  }

  Future<List<PlatformFile>> pickAttachment({bool isMulti = false}) async {
    List<PlatformFile> selectedFiles = [];
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: isMulti,
      );
      if (result != null) {
        selectedFiles = result.files;
      }
    } catch (e) {
      rethrow;
    }
    return selectedFiles;
  }

  String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '${bytes}B';
    } else if (bytes < 1024 * 1024) {
      double kbSize = bytes / 1024;
      return '${kbSize.toStringAsFixed(2)}KB';
    } else {
      double mbSize = bytes / (1024 * 1024);
      return '${mbSize.toStringAsFixed(2)}MB';
    }
  }

  // Check file is image or not
  bool isImage(String filePath) {
    final mimeType = lookupMimeType(filePath);
    if (mimeType != null && mimeType.startsWith('image/')) {
      return true;
    }
    final fileExtension = path.extension(filePath).toLowerCase();
    return ['.jpg', '.jpeg', '.png', '.gif', '.bmp'].contains(fileExtension);
  }
}
