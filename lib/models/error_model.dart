class ErrorModel {
  final String errorMessage;

  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> map) {
    return ErrorModel(
      errorMessage: map['message'],
    );
  }
}
