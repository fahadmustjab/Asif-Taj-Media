import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../../../../utils/utils.dart';

import 'package:tech_media/utils/routes/route_name.dart';

class ForgotPasswordController with ChangeNotifier {
  final collection = FirebaseFirestore.instance.collection("users");
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void recover(BuildContext context, String EmailText) async {
    setLoading(true);
    try {
      auth.sendPasswordResetEmail(email: EmailText).then((value) {
        setLoading(false);
        Navigator.pushNamed(context, RouteName.loginScreen);
        Utilities.toastMessage('Please Check your Email');
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
