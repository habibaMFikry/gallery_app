import 'package:gallery_app/models/image_model.dart';

import '../helpers/api.dart';

class MyGalleryService {
  Future<List> getImages({required String token}) async {
    Map<String, dynamic> data = await Api().get(
      url: 'https://technichal.prominaagency.com/api/my-gallery',
      token: token,
    );

    ImageModel model = ImageModel.fromJson(data);
    List<dynamic> images = model.data['images'];
    return images;
  }
}
