class RegisterRequestBodyModel {
  final String name;
  final String email;
  final String phone;
  final int gender;
  final String password;
  final String passwordConfirmation;

  RegisterRequestBodyModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'gender': gender,
    'password': password,
    'password_confirmation': passwordConfirmation,
  };
}
