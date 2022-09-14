import 'package:flutter/material.dart';
import 'package:provider_guide/core/models/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.post, required this.press})
      : super(key: key);

  final Post post;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  post.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Likes: ${post.likes}"),
                Text(post.body!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
