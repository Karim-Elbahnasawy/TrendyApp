import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await sendEmailVerification(email);
    return userCredential;
  }

  static Future<UserCredential> login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<void> fogotPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> sendEmailVerification(String email) async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }
}
