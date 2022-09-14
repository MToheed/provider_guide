import 'package:provider_guide/core/viewmodels/base_model.dart';
import 'package:provider_guide/locator.dart';
import '../enums/viewstate.dart';
import '../services/auth_service.dart';

class LoginModel extends BaseModel {
  final _authService = locator<AuthService>();
  var errorMessage = "";

  Future<bool> login(String userIdText) async {
    setState(ViewState.busy);

    if (userIdText.isEmpty) {
      errorMessage = "* required";

      setState(ViewState.idle);
      return false;
    }

    int userId = int.parse(userIdText);
    var success = await _authService.login(userId);

    setState(ViewState.idle);

    return success;
  }
}
