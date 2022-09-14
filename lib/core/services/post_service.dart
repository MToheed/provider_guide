import 'package:provider_guide/core/models/post.dart';
import 'package:provider_guide/locator.dart';
import 'api.dart';

class PostService {
  final _api = locator<Api>();
  List<Post> _posts = [];

  List<Post> get getPosts => _posts;

  Future<void> fetchPosts(int userId) async {
    _posts = await _api.getPostsForUser(userId);
  }

  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }
}
