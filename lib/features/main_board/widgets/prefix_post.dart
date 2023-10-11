import 'package:flutter/material.dart';
import 'package:inq_project/constants/sizes.dart';

class PrefixPost extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PrefixPost({
    super.key,
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size16,
        vertical: Sizes.size10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$id'),
          Text('$userId'),
          Text(title),
          Text(body),
        ],
      ),
    );
  }
}
