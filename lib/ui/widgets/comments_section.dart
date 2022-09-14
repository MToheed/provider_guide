import 'package:flutter/material.dart';
import 'package:provider_guide/core/enums/viewstate.dart';
import 'package:provider_guide/core/viewmodels/comment_model.dart';
import 'package:provider_guide/ui/views/base_view.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({Key? key, required this.postId}) : super(key: key);

  final int postId;

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentModel>(
      onModelReady: (model) => model.fetchComments(postId),
      builder: (context, model, child) {
        return model.getState == ViewState.idle
            ? Expanded(
                child: ListView.builder(
                  itemCount: model.comments.length,
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.comments[index].name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(model.comments[index].body!),
                        const Divider(color: Colors.black),
                      ],
                    );
                  },
                ),
              )
            : const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
