part of 'extensions.dart';

extension FirebaseUserExtension on User {
  UserData convertToUser({
    String email = 'no name',
    String username = 'username',
  }) =>
      UserData(
        uid,
        email,
        username: username,
      );

  Future<UserData?> fromFireStore() async => await UserServices.getUser(uid);
}
