import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/%E5%AD%A6%E4%B9%A0%E6%A1%88%E4%BE%8B/24_%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/model/user_model.dart';

class HYUserViewModel extends ChangeNotifier {
  UserInfo _user;

  HYUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
  }
}