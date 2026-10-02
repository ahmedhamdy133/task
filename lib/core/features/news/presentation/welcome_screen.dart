import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'search_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية الزرقاء
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFF3478D4),
          ),

          // صورة المبنى
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/welcome.png',
              width: double.infinity,
              height: 400.h,
              fit: BoxFit.cover,
            ),
          ),

          // الكارت الأبيض
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 350.h,
              padding: EdgeInsets.fromLTRB(28.w, 30.h, 28.w, 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get the Latest News',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF202020),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    'And Updates',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3478D4),
                    ),
                  ),

                  SizedBox(height: 14.h),

                  Text(
                    'From Politics to Entertainment; Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Globe will be right on your hand.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3478D4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Explore  →',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
