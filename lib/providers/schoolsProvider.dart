
import 'package:flutter/cupertino.dart';
import 'package:vam_vam/data/model/base/apiResponse.dart';
import 'package:vam_vam/data/model/base/responseModel.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
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

  // fetch all schools and get one by name
  Future<School> getSchoolByName(String name) async {
    try {
      // Fetch all schools
      ApiResponse apiResponse = await schoolRepo.getSchools();

      print("getSchools apiResponse: ${apiResponse.response}");

      // Check if the API response was successful
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        List<dynamic> schoolsData = apiResponse.response!.data['schools'];

        print("schools fetched: ${schoolsData}");

        // Assuming `School` is your model and it has a `fromJson` factory constructor
        List<School> schools = schoolsData.map((school) => School.fromJson(school)).toList();

        // Filter the school by name
        School school = schools.firstWhere(
              (school) => school.name.toLowerCase() == name.toLowerCase(),
          orElse: () => throw Exception('School not found'),
        );

        return school;
      } else {
        throw Exception('Failed to fetch schools');
      }
    } catch (e) {
      // Handle the error
      print('Error fetching school by name: $e');
      rethrow;
    }
  }
}