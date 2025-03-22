import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_do_list/hlper/show_snak_par.dart';
import 'package:to_do_list/services/auth_service.dart';
import 'package:to_do_list/views/list_notes.dart';
import 'package:to_do_list/views/registerpage.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? email;
  String? password;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthService auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: kPrimarybacground,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      left: -50,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          color: kColortext.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -100,
                      left: 50,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          color: kColortext.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      left: 20,
                      right: 20,
                      child: Column(
                        children: [
                          const Text(
                            'Welcome back!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Image.asset('assets/pag2.PNG'),
                          const SizedBox(height: 30),
                          CustomTextFiled(
                            controller: emailController,
                            hintText: 'Enter your email',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextFiled(
                            controller: passwordController,
                            hintText: 'Enter password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 5,
                      left: 5,
                      child: Container(
                        height: 60,
                        width: 400,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              try {
                                User? user =
                                    await auth.loginwithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text,
                                );
                                if (user != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ListNotes(),
                                    ),
                                  );
                                }
                              } on FirebaseAuthException catch (e) {
                                String errorMessage = 'An error occurred.';

                                if (e.code == 'user-not-found') {
                                  errorMessage =
                                      'No user found with this email.';
                                } else if (e.code == 'wrong-password') {
                                  errorMessage =
                                      'Incorrect password. Please try again.';
                                } else if (e.code == 'invalid-email') {
                                  errorMessage = 'Invalid email format.';
                                } else if (e.code == 'user-disabled') {
                                  errorMessage =
                                      'This user account has been disabled.';
                                }

                                // إظهار رسالة الخطأ باستخدام Snackbar
                                showsnackbar(context, errorMessage);
                              } catch (e) {
                                // التعامل مع الأخطاء العامة
                                showsnackbar(context,
                                    'Something went wrong. Please try again.');
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Registerpage(),
                                ),
                              );
                            },
                            child: const Text(
                              ' Sign Up',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
