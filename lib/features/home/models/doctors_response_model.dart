import 'package:iti_doctor_app/features/home/models/specializations_response_model.dart';

class DoctorsResponseModel {
  final bool status;
  final List<DoctorModel> doctors;

  DoctorsResponseModel({required this.status, required this.doctors});
  factory DoctorsResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorsResponseModel(
        status: json['status'],
        doctors: (json['data'] as List)
            .map((e) => DoctorModel.fromJson(e))
            .toList(),
      );
}

class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final SpecializationModel specialization;
  final CityModel city;
  final num appointPrice;
  final String startTime;
  final String endTime;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    gender: json['gender'],
    address: json['address'],
    description: json['description'],
    degree: json['degree'],
    specialization: SpecializationModel.fromJson(json['specialization']),
    city: CityModel.fromJson(json['city']),
    appointPrice: json['appoint_price'],
    startTime: json['start_time'],
    endTime: json['end_time'],
  );
}

class CityModel {
  final int id;
  final String name;
  final GovernorateModel governrate;

  CityModel({required this.id, required this.name, required this.governrate});
  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json['id'],
    name: json['name'],
    governrate: GovernorateModel.fromJson(json['governrate']),
  );
}

class GovernorateModel {
  final int id;
  final String name;

  GovernorateModel({required this.id, required this.name});

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      GovernorateModel(id: json['id'], name: json['name']);
}
