import 'package:busha_flutter_assessment/core/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<OnboardingViewModel>().navigate((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed("home");
      } else {
        Navigator.of(context).pushReplacementNamed("login");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.money,
        color: Colors.green,
      ),
    );
  }
}
