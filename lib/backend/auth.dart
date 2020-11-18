import 'package:firebase_auth/firebase_auth.dart';
import 'package:mateop_admin/backend/api.dart';
import 'package:mateop_admin/models/user.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

User currentUser() {
  return _auth.currentUser;
}

Future<StaffUser> signIn(email, password) async {
  UserCredential userCredential;
  try {
    userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    String token = await userCredential.user.getIdToken();
    Map user = await getStaff(email);
    return StaffUser(
        name: userCredential.user.displayName,
        email: userCredential.user.email,
        clearance: user['clearance'],
        token: token,
        unit: user['data']['unit']);
  } catch (error) {
    throw error;
  }
}

Future<bool> recover(email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    return true;
  } catch (error) {
    switch (error.code) {
      case "user-not-found":
        throw Exception('Usuario no encontrado.');
      default:
        throw 'Intentalo de nuevo';
    }
  }
}

Future<bool> signOut() async {
  await _auth.signOut();
  return true;
}
