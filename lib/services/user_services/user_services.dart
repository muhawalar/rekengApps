part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user_data');

  static Future<void> updateUser(UserData users) async {
    _userCollection.doc(users.userID).set({
      'email': users.email,
      'username': users.username,
    });
  }

  static Future<UserData?> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    var data = snapshot.data() as Map;
    return UserData(
      id,
      data['email'],
      username: data['username'],
    );
  }

  static Future<void> updateData(String email, String id) async {
    await _userCollection.doc(email).update({'name': 'id'});
  }
}
