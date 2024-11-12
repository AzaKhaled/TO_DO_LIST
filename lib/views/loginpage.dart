import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_do_list/hlper/show_snak_par.dart';
import 'package:to_do_list/views/list_notes.dart';
import 'package:to_do_list/views/registerpage.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formkey,
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
                          Text(
                            'Welcome back!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 25),
                          Image.asset('assets/pag2.PNG'),
                          SizedBox(height: 30),
                          CustomTextFiled(
                            hintText: 'Enter your email',
                            onChanged: (data) {
                              email = data;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomTextFiled(
                            hintText: 'Enter password',
                            onChanged: (data) {
                              password = data;
                            },
                          ),
                          SizedBox(height: 30),
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
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                await login();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListNotes()),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'invalid-credential') {
                                  showsnackbar(context, 'invalid Email or password');
                                } 
                                print(e.toString());
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
                          child: Text(
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
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerpage()),
                              );
                            },
                            child: Text(
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

  Future<void> login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
