import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthenticationtest/home_screen.dart';
import 'package:firebaseauthenticationtest/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


User? firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if(firebaseUser != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
    });
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.green,);
  }
}