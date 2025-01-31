import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'dart:async';

import 'package:tech_media/view/login/login_screen.dart';
import 'package:tech_media/view/view_model/services/SessionManager.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      SessionController().userId = user.uid.toString();

      Timer(const Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.WelcomeScreen));
    } else {
      Timer(const Duration(seconds: 3),
          () => Navigator.pushNamed(context, RouteName.loginScreen));
    }
  }
}
