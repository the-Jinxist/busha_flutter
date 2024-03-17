import 'package:busha_flutter_assessment/core/auth/repository/login_repository.dart';
import 'package:busha_flutter_assessment/core/auth/screens/login_screen.dart';
import 'package:busha_flutter_assessment/core/auth/viewmodels/login_viewmodel.dart';
import 'package:busha_flutter_assessment/core/home/screens/home_screen.dart';
import 'package:busha_flutter_assessment/shared/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Verify we are in the correct page', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    final titleFinder = find.text('Log in to your account');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Enter invalid email address and get error text', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    final textFieldFinder =
        find.widgetWithText(TextFormField, 'email@address.com');
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'bademail');
    await tester.pump();

    //Error text for invalid email address shows
    final emailErrorTextFinder = find.text('Please input a valid email');
    expect(emailErrorTextFinder, findsOneWidget);
  });

  testWidgets('Enter invalid password and get error text', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    final textFieldFinder = find.widgetWithText(TextFormField, '****');
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, '1234');
    await tester.pump();

    //Error text for invalid email address shows
    final emailErrorTextFinder = find.text('Please input a valid password');
    expect(emailErrorTextFinder, findsOneWidget);
  });

  testWidgets('Enter valid email ad password and proceed to home screen',
      (tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => LoginViewmodel(LoginRepository(), AuthRepo()),
      child: MaterialApp(
        routes: {
          "home": (context) => const HomeScreen(),
        },
        home: const LoginScreen(),
      ),
    ));

    final emailTextFieldFinder =
        find.widgetWithText(TextFormField, 'email@address.com');
    expect(emailTextFieldFinder, findsOneWidget);

    final passwordTextFieldFinder = find.widgetWithText(TextFormField, '****');
    expect(passwordTextFieldFinder, findsOneWidget);

    await tester.enterText(emailTextFieldFinder, 'nerosilva522@gmail.com');
    await tester.enterText(passwordTextFieldFinder, '123456789');

    await tester.pump();

    //Error text for invalid email address shows
    final emailErrorTextFinder = find.text('Please input a valid password');
    final passwordErrorTextFinder = find.text('Please input a valid email');

    expect(emailErrorTextFinder, findsNothing);
    expect(passwordErrorTextFinder, findsNothing);

    final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Continue');
    expect(loginButtonFinder, findsOneWidget);

    await tester.tap(loginButtonFinder);
    await tester.pump(const Duration(seconds: 1));

    // Verify that we navigate to home screen
    final homeMyBalanceTextFinder = find.text('My balance');
    expect(homeMyBalanceTextFinder, findsOneWidget);
  });
}
