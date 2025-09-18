class SpecializationsResponseModel {
  final bool status;
  final List<SpecializationModel> specializations;

  SpecializationsResponseModel({
    required this.status,
    required this.specializations,
  });
  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) =>
      SpecializationsResponseModel(
        status: json['status'],
        specializations: (json['data'] as List)
            .map((e) => SpecializationModel.fromJson(e))
            .toList(),
      );
}

class SpecializationModel {
  final int id;
  final String name;

  SpecializationModel({required this.id, required this.name});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      SpecializationModel(id: json['id'], name: json['name']);
}
