import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/features/home/presentation/home_screen.dart';
import 'package:flutter_application_2/core/utils/app_assets.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/custom_btn.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../utils/app_paddings.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                bottomLeft: Radius.circular(20.r),
              ),
              child: Image.asset(
                AppImages.flag,
                width: double.infinity,
                height: 293.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Text(
                    'Image Error: $error',
                    style: const TextStyle(color: Colors.red),
                  );
                },
              ),
            ),

            Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                children: [
                  SizedBox(height: 23.h),

                  CustomTextField(
                    controller: usernameController,
                    hint: 'Username',
                    prefixIconPath: AppSvgs.profile,
                  ),

                  SizedBox(height: 10.h),

                  CustomTextField(
                    controller: passwordController,
                    hint: 'Password',
                    prefixIconPath: AppSvgs.password,
                    suffixIconPath: isPasswordSecure
                        ? AppSvgs.lockOpen
                        : AppSvgs.lockClosed,
                    onSuffixPressed: () {
                      setState(() {
                        isPasswordSecure = !isPasswordSecure;
                      });
                    },
                    obscureText: isPasswordSecure,
                  ),

                  SizedBox(height: 23.h),

                  CustomBtn(
                    text: 'Login',
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();

                      final savedUsername = prefs.getString('username');

                      final savedPassword = prefs.getString('password');

                      if (usernameController.text == savedUsername &&
                          passwordController.text == savedPassword) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Username or password is incorrect'),
                          ),
                        );
                      }
                    },
                  ),

                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.grey,
                        ),
                      ),

                      SizedBox(width: 5.w),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
