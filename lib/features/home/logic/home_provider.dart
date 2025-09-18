import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/app_data.dart';
import 'package:iti_doctor_app/core/local_storage/shared_prefereneces_helper.dart';
import 'package:iti_doctor_app/core/networking/api_constants.dart';
import 'package:iti_doctor_app/core/networking/dio_factory.dart';
import 'package:iti_doctor_app/features/home/models/doctors_response_model.dart';
import 'package:iti_doctor_app/features/home/models/profile_response_model.dart';
import 'package:iti_doctor_app/features/home/models/specializations_response_model.dart';

class HomeProvider extends ChangeNotifier {
  List<SpecializationModel> specializations = [];

  void getAllSpecializations() async {
    final token = SharedPreferencesHelper.getString('token')!;
    try {
      final response = await DioFactory.getData(
        ApiConstants.specializations,
        token: token,
      );
      final data = SpecializationsResponseModel.fromJson(response.data);
      if (data.status) {
        specializations = data.specializations;
        notifyListeners();
      }
    } catch (_) {}
  }

  List<DoctorModel> doctors = [];
  void getAllDoctors() async {
    final token = SharedPreferencesHelper.getString('token')!;
    try {
      final response = await DioFactory.getData(
        ApiConstants.doctors,
        token: token,
      );
      final data = DoctorsResponseModel.fromJson(response.data);
      if (data.status) {
        doctors = data.doctors;
        notifyListeners();
      }
    } catch (_) {}
  }

  void getUserProfile() async {
    try {
      final token = SharedPreferencesHelper.getString('token')!;
      final response = await DioFactory.getData(
        ApiConstants.profile,
        token: token,
      );
      final data = ProfileResponseModel.fromJson(response.data);
      if (data.status) {
        user = data.user;
      }
    } catch (e) {}
  }
}
