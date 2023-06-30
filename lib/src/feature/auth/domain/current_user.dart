import 'package:pet_app/src/feature/auth/domain/user.dart';

///This class represent a current used loged in the app
///the flag [_initializated] determine if the user has loged or not
///by default [_initializated] is false
///
///This class is used with singleton to always get only one instance of [CurrentUser]
///in entire application
///
class CurrentUser {
  late User? _user;
  bool _initializated = false;

  CurrentUser._();

  ///Singleton to get always the same instance value of [CurrentUser]
  static final CurrentUser _instance = CurrentUser._();

  User? get user => _user;

  bool get initializated => _initializated;

  static CurrentUser get instance {
    return _instance;
  }

  ///This method refresh [_user] and [_initializated] to the initial data
  void setInitial() {
    _user = null;
    _initializated = false;
  }

  void setUser(User user) {
    _user = user;
  }

  void setInitialized(bool initializated) {
    _initializated = initializated;
  }
}