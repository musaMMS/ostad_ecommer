
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/bottom_nav_screen.dart';
import 'package:ostad_ecommerce/widgets/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => const ManinButtonNavScreen());
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        backToHome();
      },
      child: const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                AppLogoWidget(),
                Spacer(),
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  'version 1.0.0',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
}