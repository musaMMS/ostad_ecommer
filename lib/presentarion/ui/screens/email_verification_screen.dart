
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/otp_verification_screen.dart';
import 'package:ostad_ecommerce/widgets/app_logo_widget.dart';
class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

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
                  'Welcome back',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapNextButton,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() {
    Get.to(() => const OtpVerificationScreen());
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
}