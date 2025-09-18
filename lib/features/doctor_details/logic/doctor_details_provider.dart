import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_doctor_app/core/local_storage/shared_prefereneces_helper.dart';
import 'package:iti_doctor_app/core/networking/api_constants.dart';
import 'package:iti_doctor_app/core/networking/dio_factory.dart';
import 'package:iti_doctor_app/features/doctor_details/models/store_appointment_request_model.dart';

class DoctorDetailsProvider extends ChangeNotifier {
  final timeController = TextEditingController();
  final notesController = TextEditingController();

  void storeAppointment(int doctorId, BuildContext context) async {
    try {
      final token = SharedPreferencesHelper.getString('token');
      final body = StoreAppointmentRequestModel(
        doctorid: doctorId,
        startTime: timeController.text,
        notes: notesController.text,
      );
      await DioFactory.postData(
        ApiConstants.storeAppointment,
        data: body.toJson(),
        token: token,
      );
      Fluttertoast.showToast(msg: 'Appointment Created Successfully');
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Failed to create an appointment');
    }
  }
}
