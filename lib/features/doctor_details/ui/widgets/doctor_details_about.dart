import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/features/home/models/doctors_response_model.dart';

class DoctorDetailsAbout extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsAbout({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About me',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(doctor.description, style: TextStyle(color: AppColors.bodyColor)),
        SizedBox(height: 16),
        Text(
          'Gender',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(doctor.gender, style: TextStyle(color: AppColors.bodyColor)),
        SizedBox(height: 16),
        Text(
          'Email',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(doctor.email, style: TextStyle(color: AppColors.bodyColor)),
        SizedBox(height: 16),
        Text(
          'Phone',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(doctor.phone, style: TextStyle(color: AppColors.bodyColor)),
        SizedBox(height: 16),
        Text(
          'Working Time',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          'Every Day From ${doctor.startTime} - ${doctor.endTime}',
          style: TextStyle(color: AppColors.bodyColor),
        ),
        SizedBox(height: 16),
        Text(
          'Appoint Price',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.text100Color,
          ),
        ),
        Text(
          '${doctor.appointPrice} EGP',
          style: TextStyle(color: AppColors.bodyColor),
        ),
      ],
    );
  }
}
