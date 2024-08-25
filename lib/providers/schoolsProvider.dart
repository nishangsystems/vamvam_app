
import 'package:flutter/cupertino.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/model/base/responseModel.dart';
import 'package:vam_vam/data/repo/schoolRepo.dart';

class SchoolsProvider extends ChangeNotifier {
  final SchoolRepo schoolRepo;

  SchoolsProvider({required this.schoolRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List _schools = [];
  List get schools => _schools;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Map> getSchools() async {
    startLoader(true);
    notifyListeners();

    ApiResponse response = await schoolRepo.getSchools();
    Map data;

    print("response: ${response.response}");

    if (response.response != null && response.response!.statusCode == 200) {
      data = response.response!.data;

      print("map: $data");

      _schools = data['schools'];

    } else {
      data = {
        "status": "error",
        "message": "Something went wrong",
      };
    }

    startLoader(false);
    notifyListeners();
    return data;
  }
}