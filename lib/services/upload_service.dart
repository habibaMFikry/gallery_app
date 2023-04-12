import 'package:http/http.dart' as http;

class UploadService {
  upload({required imageFile, required String token}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://technichal.prominaagency.com/api/upload'),
    );
    request.files.add(await http.MultipartFile.fromPath('img', imageFile));
    request.headers.addAll({'Authorization': 'Bearer $token'});
    var response = request.send();

    return response;
  }
}
