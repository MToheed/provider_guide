import 'package:flutter/material.dart';
import 'package:provider_guide/core/models/post.dart';
import 'package:provider_guide/core/viewmodels/like_model.dart';
import 'package:provider_guide/ui/views/base_view.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key, required this.postId}) : super(key: key);

  final int postId;

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeModel>(
      builder: (context, model, child) {
        return Row(
          children: [
            IconButton(
              onPressed: () {
                model.increaseLikes(postId);
              },
              icon: const Icon(Icons.thumb_up_alt_outlined),
            ),
            Text("${model.postLikes(postId)}"),
          ],
        );
      },
    );
  }
}
