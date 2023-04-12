class ImageModel {
  final String status;
  final Map<String, dynamic> data;
  final String message;

  ImageModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ImageModel.fromJson(jsonData) {
    return ImageModel(
      status: jsonData['status'],
      data: jsonData['data'],
      message: jsonData['message'],
    );
  }
}
