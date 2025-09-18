import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/router/routes.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/core/widgets/custom_button.dart';
import 'package:iti_doctor_app/core/widgets/custom_text_field.dart';
import 'package:iti_doctor_app/features/register/logic/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<RegisterProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Column(
                  spacing: 40,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                          style: TextStyle(color: AppColors.bodyColor),
                        ),
                      ],
                    ),
                    Form(
                      key: provider.formKey,
                      child: Column(
                        spacing: 16,
                        children: [
                          CustomTextField(
                            controller: provider.nameController,
                            hintText: 'Enter Full Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter full name';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: provider.emailController,
                            hintText: 'Enter Email Address',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter email address';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: provider.phoneController,
                            hintText: 'Enter Phone Number',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter phone number';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: provider.passwordController,
                            hintText: 'Enter Password',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter password';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: provider.passwordConfirmationController,
                            hintText: 'Enter Confirmation Password',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter confirmation password';
                              } else if (value !=
                                  provider.passwordController.text) {
                                return 'Passwords don\'t match';
                              }
                              return null;
                            },
                          ),
                          Consumer<RegisterProvider>(
                            builder: (context, value, child) {
                              if (value.isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return CustomButton(
                                onPressed: () {
                                  provider.register(context);
                                },
                                text: 'Create Account',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account yet?',
                  style: TextStyle(color: AppColors.text100Color, fontSize: 12),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
