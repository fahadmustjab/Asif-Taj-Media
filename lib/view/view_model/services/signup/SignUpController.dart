import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../../../../utils/utils.dart';

class SignUpController with ChangeNotifier {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signup(String userName, String EmailText, String PasswordText) async {
    setLoading(true);
    try {
      auth
          .createUserWithEmailAndPassword(
              email: EmailText, password: PasswordText)
          .then((value) {
        print('hello');

        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'UserName': userName,
          'Email': value.user!.email.toString(),
          'Online': 'No',
          'Phone': '',
          'Profile': '',
        }).then((value) {
          setLoading(false);
          print('hellow2');
        }).onError((error, stackTrace) {
          setLoading(false);
          Utilities.toastMessage(error.toString());
        });
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
