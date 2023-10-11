import 'package:flutter/material.dart';
import 'package:inq_project/constants/sizes.dart';

class SuffixButton extends StatelessWidget {
  const SuffixButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
  });

  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: width / 50,
      bottom: height / 70,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(Sizes.size8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
            vertical: Sizes.size4,
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
