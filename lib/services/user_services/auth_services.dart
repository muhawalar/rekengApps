part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Fugnsi Untuk Melakukan SignUp

  static Future<bool> signUp(
    String email,
    String password,
    String username,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // ...

      UserData user = userCredential.user!.convertToUser(
        email: email,
        username: username,
      );

      // ...

      await UserServices.updateUser(user);

      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  // Fugnsi Untuk Melakukan SignIn

  static Future<UserData?> signIn(String email, String password) async {
    try {
      print(email);
      print(password);
      UserCredential authCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserData? users = await authCredential.user!.fromFireStore();

      return users;
    } catch (e) {
      throw Exception('ini error => ' + e.toString());
    }
  }

  // Fugnsi Untuk Melakukan SignOut

  // static Future<void> signOut() async {
  //   await _auth.signOut();
  //   contextGlobal.read<UserBloc>().add(SignOut());
  // }

  // Fungsi untuk melakukan pengecekan state now

  static Stream<User?> get userStream => _auth.authStateChanges();
}

class SingInSingUpResult {
  final UserData? users;
  final String? message;

  SingInSingUpResult({this.users, this.message});
}
