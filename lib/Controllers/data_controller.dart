import 'package:rest_api_assignment_ostad/Models/photo_model.dart';
import 'package:rest_api_assignment_ostad/Services/api_fetch.dart';

class DataController{
  ApiFetch apiFetch;
  bool isErrorOccurred = false;
  DataController(this.apiFetch);

  Future<List<PhotoModel>> loadPhotos() async{
    List<PhotoModel> photoModel = [];
    try {
      photoModel = await apiFetch.fetchPhotos();
    } catch (statusCode) {
      isErrorOccurred = true;
    }
    return photoModel;
  }

}