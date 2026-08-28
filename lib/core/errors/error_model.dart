class ErrorModel {
  final String? message;
  final String? error;
  final Map<String, List<String>>? errors;

  ErrorModel({this.message, this.error, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'],
      error: json['error'],
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (key, value) =>
            MapEntry(key, List<String>.from(value.map((e) => e.toString()))),
      ),
    );
  }
}