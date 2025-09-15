
import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';
import 'package:iti_doctor_app/core/widgets/custom_button.dart';
import 'package:iti_doctor_app/core/widgets/custom_text_field.dart';
import 'package:iti_doctor_app/features/login/logic/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();
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
                          'Welcome Back!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
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
                            controller: provider.emailController,
                            hintText: 'Email',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email Address';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: provider.passwordController,
                            hintText: 'Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          Consumer<LoginProvider>(
                            builder: (context, value, child) {
                              if (provider.isLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return CustomButton(
                                onPressed: () {
                                  provider.login();
                                },
                                text: 'Login',
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
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
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
