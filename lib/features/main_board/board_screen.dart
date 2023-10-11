import 'package:flutter/material.dart';
import 'package:inq_project/constants/sizes.dart';
import 'package:inq_project/features/main_board/widgets/prefix_post.dart';
import 'package:inq_project/service/post.dart';

import '../../models/post_model.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});
  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          '게시판',
          style: TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: posts,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var post = snapshot.data![index];
                return GestureDetector(
                  onTap: () {},
                  child: PrefixPost(
                    body: post.body,
                    id: post.id,
                    title: post.title,
                    userId: post.userId,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
