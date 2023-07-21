import 'package:flutter/material.dart';

import 'auth/AuthenticationFirebase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final firebaseServices = FirebaseGoogleAuthentication();
  //GoogleSignInAccount? googleUser;

  // myData() async{
  //   googleUser = await GoogleSignIn().signIn();
  //   print(googleUser!.displayName);
  // }

  @override
  void initState() {
    firebaseServices.getData();
    //myData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ClipOval(child: Image.network(googleUser!.photoUrl!)),
              //Text(googleUser!.email),
              //Text(googleUser!.displayName!),
              

              const SizedBox(height: 30,),

               ElevatedButton(
                onPressed: (){
                  firebaseServices.signOutFromGoogle(context);
                }, 
                child: const Text('SignOut')
              ),
            ],
          ),
        ),
      ),
    );
  }
}