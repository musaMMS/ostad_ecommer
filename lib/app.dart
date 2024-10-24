
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/bottom_nav_screen.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/splash_screen.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ManinButtonNavScreen(),
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themeColor,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: _outlineInputBorder(),
          enabledBorder: _outlineInputBorder(),
          focusedBorder: _outlineInputBorder(),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
          errorBorder: _outlineInputBorder(Colors.red),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.themeColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(fontSize: 16),
              fixedSize: const Size.fromWidth(double.maxFinite)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.themeColor,
              textStyle: const TextStyle(fontSize: 16)),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor, width: 1),
      borderRadius: BorderRadius.circular(8),
    );
  }
}