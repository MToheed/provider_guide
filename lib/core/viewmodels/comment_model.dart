import 'package:provider_guide/core/enums/viewstate.dart';
import 'package:provider_guide/core/models/comment.dart';
import 'package:provider_guide/core/viewmodels/base_model.dart';
import 'package:provider_guide/locator.dart';
import '../services/api.dart';

class CommentModel extends BaseModel {
  final _api = locator<Api>();
  List<Comment> comments = [];

  Future<void> fetchComments(int postId) async {
    setState(ViewState.busy);

    comments = await _api.getCommentsForPost(postId);

    setState(ViewState.idle);
  }
}
