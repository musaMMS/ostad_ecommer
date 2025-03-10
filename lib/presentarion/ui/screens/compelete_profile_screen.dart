
import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/home_screnn.dart';
import 'package:ostad_ecommerce/widgets/app_logo_widget.dart';
import 'package:get/get.dart';
class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
                const SizedBox(height: 32),
                const AppLogoWidget(),
                const SizedBox(height: 24),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Get started with us by providing your information',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'First name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Last name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Mobile'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'City'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'Shipping Address'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapCompleteButton,
                  child: const Text('Complete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapCompleteButton() {
    Get.to(()=>  HomeScreen());
  }

  @override
  void dispose() {
    super.dispose();
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
}