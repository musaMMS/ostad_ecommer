import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/compelete_profile_screen.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:ostad_ecommerce/widgets/app_logo_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  late AnimationController _controller;
  int _start = 120;
  Timer? _timer;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _isButtonEnabled = false;
    _start = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isButtonEnabled = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _resendOtp() {
    // Add your OTP resend logic here
    startTimer(); // Restart the timer when OTP is resent
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        backToHome();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 82),
                const AppLogoWidget(),
                const SizedBox(height: 24),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'A 6 digit OTP has been sent to email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.green,
                    inactiveFillColor: Colors.white,
                    inactiveColor: AppColors.themeColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _otpTEController,
                  appContext: context,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _onTapNextButton,
                  child: const Text('Next'),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    children: [
                      TextSpan(text: "This code will expire in "),
                      TextSpan(
                        text: "$_start seconds",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: _isButtonEnabled ? _resendOtp : null,
                  // child: Text(
                  //   "Resend Code",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: _isButtonEnabled ? Colors.black : Colors.grey,
                  //   ),
                  // ),
                  child:TextButton(onPressed: () {}, child: const Text('Resend Code'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() {
    Get.to(() => const CompleteProfileScreen());
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }

}
