import 'dart:async';
import '../../locator.dart';
import '../models/user.dart';
import 'api.dart';

class AuthService {
  final _api = locator<Api>();
  final controller = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);
    var hasUser = fetchedUser != null;

    if (hasUser) {
      controller.add(fetchedUser);
    }
    return hasUser;
  }
}
