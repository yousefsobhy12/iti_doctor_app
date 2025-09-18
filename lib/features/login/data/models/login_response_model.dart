class LoginResponseModel {
  final bool status;
  final String message;
  final LoginModel data;

  LoginResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json['status'],
        message: json['message'],
        data: LoginModel.fromJson(json['data']),
      );
}

class LoginModel {
  final String token;

  LoginModel({required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(token: json['token']);
}
