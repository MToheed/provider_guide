import 'package:provider_guide/core/enums/viewstate.dart';
import 'package:provider_guide/core/models/post.dart';
import 'package:provider_guide/core/viewmodels/base_model.dart';
import 'package:provider_guide/locator.dart';
import '../services/api.dart';
import '../services/post_service.dart';

class HomeModel extends BaseModel {
  // final _api = locator<Api>();
  final _postService = locator<PostService>();
  List<Post> get getPosts => _postService.getPosts;

  // List<Post> posts = [];

  Future<void> fetchPosts(int userId) async {

    setState(ViewState.busy);
    // posts = await _api.getPostsForUser(userId);
    await _postService.fetchPosts(userId);
    setState(ViewState.idle);

  }
}
