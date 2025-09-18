import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iti_doctor_app/core/local_storage/shared_prefereneces_helper.dart';
import 'package:iti_doctor_app/core/networking/api_constants.dart';
import 'package:iti_doctor_app/core/networking/dio_factory.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/features/login/data/models/login_response_model.dart';
import 'package:iti_doctor_app/features/register/models/register_request_body_model.dart';

class RegisterProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  bool isLoading = false;
  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final body = RegisterRequestBodyModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      );
      try {
        final response = await DioFactory.postData(
          ApiConstants.register,
          data: body.toJson(),
        );
        final data = LoginResponseModel.fromJson(response.data);
        await SharedPreferencesHelper.setString('token', data.data.token);
        Fluttertoast.showToast(msg: data.message);
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.home,
          (route) => false,
        );
      } catch (e) {
        Fluttertoast.showToast(msg: 'Failed to register account');
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
