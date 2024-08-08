import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../helpers/imageHelper.dart';

class DialogProvider extends ChangeNotifier {
  List<PlatformFile> _pickedAttachments = [];
  List<PlatformFile> get pickedAttachments => _pickedAttachments;

  pickAttachment() {
    try {
      ImageHelper().pickAttachment(isMulti: true).then((value) {
        if (value.isNotEmpty) {
          for (var element in value) {
            if (_pickedAttachments.length < 3) {
              setPickedAttachments(element);
            }
          }
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  setPickedAttachments(PlatformFile file) {
    _pickedAttachments.add(file);
    notifyListeners();
  }

  clearPickedAttachment() {
    _pickedAttachments.clear();
    notifyListeners();
  }

  removePickedAttachment(int index) {
    List<PlatformFile> images = [];
    for (var i = 0; i < _pickedAttachments.length; i++) {
      if (index != i) {
        images.add(_pickedAttachments[i]);
      }
    }
    _pickedAttachments = images;
    notifyListeners();
  }
}
