import 'package:flutter/material.dart';
import 'package:provider_guide/core/models/post.dart';
import 'package:provider_guide/ui/views/home_view.dart';
import 'package:provider_guide/ui/views/login_view.dart';
import 'package:provider_guide/ui/views/post_view.dart';

class MyRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route found: ${settings.name}"),
            ),
          ),
        );
    }
  }
}
