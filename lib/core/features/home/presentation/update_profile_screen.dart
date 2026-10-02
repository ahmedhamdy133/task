import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final nameController = TextEditingController(text: 'Ahmed');

  final emailController = TextEditingController(text: 'ahmed@gmail.com');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
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
          'Update Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.w),

        child: Column(
          children: [
            CircleAvatar(
              radius: 45.r,
              backgroundColor: Colors.grey.shade200,
              child: Icon(Icons.person, size: 50.sp, color: Colors.grey),
            ),

            SizedBox(height: 25.h),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 15.h),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 25.h),

            SizedBox(
              width: double.infinity,
              height: 50.h,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00C853),
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),

                child: const Text('Update Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
