import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/view/view_model/services/SessionManager.dart';

import '../../../../utils/utils.dart';

import 'package:tech_media/utils/routes/route_name.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(
      BuildContext context, String EmailText, String PasswordText) async {
    setLoading(true);
    try {
      auth
          .signInWithEmailAndPassword(email: EmailText, password: PasswordText)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        // print(SessionController().userId);
        setLoading(false);
        Navigator.pushNamed(context, RouteName.WelcomeScreen);

        Utilities.toastMessage("Logged in");
      }).onError((error, stackTrace) {
        setLoading(false);

        Utilities.toastMessage(error.toString());
      });
    } catch (e) {
      Utilities.toastMessage(e.toString());
      setLoading(false);
    }
  }
}
