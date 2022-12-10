import 'package:flutter/cupertino.dart';
import 'package:rekeng_apps/provider/rekeng_model.dart';
import 'package:rekeng_apps/services/user_services/services.dart';

class UserProvider with ChangeNotifier {
  UserData _userData = UserData('', '', username: '');

  UserData get user => _userData;

  Future<bool> login({required String email, required String password}) async {
    try {
      _userData = await AuthServices.signIn(email, password) ?? _userData;
      return true;
    } catch (e) {
      return false;
    }
  }
}
