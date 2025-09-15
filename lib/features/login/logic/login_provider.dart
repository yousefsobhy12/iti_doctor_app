import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/networking/api_constants.dart';
import 'package:iti_doctor_app/core/networking/dio_factory.dart';
import 'package:iti_doctor_app/features/login/data/models/login_response_model.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  
  get Fluttertoast => null;
  void login() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        final response = await DioFactory.postData(
          ApiConstants.login,
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        final json = response.data;
        final data = LoginResponseModel.fromJson(json);
        Fluttertoast.showToast(msg: data.message);
      } catch (e) {
        Fluttertoast.showToast(msg: 'Credentails don\'t correct');
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
