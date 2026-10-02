import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'update_profile_screen.dart';
import 'change_password_screen.dart';
import 'language_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xffF8F8F8),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 18,
          ),
        ),

        centerTitle: true,

        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),

        child: Column(
          children: [
            SizedBox(height: 20.h),

            // ================= PROFILE IMAGE =================
            CircleAvatar(
              radius: 48.r,
              backgroundColor: Colors.grey.shade200,

              child: Icon(Icons.person, size: 55.sp, color: Colors.grey),
            ),

            SizedBox(height: 12.h),

            Text(
              'Ahmed',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5.h),

            Text(
              'Welcome Back',
              style: TextStyle(fontSize: 13.sp, color: Colors.grey),
            ),

            SizedBox(height: 30.h),

            // ================= OPTIONS =================
            _profileOption(
              context: context,
              icon: Icons.person_outline,
              title: 'Update Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateProfileScreen(),
                  ),
                );
              },
            ),

            _profileOption(
              context: context,
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ),
                );
              },
            ),

            _profileOption(
              context: context,
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: ListTile(
        onTap: onTap,

        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),

        leading: Icon(icon, color: Colors.black87, size: 23.sp),

        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
