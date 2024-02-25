import 'package:bloc_example_app/src/app_colors.dart';
import 'package:bloc_example_app/views/auth/register/widgets/age_field.dart';
import 'package:bloc_example_app/views/auth/register/widgets/city_field.dart';
import 'package:bloc_example_app/views/auth/register/widgets/first_name_field.dart';
import 'package:bloc_example_app/views/auth/register/widgets/gender_field.dart';
import 'package:bloc_example_app/views/auth/register/widgets/last_name_field.dart';
import 'package:bloc_example_app/views/auth/widgets/auth_button.dart';
import 'package:bloc_example_app/views/auth/widgets/password_field.dart';
import 'package:bloc_example_app/views/auth/widgets/email_field.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key, required this.isLogin}) : super(key: key);

  final dynamic _formKey = GlobalKey<FormState>();
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmailField(isLogin: isLogin),
            PasswordField(isLogin: isLogin),

            if (!isLogin)
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    FirstNameField(),
                    LastNameField(),
                    AgeField(),
                    GenderField(),
                    CityField(),
                  ],
                ),
              ),
            const SizedBox(height: 15,),
            AuthButton(
              formKey: _formKey,
              isLogin: isLogin,
            ),
          ],
        ),
      ),
    );
  }
}
