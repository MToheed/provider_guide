import 'package:provider_guide/core/services/post_service.dart';
import 'package:provider_guide/core/viewmodels/base_model.dart';
import 'package:provider_guide/locator.dart';

class LikeModel extends BaseModel {
  final _postService = locator<PostService>();

  int postLikes(int postId) {
    return _postService.getPosts.firstWhere((post) => post.id == postId).likes;
  }

  void increaseLikes(int postId) {
    _postService.incrementLikes(postId);
    notifyListeners();
  }
}
