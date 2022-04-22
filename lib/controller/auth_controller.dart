import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naasco_mart/helper/showLoading.dart';
import 'package:naasco_mart/model/user.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/utlis/firebase.dart';
import 'package:naasco_mart/view/screens/home_screen.dart';
import 'package:naasco_mart/view/screens/login_screen.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isLoggedIn = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    //our user will notifide

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  void register() async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _clearControllers();
      });

      //create user in database.dart

    } catch (error) {
      debugPrint(error.toString());
      Get.snackbar("Sign Up Failed", "Try again");
    }
  }

  void login() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((value) => _clearControllers());
    } catch (error) {
      debugPrint(error.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void logOut() async {
    try {
      showLoading();
      await auth.signOut();
    } catch (error) {
      debugPrint(error.toString());
      Get.snackbar("Logut Failed", "Try again");
    }
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
    });
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }


 updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(_user.value!.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(_user.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));



}
