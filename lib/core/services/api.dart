import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_guide/core/models/comment.dart';
import 'package:provider_guide/core/models/post.dart';
import 'package:provider_guide/core/models/user.dart';

class Api {
  static const endPoint = "https://jsonplaceholder.typicode.com";
  var client = http.Client();

  Future<User?> getUserProfile(int userId) async {
    var url = Uri.parse("$endPoint/users/$userId");
    var response = await client.get(url);
    print(response.body);
    return User.fromJson(jsonDecode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    List<Post> posts = [];

    var url = Uri.parse("$endPoint/posts?userId=$userId");
    var response = await client.get(url);

    var parsed = jsonDecode(response.body) as List<dynamic>;

    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    List<Comment> comments = [];

    var url = Uri.parse("$endPoint/comments?postId=$postId");
    var response = await client.get(url);

    var parsed = jsonDecode(response.body) as List<dynamic>;

    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
