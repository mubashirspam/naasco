import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naasco_mart/view/screens/home_screen.dart';
import 'package:naasco_mart/view/screens/login_screen.dart';
import 'package:naasco_mart/view/widgets/texts.dart';



class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  
  // User? get user => _user.value;
  

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
      Get.offAll(() => HomePage(
            email: user.email,
          ));
    }
  }

  void register(String email, String password, String name) async {
    try {
     
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //create user in database.dart
    
    } catch (error) {
      Get.snackbar(
        "About user",
        "User Message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: mainText('Account Creation Faild'),
        messageText: mainText(error.toString()),
      );

      print(error);
    }
  }



  void login(String email, String password) async {
    try {
     
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
    
    } catch (error) {
      debugPrint(error.toString());
      Get.snackbar("Sign In Failed", "Try again");

      print(error);
    }
  }

  void logOut() async {
    try {
      await auth.signOut();
     
    } catch (error) {
       Get.snackbar(
        "Error signing out",
        "User Message",
        messageText:mainText(error.toString()),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error);
    }
  }
}


