import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_guide/core/models/post.dart';
import 'package:provider_guide/ui/widgets/comments_section.dart';
import 'package:provider_guide/ui/widgets/like_button.dart';

import '../../core/models/user.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post View")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "By ${Provider.of<User>(context).name!}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
            Text(post.body!),
            const SizedBox(height: 10),
            LikeButton(postId: post.id!),
            const SizedBox(height: 30),
            const Text(
              "Comments",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const SizedBox(height: 10),
            CommentsSection(postId: post.id!),
          ],
        ),
      ),
    );
  }
}
