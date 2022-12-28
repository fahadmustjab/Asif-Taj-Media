import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:tech_media/view/view_model/services/SessionManager.dart';

import '../../../../utils/utils.dart';

import 'package:tech_media/utils/routes/route_name.dart';

class SignUpController with ChangeNotifier {
  // final collection = FirebaseFirestore.instance.collection("users");
  FirebaseAuth auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('User');

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signup(BuildContext context, String userName, String EmailText,
      String PasswordText) async {
    setLoading(true);
    try {
      auth
          .createUserWithEmailAndPassword(
              email: EmailText, password: PasswordText)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'UserName': userName,
          'Email': value.user!.email.toString(),
          'Online': 'No',
          'Phone': '',
          'Profile': '',
        }).then((value) {
          Utilities.toastMessage("User Created");
          setLoading(false);
          Navigator.pushNamed(context, RouteName.WelcomeScreen);
        }).onError(
          (error, stackTrace) {
            setLoading(false);
            Utilities.toastMessage(error.toString());
          },
        );

        // collection.doc(value.user!.uid.toString()).set({
        //   'uid': value.user!.uid.toString(),
        //   'UserName': userName,
        //   'Email': value.user!.email.toString(),
        //   'Online': 'No',
        //   'Phone': '',
        //   'Profile': '',
        // }).then((value) {
        //   Utilities.toastMessage("User Created");
        //   setLoading(false);
        //   Navigator.pushNamed(context, RouteName.WelcomeScreen);
        // }).onError((error, stackTrace) {
        //   setLoading(false);
        //   Utilities.toastMessage(error.toString());
        // });
        setLoading(false);

        // Utilities.toastMessage("User Created");
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
