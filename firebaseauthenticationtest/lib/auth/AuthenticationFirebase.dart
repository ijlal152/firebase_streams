import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthenticationtest/home_screen.dart';
import 'package:firebaseauthenticationtest/login_screen.dart';
import 'package:firebaseauthenticationtest/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseGoogleAuthentication{

  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? googleUser;
  UserModel userModel = UserModel();
  
  void getData() async{
    googleUser = await GoogleSignIn().signIn();
    userModel.id = googleUser!.id;
    userModel.userEmail = googleUser!.email;
    userModel.userName = googleUser!.displayName;
    debugPrint("${userModel.id}");
    debugPrint("${userModel.userEmail}");
    debugPrint("${userModel.userName}");
  }

 Future<void> signOutFromGoogle(context) async{
    
    await googleSignIn.signOut();
    await auth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
  }



  static singInWithGoogle(context) async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // crete new credential for user
    try{
      final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
      );
      Navigator.push(context, MaterialPageRoute(builder: (conntext) => HomeScreen()));
      print(credentials);
      return await FirebaseAuth.instance.signInWithCredential(credentials);
      
    }catch(e){
      return e.toString();
    }
  }

  

}