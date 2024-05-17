import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_assignment_ostad/Models/photo_model.dart';
import 'package:rest_api_assignment_ostad/Utils/constants.dart';

class ApiFetch {
  Future<List<PhotoModel>> fetchPhotos() async {
    List<PhotoModel> photoModelList = [];
    final Response response = await http
        .get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      for (Map<String, dynamic> json in data) {
        photoModelList.add(PhotoModel.fromJson(json));
      }
    } else {
      throw response.statusCode;
    }
    return photoModelList;
  }
}
