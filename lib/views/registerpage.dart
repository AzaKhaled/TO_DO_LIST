import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:to_do_list/hlper/show_snak_par.dart';
import 'package:to_do_list/views/list_notes.dart';
import 'package:to_do_list/views/loginpage.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';

class Registerpage extends StatefulWidget {
  Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? email;

  String? password;

  String? confirmPassword;

  String? name;

  bool isLoding = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
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
                      top: 150,
                      left: 20,
                      right: 20,
                      child: Column(
                        children: [
                          Text(
                            'Welcom onboard!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'lets help you meet up your tasks.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          CustomTextFiled(
                            hintText: 'enter your full name',
                            onChanged: (data) {
                              name = data;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomTextFiled(
                            onChanged: (data) {
                              email = data;
                            },
                            hintText: 'enter your email',
                          ),
                          SizedBox(height: 10),
                          CustomTextFiled(
                            onChanged: (data) {
                              password = data;
                            },
                            hintText: 'Enter password',
                          ),
                          SizedBox(height: 10),
                          CustomTextFiled(
                            onChanged: (data) {
                              confirmPassword = data;
                            },
                            hintText: 'Confirm password',
                            
                          ),
                          SizedBox(height: 20),
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
                            if (password != confirmPassword) {
                              showsnackbar(context, 'Passwords do not match');
                              return;
                            }

                            if (formkey.currentState!.validate()) {
                              isLoding = true;
                              setState(() {
                                
                              });
                              try {
                                await registeration();

                                // إذا تم إنشاء الحساب بنجاح، يتم الانتقال إلى الصفحة الجديدة
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListNotes()),
                                );
                              } on FirebaseAuthException catch (e) {
                                // التعامل مع الاستثناءات
                                if (e.code == 'weak-password') {
                                  showsnackbar(context, 'Weak Password');
                                } else if (e.code == 'email-already-in-use') {
                                  showsnackbar(context,
                                      'Email already in use, try another email!');
                                } else {
                                  showsnackbar(context, 'Success');
                                }
                              }
                              isLoding = false;
                              setState(() {
                                
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Register',
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
                            'Already Have An Account?',
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()),
                              );
                            },
                            child: Text(
                              '  Sign In',
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

  Future<void> registeration() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }

 
}
