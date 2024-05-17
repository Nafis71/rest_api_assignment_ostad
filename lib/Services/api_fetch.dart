import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest_api_assignment_ostad/Utils/constants.dart';

class ApiFetch {
  Future<List<dynamic>> fetchPhotos() async {
    List<dynamic> jsonData = [];
    final Response response = await http
        .get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
    } else {
      throw response.statusCode;
    }
    return jsonData;
  }
}
