import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/features/home/models/doctors_response_model.dart';

class DoctorDetailsLocation extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsLocation({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(doctor.address, style: TextStyle(color: AppColors.bodyColor)),
        SizedBox(height: 16),
        Text(
          'City',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(doctor.city.name, style: TextStyle(color: AppColors.bodyColor)),
        SizedBox(height: 16),
        Text(
          'Governorate',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          doctor.city.governrate.name,
          style: TextStyle(color: AppColors.bodyColor),
        ),
      ],
    );
  }
}
