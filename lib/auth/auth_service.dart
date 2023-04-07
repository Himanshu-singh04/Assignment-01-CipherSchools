import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/helper.dart';
import 'database_services.dart';

class auth_service {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future login_with_email_and_password(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {}
      return true;
    } on FirebaseAuthException catch (e) {
      e.message;
    }
  }

  Future register_user_with_email_and_password(
      String full_name, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {}
      await database_service(uid: user.uid).saving_user_data(full_name, email);
      return true;
    } on FirebaseAuthException catch (e) {
      e.message;
    }
  }

  Future sign_out() async {
    try {
      await Helper_functions.save_user_log_in_status(false);
      await Helper_functions.save_useremail("");
      await Helper_functions.save_username("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
