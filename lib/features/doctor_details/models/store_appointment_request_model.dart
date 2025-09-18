class StoreAppointmentRequestModel {
  final int doctorid;
  final String startTime;
  final String notes;

  StoreAppointmentRequestModel({
    required this.doctorid,
    required this.startTime,
    required this.notes,
  });

  Map<String, dynamic> toJson() => {
    'doctor_id': doctorid,
    'start_time': startTime,
    'notes': notes,
  };
}
