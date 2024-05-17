import 'package:rest_api_assignment_ostad/Models/photo_model.dart';
import 'package:rest_api_assignment_ostad/Services/api_fetch.dart';

class DataController{
  ApiFetch apiFetch;
  bool isErrorOccurred = false;
  DataController(this.apiFetch);

  Future<List<PhotoModel>> loadPhotos() async{
    List<PhotoModel>photoModelList =[];
    List<dynamic> jsonData = [];
    try {
      jsonData = await apiFetch.fetchPhotos();
      for (Map<String, dynamic> json in jsonData) {
        photoModelList.add(PhotoModel.fromJson(json));
      }
    } catch (statusCode) {
      isErrorOccurred = true;
    }
    return photoModelList;
  }

}