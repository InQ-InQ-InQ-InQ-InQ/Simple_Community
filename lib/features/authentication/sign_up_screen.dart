import 'package:flutter/material.dart';
import 'package:inq_project/constants/gaps.dart';
import 'package:inq_project/constants/sizes.dart';
import 'package:inq_project/features/authentication/widgets/button.dart';
import 'package:inq_project/features/authentication/widgets/suffix_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onContinueTap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: Sizes.size24,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Back',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
          vertical: Sizes.size16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              '회원가입',
              style: TextStyle(
                fontSize: Sizes.size40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '아이디',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Stack(
                    children: [
                      TextFormField(
                        controller: _idController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ID를 입력해주세요.';
                          }
                          return null;
                        },
                      ),
                      SuffixButton(
                        width: width,
                        height: height,
                        text: '중복확인',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '비밀번호',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size20,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: '8~30자리, 영어/특문/숫자 조합',
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    String passwordPattern =
                        r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@#$%^&+=!])(?=.{8,30}$)';
                    if (value!.isEmpty) {
                      return '비밀번호를 입력해주세요.';
                    } else if (RegExp(passwordPattern).hasMatch(value)) {
                      return value;
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '비밀번호 확인',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size20,
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == _passwordController.text) {
                      return value;
                    }
                    return null;
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.size28),
                  child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          return _onContinueTap();
                        }
                      },
                      child: const Button(buttonText: 'Continue')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.h5,
                    GestureDetector(
                      onTap: _onContinueTap,
                      child: const Text(
                        'Log in',
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
          ],
        ),
      ),
    );
  }
}
