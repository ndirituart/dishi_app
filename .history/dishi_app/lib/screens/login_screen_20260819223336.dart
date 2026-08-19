//firebase package imports
import 'package:flutter/material.dart';
// import 'package:dishi_app/components/custom_textfield.dart';
//TODO: create components folder and add custom_textfield.dart file
// import 'package:dishi_app/components/custom_button.dart';
import 'package:dishi_app/screens/signup_screen.dart';
import 'package:dishi_app/screens/welcome_screen.dart';
import 'package:dishi_app/screens/home_screen.dart';
import 'package:dishi_app/widgets/button.dart';
import 'package:dishi_app/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = AuthService(); Auth service will be called once

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              "Login",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: _email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              controller: _password,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Login",
              // onPressed: _login, TODO: Implement login functionality once Firebase is set up
              onPressed: () => goToHome(context),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                InkWell(
                  onTap: () => goToSignup(context),
                  child: const Text(
                    "Signup",
                    style: TextStyle(color: PrimaryColor),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SignupScreen()),
  );

  goToHome(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );

  // _login() async {
  //   final user =
  //       await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

  //   if (user != null) {
  //     log("User Logged In");
  //     goToHome(context);
  //   }
  // } TODO: Implement login functionality once Firebase is set up
}
