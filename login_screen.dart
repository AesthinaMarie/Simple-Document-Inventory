import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pitbiarhive/view/widgets/c_button.dart';
import 'package:pitbiarhive/view/widgets/c_text.dart';
import 'package:pitbiarhive/view/widgets/c_textfield.dart';
import 'package:pitbiarhive/view/widgets/constant.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.2),
            // Logo - Title
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  fontWeight: FontWeight.bold,
                  fontsize: 40,
                  text: "PITBI",
                  color: ColorTheme.oranges,
                ),
                CustomText(
                  fontWeight: FontWeight.bold,
                  fontsize: 40,
                  text: "ARCHIVE",
                  color: ColorTheme.blues,
                ),
              ],
            ),
            SizedBox(height: height * 0.08),
            // User
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.4),
              child: CustomTextField(
                controller: userController,
                hint: 'User',
              ),
            ),
            //Password
            SizedBox(height: height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.4),
              child: CustomTextField(
                controller: passwordController,
                hint: 'Password',
              ),
            ),
            SizedBox(height: height * 0.05),
            //Button
            CustomElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: userController.text,
                      password: passwordController.text);
                },
                text: "Login",
                width: width * 0.2,
                height: height * 0.08)
          ],
        ),
      ),
    );
  }
}
