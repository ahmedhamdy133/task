import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_assets.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/custom_btn.dart';
import '../../../../utils/app_paddings.dart';
import 'login_screen.dart';

class LetStartScreen extends StatelessWidget {
  const LetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.defaultPadding,
          child: Column(
            children: [
              SizedBox(height: 40.h),

              Padding(
                padding: REdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  AppSvgs.onBoarding,
                  width: double.infinity,
                  height: 220.h,
                ),
              ),

              SizedBox(height: 25.h),

              Text(
                'Welcome To\nDo It !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.sp,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: 15.h),

              Text(
                "Ready to conquer your tasks? Let's Do It together.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.grey,
                ),
              ),

              SizedBox(height: 25.h),

              CustomBtn(
                text: "Let's Start",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
