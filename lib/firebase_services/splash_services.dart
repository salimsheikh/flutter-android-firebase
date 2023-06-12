import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/ui/auth/login_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    /*
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
*/
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen())),
    );
  }
}
