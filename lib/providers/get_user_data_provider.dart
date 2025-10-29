import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trendy_app/core/firebase/firebase_services.dart';
import 'package:trendy_app/models/user_model.dart';

class GetUserDataProvider extends ChangeNotifier {
  GetUserDataProvider() {
    getUserData();
  }
  UserModel? userModel;

  Future<void> getUserData() async {
    userModel = await FirebaseServices.getUserFromFireStoreById(
      FirebaseAuth.instance.currentUser!.uid,
    );
    notifyListeners();
  }
}
