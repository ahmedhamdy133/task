import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),

                // Header
                Text(
                  'Good Morning, Ahmed Saber',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF202020),
                  ),
                ),

                SizedBox(height: 8.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Friday, September 18',
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                    ),

                    Row(
                      children: [
                        Icon(Icons.wb_sunny, color: Colors.orange, size: 20.sp),
                        SizedBox(width: 5.w),
                        Text(
                          'Sunny 32°C',
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 25.h),

                // Featured Banner
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.r),
                  child: SizedBox(
                    width: double.infinity,
                    height: 230.h,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/image.png.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          left: 18.w,
                          right: 18.w,
                          bottom: 18.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Experience the Serenity...',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(height: 7.h),

                              Text(
                                'Luc Olinga',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                // Carousel dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3478D4),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      width: 6.w,
                      height: 6.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
