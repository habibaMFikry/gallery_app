import 'package:gallery_app/helpers/api.dart';
import 'package:gallery_app/models/user_model.dart';

class AuthService {
  Future<UserModel> auth(
      {required String email, required String password}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://technichal.prominaagency.com/api/auth/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    return UserModel.fromJson(data);
  }
}
