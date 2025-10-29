import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trendy_app/core/utils/app_constants.dart';
import 'package:trendy_app/models/user_model.dart';

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

  static CollectionReference<UserModel> getUserCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> userCollection = db
        .collection(AppConstants.users)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return userCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel> getUserFromFireStoreById(String uid) async {
    CollectionReference<UserModel> userCollection = getUserCollection();
    DocumentReference<UserModel> userDocument = userCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
    return documentSnapshot.data()!;
  }
}
