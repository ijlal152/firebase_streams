import 'package:coding_challenge_ariba/models/userModel.dart';
import 'package:coding_challenge_ariba/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }
}
 

class GoogleAuthFirebase {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;
  UserModel userModel = UserModel();

  // get data from firebase
  void getData() async {
    googleUser = await GoogleSignIn().signIn();
    userModel.id = googleUser!.id;
    userModel.email = googleUser!.email;
    userModel.password = googleUser!.displayName;
    debugPrint("${userModel.id}");
    debugPrint("${userModel.email}");
    debugPrint("${userModel.password}");
  }
  

  static singInWithGoogle(context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    try {
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (conntext) => HomeScreen()));
      print(credentials);
      return await FirebaseAuth.instance.signInWithCredential(credentials);
    } catch (e) {
      return e.toString();
    }
  }
}
