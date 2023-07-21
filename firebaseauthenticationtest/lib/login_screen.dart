import 'package:firebaseauthenticationtest/auth/AuthenticationFirebase.dart';
import 'package:firebaseauthenticationtest/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          children: [
            Form(
              key: _formKey,
                child: Column(
              children: [
                CustomTextFormField(
                    hintText: 'ijlalhussain152@gmail.com',
                    labelText: 'Email',
                    controller: emailCtrl),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    hintText: '********',
                    labelText: 'Password',
                    controller: passCtrl),

                const SizedBox(height: 50,),

                ElevatedButton(onPressed: (){}, child: const Text('Login')),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    FirebaseGoogleAuthentication.singInWithGoogle(context);
                  }, 
                  child: const Text('Sign In with google')
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
