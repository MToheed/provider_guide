import 'package:get_it/get_it.dart';
import 'package:provider_guide/core/services/api.dart';
import 'package:provider_guide/core/services/auth_service.dart';
import 'package:provider_guide/core/services/post_service.dart';
import 'package:provider_guide/core/viewmodels/comment_model.dart';
import 'package:provider_guide/core/viewmodels/home_model.dart';
import 'package:provider_guide/core/viewmodels/like_model.dart';
import 'package:provider_guide/core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => PostService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentModel());
  locator.registerFactory(() => LikeModel());
}
