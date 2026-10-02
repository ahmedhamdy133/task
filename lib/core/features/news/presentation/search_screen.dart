import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        backgroundColor: const Color(0xFF3478D4),
        child: const Icon(Icons.home, color: Colors.white),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),

              Text(
                'Search',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF202020),
                ),
              ),

              SizedBox(height: 20.h),

              Container(
                height: 52.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F5F7),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for news...',
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24.sp,
                      color: const Color(0xFF3478D4),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              Text(
                'Search News',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF202020),
                ),
              ),

              SizedBox(height: 15.h),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(30.0444, 31.2357),
                      initialZoom: 10,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.news_app',
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}
