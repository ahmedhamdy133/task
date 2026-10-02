import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/features/auth/presentation/views/splash_screen.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lexend_Deca',
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestScreenState();
  }
}

class TestScreenState extends State<StatefulWidget> {
  Color containerColor = Colors.red;

  bool switchStatus = false;
  bool checkBoxStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Screen')),
      body: Column(
        children: [
          Container(height: 200, width: 200, color: containerColor),
          SizedBox(height: 20),
          Row(
            children: [
              Text('WIFI'),
              SizedBox(width: 20),
              Switch(
                value: switchStatus,
                onChanged: (bool newValue) {
                  setState(() {
                    switchStatus = newValue;
                  });
                },
              ),
            ],
          ),
          Checkbox(
            value: checkBoxStatus,
            onChanged: (newValue) {
              setState(() {
                checkBoxStatus = newValue!;
              });
            },
          ),
          SwitchListTile(
            title: Text('WIFI'),
            subtitle: Text('WIFI is ${switchStatus ? 'ON' : 'OFF'}'),
            value: switchStatus,
            onChanged: (bool newValue) {
              setState(() {
                switchStatus = newValue;
              });
            },
          ),
          CheckboxListTile(
            value: checkBoxStatus,
            onChanged: (newValue) {
              setState(() {
                checkBoxStatus = newValue!;
              });
            },
            title: Text('CheckBox'),
            subtitle: Text('CheckBox is ${checkBoxStatus ? 'ON' : 'OFF'}'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                containerColor = Colors.blue;
              });
            },
            child: Text('Change Color'),
          ),
        ],
      ),
    );
  }
}
