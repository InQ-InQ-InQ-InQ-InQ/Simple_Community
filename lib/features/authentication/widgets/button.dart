import 'package:flutter/material.dart';
import 'package:inq_project/constants/sizes.dart';

class Button extends StatelessWidget {
  final String buttonText;
  const Button({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size12),
              color: Colors.black54,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
