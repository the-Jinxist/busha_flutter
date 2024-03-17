import 'package:busha_flutter_assessment/core/auth/repository/login_repository.dart';
import 'package:busha_flutter_assessment/core/auth/screens/login_screen.dart';
import 'package:busha_flutter_assessment/core/auth/viewmodels/login_viewmodel.dart';
import 'package:busha_flutter_assessment/core/home/screens/home_screen.dart';
import 'package:busha_flutter_assessment/core/onboarding/screens/splash_screen.dart';
import 'package:busha_flutter_assessment/core/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:busha_flutter_assessment/core/transactions/repository/transaction_repository.dart';
import 'package:busha_flutter_assessment/core/transactions/screens/transaction_details_screen.dart';
import 'package:busha_flutter_assessment/core/transactions/screens/transactions_screen.dart';
import 'package:busha_flutter_assessment/core/transactions/viewmodels/transaction_viewmodel.dart';
import 'package:busha_flutter_assessment/shared/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => LoginViewmodel(LoginRepository(), AuthRepo()),
    ),
    ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(AuthRepo()),
    ),
    ChangeNotifierProvider(
      create: (context) => TransactionViewmodel(TransactionRepository()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busha Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "home": (context) {
          return const HomeScreen();
        },
        "login": (context) {
          return const LoginScreen();
        },
        "transactions": (context) => const TransactionsScreen(),
        "transaction_details": (context) => const TransactionDetailsScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
