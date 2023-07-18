import 'package:coding_challenge_ariba/custom_text.dart';
import 'package:coding_challenge_ariba/widgets/button.dart';
import 'package:coding_challenge_ariba/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../repo/repo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/login/logo.png'),
                ),
                SizedBox(height: 18.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'NewLeaf',
                            style: TextStyle(
                              color: const Color(0xFF333333),
                              fontSize: 34.sp,
                              fontFamily: 'Philosopher',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              fontSize: 34.sp,
                              fontFamily: 'Philosopher',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'Mart',
                            style: TextStyle(
                              color: const Color(0xFFFC6F20),
                              fontSize: 34.sp,
                              fontFamily: 'Philosopher',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height - 226,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10).w,
                        topRight: const Radius.circular(10).w,
                      ),
                    ),
                  ),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          LabelWidget(
                            title: 'Login',
                            textColor: const Color(0xFF292929),
                            fontSize: 26.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Form(
                            key: _formKey,
                              child: Column(
                            children: [
                              CustomTextFormField(
                                controller: emailController,
                                hintText: 'Email',
                                labelText: 'Email',
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextFormField(
                                controller: passController,
                                hintText: 'Password',
                                labelText: 'Password',
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  LabelWidget(
                                    title: 'Forgot Password?',
                                    textColor: const Color(0xFF333333),
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              ButtonWidget(
                                buttontitle: 'Login',
                                ontap: () async {
                                  // if (emailController.text.isEmpty ||
                                  //     passController.text.isEmpty) {
                                  //   debugPrint("Please enter credentials");
                                  // } else {
                                  //   await _auth
                                  //       .signInWithEmailAndPassword(
                                  //           email: emailController.text,
                                  //           password: passController.text)
                                  //       .then((userData) {
                                  //     debugPrint('Successfully Login');
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 const HomeScreen()));
                                  //   });
                                  // }
                                },
                              ),
                            ],
                          )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: [
                              LabelWidget(
                                title: 'Don’t have any Account?',
                                textColor: const Color(0xFF333333),
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SignIn(
                            btnTitle: 'SignUp with Google ',
                            img: 'assets/images/login/google.png',
                            ontap: () async {
                              GoogleAuthFirebase.singInWithGoogle(context);
                              // await _auth.createUserWithEmailAndPassword(
                              //    email: emailController.text,

                              //    password: passController.text
                              //    );
                            },
                          ), 
                          
                          
                          SizedBox(
                            height: 20.h,
                          ),
                          SignIn(
                            btnTitle: 'SignUp with Apple ',
                            img: 'assets/images/login/apple.png',
                            ontap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  final String img;
  final String btnTitle;
  final VoidCallback ontap;
  const SignIn({
    super.key,
    required this.img,
    required this.btnTitle,
    required this.ontap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 335.w,
        height: 46.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50.w,
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
            borderRadius: BorderRadius.circular(12).w,
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(img),
            ),
            10.horizontalSpace,
            Text(
              btnTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 16.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
