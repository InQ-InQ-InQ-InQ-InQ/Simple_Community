import 'package:flutter/material.dart';
import 'package:inq_project/constants/gaps.dart';
import 'package:inq_project/constants/sizes.dart';
import 'package:inq_project/features/authentication/sign_up_screen.dart';
import 'package:inq_project/features/authentication/widgets/button.dart';
import 'package:inq_project/features/main_board/board_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keyboardFocus = true;
  void _onLoginTap() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BoardScreen()),
        (route) => false);
  }

  void _onSignUpTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      keyboardFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _stopWriting,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ID',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  TextFormField(
                    onTap: () => keyboardFocus = true,
                  ),
                ],
              ),
              Gaps.v32,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  TextFormField(
                    onTap: () => keyboardFocus = true,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  Gaps.v40,
                  GestureDetector(
                    onTap: _onLoginTap,
                    child: const Button(buttonText: 'Log in'),
                  ),
                ],
              ),
              Gaps.v40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h4,
                  GestureDetector(
                    onTap: () => _onSignUpTap(),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
