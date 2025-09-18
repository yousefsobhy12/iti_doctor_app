class ProfileResponseModel {
  final String message;
  final bool status;
  final UserModel user;

  ProfileResponseModel({
    required this.message,
    required this.status,
    required this.user,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        message: json['message'],
        status: json['status'],
        user: UserModel.fromJson((json['data'] as List<dynamic>).first),
      );
}

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    gender: json['gender'],
  );
}
