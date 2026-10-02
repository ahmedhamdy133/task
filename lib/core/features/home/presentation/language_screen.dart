import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

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

        title: const Text('Language', style: TextStyle(color: Colors.black)),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.w),

        child: Column(
          children: [
            _languageOption('English'),

            SizedBox(height: 12.h),

            _languageOption('Arabic'),
          ],
        ),
      ),
    );
  }

  Widget _languageOption(String language) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),

      child: RadioListTile<String>(
        value: language,
        groupValue: selectedLanguage,

        title: Text(language, style: TextStyle(fontSize: 14.sp)),

        activeColor: const Color(0xff00C853),

        onChanged: (value) {
          if (value == null) return;

          setState(() {
            selectedLanguage = value;
          });
        },
      ),
    );
  }
}
