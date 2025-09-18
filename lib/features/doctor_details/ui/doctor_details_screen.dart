import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/core/widgets/custom_button.dart';
import 'package:iti_doctor_app/core/widgets/custom_text_field.dart';
import 'package:iti_doctor_app/features/doctor_details/logic/doctor_details_provider.dart';
import 'package:iti_doctor_app/features/doctor_details/ui/widgets/doctor_details_about.dart';
import 'package:iti_doctor_app/features/doctor_details/ui/widgets/doctor_details_location.dart';
import 'package:iti_doctor_app/features/home/models/doctors_response_model.dart';
import 'package:provider/provider.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<DoctorDetailsProvider>();
    return Scaffold(
      appBar: AppBar(title: Text(doctor.name)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
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
                                  doctor.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.text100Color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${doctor.specialization.name} | ${doctor.degree}',
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
                      TabBar(
                        labelColor: Theme.of(context).colorScheme.primary,
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 4,
                        dividerColor: AppColors.text30Color,
                        dividerHeight: 4,
                        unselectedLabelColor: AppColors.text60Color,
                        unselectedLabelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        labelPadding: EdgeInsets.symmetric(vertical: 5),
                        tabs: [Text('About'), Text('Location')],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            DoctorDetailsAbout(doctor: doctor),
                            DoctorDetailsLocation(doctor: doctor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                        value: provider,
                        child: AlertDialog(
                          title: Text(
                            'Select preferred date',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 16,
                            children: [
                              CustomTextField(
                                controller: provider.timeController,
                                hintText: 'Select preferred time',
                                readOnly: true,
                                onTap: () async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (time != null) {
                                    provider.timeController.text = time.format(
                                      context,
                                    );
                                  }
                                },
                              ),
                              CustomTextField(
                                controller: provider.notesController,
                                hintText: 'Enter Notes',
                                maxLines: 3,
                              ),
                              Consumer<DoctorDetailsProvider>(
                                builder: (context, value, child) {
                                  return CustomButton(
                                    onPressed: () {
                                      provider.storeAppointment(
                                        doctor.id,
                                        context,
                                      );
                                    },
                                    text: 'Make Appointment',
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                text: 'Make an Appointment',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
