import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/views/auth_views/login_screen.dart';
import 'package:luana_chat_app/views/auth_views/signup_screen.dart';
import 'package:luana_chat_app/views/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _authController = Get.put(AuthController());
  void loginAsGuest() {
    setState(() {
      _authController.isLoading = true;
    });
    _authController.signInGuest();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Container(
              child: Scaffold(
                backgroundColor: Colors.black,
                body: _authController.isLoading ? const Center(child: CircularProgressIndicator()) : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/png.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          _socialMediaButton(
                              'Log in with Facebook',
                              Colors.blue.shade800,
                              'assets/images/facebook.png',
                              _fbCallBack),
                          _socialMediaButton(
                              'Log in with Google',
                              Colors.purple,
                              'assets/images/google.png',
                              _googleCallBack),
                          _socialMediaButton(
                              'Log in with Email',
                              Colors.pinkAccent,
                              'assets/images/phone.png',
                              _emailCallBack),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        _signUp(),
                        _guestLogin(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget _socialMediaButton(
    String text,
    Color color,
    String imageUri,
    VoidCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(7),
        height: 35,
        width: 50,
        child: Image.asset(
          imageUri,
          fit: BoxFit.contain,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: Colors.white,
        ),
      ),
      title: Transform.translate(
        offset: const Offset(-15, 0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: color,
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 17),
          )),
        ),
      ),
    );
  }

  Widget _signUp() {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
            onSurface: Colors.grey,
          ),
          onPressed: () {
            Get.to(() => SignupScreen());
          },
          child: const Text('Sign Up'),
        ),
      ),
    );
  }

  Widget _guestLogin() {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.transparent,
            onSurface: Colors.grey,
          ),
          onPressed: () => loginAsGuest(),
          child: const Text('Guest Login'),
        ),
      ),
    );
  }

  _fbCallBack() {
    setState(() {
      _authController.isLoading = true;
    });

    _authController.loginWithFacebook();
  }

  _googleCallBack() {
    setState(() {
      _authController.isLoading = true;
    });
    _authController.loginWithGoogle();
    setState(() {

    });
  }

  _emailCallBack() {
    Get.to(() => LoginScreen());
  }
}
