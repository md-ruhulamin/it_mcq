
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:it_mcq/data/user_model.dart';


class UserRepository {
  final _userRef = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserModel user) async {
    await _userRef.doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await _userRef.doc(userId).get();
    if (doc.exists) return UserModel.fromMap(doc.data()!, doc.id);
    return null;
  }

  Future<void> updateUser(UserModel user) async {
    await _userRef.doc(user.id).update(user.toMap());
  }

  Stream<List<UserModel>> loadAllUsers() {
    return _userRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromMap(doc.data(), doc.id)).toList());
  }

  Future<void> deleteUser(String userId) async {
    await _userRef.doc(userId).delete();
  }
}
