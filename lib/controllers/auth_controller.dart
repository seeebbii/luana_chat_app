import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luana_chat_app/models/user_model.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var loggedInUser = UserModel().obs;
  bool isLoading = false;
  Object? onlineUser = null.obs;

  final googleSignIn = GoogleSignIn();
  final facebookLogin = FacebookLogin();

  @override
  void onInit() {
    // auth change stream
    currentUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  // guest login

  void signInGuest() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      isLoading = false;
    } catch (e) {
      Get.snackbar("Error Signing in", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //  CREATE USER WITH EMAIL AND PASSOWRD
  void createUser(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: '',
        email: email.trim(),
      );
      loggedInUser.value = _user;
      if (await Database().createUserInDatabase(_user)) {
        loggedInUser.value = _user;
        isLoading = false;
        Get.back();
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error Creating Account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Login with email and password
  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: '',
        email: email.trim(),
      );
      // LOAD USER INFO FROM FIRE STORE COLLECTION
      loggedInUser.value = await Database().getUser(_authResult.user!.uid);
      isLoading = false;
      Get.back();
    } catch (e) {
      Get.snackbar("Error Signing in", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // create a user with google/facebook credentials

  Future createUserWithSocial() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      bool isNew = await Database().isNewUser(_auth.currentUser);
      UserModel _user = UserModel(
          id: _auth.currentUser!.uid,
          name: _auth.currentUser!.displayName,
          email: _auth.currentUser!.email,
          imageUrl: _auth.currentUser!.photoURL,
          age: '',
          gender: '',
          height: '',
          status: 'Online');
      if (!isNew) {
        if (await Database().createUserInDatabase(_user)) {
          loggedInUser.value = _user;
        } else {
          Database().getUser(_auth.currentUser!.uid).then((value) {
            loggedInUser.value = value;
          });
        }
      }
    });
  }

  // GOOGLE LOGIN

  void loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _auth.signInWithCredential(credential).then((value) {
        createUserWithSocial();
      });
      isLoading = false;
    } catch (e) {
      Get.snackbar("Error login Account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);

      rethrow;
    }
  }

  // sign in with facebook

  void loginWithFacebook() async {
    final fbUser = await facebookLogin.logIn(['email']);
    switch (fbUser.status) {
      case FacebookLoginStatus.cancelledByUser:
        isLoading = false;
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          final FacebookAccessToken fbToken = fbUser.accessToken;
          final AuthCredential credential =
              FacebookAuthProvider.credential(fbToken.token);

          _auth.signInWithCredential(credential).then((value) {
            createUserWithSocial();
          });
          isLoading = false;
        } catch (e) {
          Get.snackbar("Error login Account", e.toString(),
              snackPosition: SnackPosition.BOTTOM);
        }
    }
  }

  // log out

  void logOut() async {
    try {
      await _firestore
          .collection('users')
          .doc(currentUser.value?.uid)
          .update({
        'status': 'Offline',
      });
      await googleSignIn.signOut();
      await facebookLogin.logOut();
      await _auth.signOut();
      Get.back();
    } catch (e) {
      Get.snackbar("Error Signing Out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
