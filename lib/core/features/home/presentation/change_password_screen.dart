import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();

  final newPasswordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),

      appBar: AppBar(
        backgroundColor: const Color(0xffF8F8F8),
        elevation: 0,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
        ),

        centerTitle: true,

        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.w),

        child: Column(
          children: [
            TextField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: _inputDecoration('Current Password'),
            ),

            SizedBox(height: 15.h),

            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: _inputDecoration('New Password'),
            ),

            SizedBox(height: 15.h),

            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: _inputDecoration('Confirm New Password'),
            ),

            SizedBox(height: 25.h),

            SizedBox(
              width: double.infinity,
              height: 50.h,

              child: ElevatedButton(
                onPressed: () {
                  if (newPasswordController.text !=
                      confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Passwords do not match')),
                    );

                    return;
                  }

                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00C853),
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),

                child: const Text('Change Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      labelText: hint,

      filled: true,
      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
    );
  }
}
