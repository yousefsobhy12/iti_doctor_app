import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/core/widgets/custom_text_field.dart';
import 'package:iti_doctor_app/features/home/models/doctors_response_model.dart';

class DoctorsScreen extends StatefulWidget {
  final List<DoctorModel> doctors;
  const DoctorsScreen({super.key, required this.doctors});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final searchController = TextEditingController();
  List<DoctorModel> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      filteredDoctors = widget.doctors;
    });
  }

  void search() {
    setState(() {
      if (searchController.text.isEmpty) {
        filteredDoctors = widget.doctors;
      } else {
        filteredDoctors = widget.doctors
            .where(
              (element) =>
                  element.name.contains(searchController.text) ||
                  element.specialization.name.contains(searchController.text) ||
                  element.degree.contains(searchController.text) ||
                  element.description.contains(searchController.text),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctors')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            CustomTextField(
              controller: searchController,
              hintText: 'Search doctor here...',
              onChange: (value) {
                search();
              },
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.doctorDetails,
                      arguments: filteredDoctors[index],
                    );
                  },
                  child: Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.text50Color,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP9VcMn-KypOVElikk37BvVvHZHMnoOO44Lg&s',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return Icon(Icons.error, color: Colors.black);
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              filteredDoctors[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.text100Color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${filteredDoctors[index].specialization.name} | ${filteredDoctors[index].degree}',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.bodyColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 14),
                itemCount: filteredDoctors.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
