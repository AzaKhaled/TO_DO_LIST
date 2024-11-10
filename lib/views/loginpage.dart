import 'package:flutter/material.dart';
import 'package:to_do_list/views/list_notes.dart';
import 'package:to_do_list/views/registerpage.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';
class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFEF7F7),
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
                    color: Color(0xff9CD8D2).withOpacity(0.7),
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
                    color: Color(0xff9CD8D2).withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 20,
                right: 20,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'welcome  back!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                  Image.asset('assets/pag2.PNG'),
                  SizedBox(height: 50,),
                    CustomTextFiled(),
                    SizedBox(height: 20),
                    
                    CustomTextFiled(),
                    SizedBox(height: 50),
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
                    onPressed: () {
                       Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ListNotes()));
                      print("الزر تم الضغط عليه");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2EA8A1),
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
                      'Already Have An Account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registerpage()));
                      },
                      child: Text(
                        '  Sign Up',
                        style: TextStyle(color: Color(0xff2EA8A1)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  
  }
}