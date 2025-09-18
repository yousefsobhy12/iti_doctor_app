import 'package:iti_doctor_app/features/home/models/doctors_response_model.dart';

class AppointmentsResponseModel {
  final String message;
  final bool status;
  final List<AppointmentModel> appointments;

  AppointmentsResponseModel({
    required this.message,
    required this.status,
    required this.appointments,
  });

  factory AppointmentsResponseModel.fromJson(Map<String, dynamic> json) {
    var appointmentsJson = json['data'] as List;
    List<AppointmentModel> appointmentsList = appointmentsJson
        .map((appointment) => AppointmentModel.fromJson(appointment))
        .toList();

    return AppointmentsResponseModel(
      message: json['message'],
      status: json['status'],
      appointments: appointmentsList,
    );
  }
}

class AppointmentModel {
  final int id;
  final DoctorModel doctor;
  final String appointmentTime;
  final String appointmentEndTime;
  final String notes;
  final String status;
  final num appointmentPrice;

  AppointmentModel({
    required this.id,
    required this.doctor,
    required this.appointmentTime,
    required this.appointmentEndTime,
    required this.notes,
    required this.status,
    required this.appointmentPrice,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      doctor: DoctorModel.fromJson(json['doctor']),
      appointmentTime: json['appointment_time'],
      appointmentEndTime: json['appointment_end_time'],
      notes: json['notes'] ?? '',
      status: json['status'],
      appointmentPrice: json['appointment_price'],
    );
  }
}
