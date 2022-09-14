import 'package:flutter/material.dart';
import '../enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  var _state = ViewState.idle;

  ViewState get getState => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
