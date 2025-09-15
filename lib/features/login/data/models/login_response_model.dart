class LoginResponseModel {
  final bool status;
  final String message;

  LoginResponseModel({required this.status, required this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(status: json['status'], message: json['message']);
}
