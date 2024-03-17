import 'package:busha_flutter_assessment/core/auth/viewmodels/login_viewmodel.dart';
import 'package:busha_flutter_assessment/util/resource.dart';
import 'package:busha_flutter_assessment/util/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Log in to your account",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const Text(
                        "Welcome back! Please enter your registered email address to continue"),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email Address"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "email@address.com",
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (email) {
                              if (email != null) {
                                if (!Validator.isValidEmailAddress(email)) {
                                  return "Please input a valid email";
                                }

                                return null;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text("Password"),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: true,
                            obscuringCharacter: "·",
                            decoration: InputDecoration(
                              hintText: "****",
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            controller: passwordController,
                            validator: (pass) {
                              if (pass != null) {
                                if (pass.length < 8) {
                                  return "Please input a valid password";
                                }

                                return null;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              right: 15,
              left: 15,
              child: ElevatedButton(
                onPressed: () {
                  loginIn();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(screenSize.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> loginIn() async {
    if (_formKey.currentState!.validate()) {
      final vm = context.read<LoginViewmodel>();
      vm
          .login(email: emailController.text, password: passwordController.text)
          .then((value) {
        if (vm.loginResource.ops == NetworkStatus.successful) {
          Navigator.of(context).pushReplacementNamed("home");
        }
      });
    }
  }
}
