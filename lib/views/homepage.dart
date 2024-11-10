import 'package:flutter/material.dart';
import 'package:to_do_list/views/registerpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                top: 200,
                left: 20,
                right: 20,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Image.asset('assets/imgs/pag1.PNG'),
                    ),
                    SizedBox(height: 70),
                    Text(
                      'Get Things Done With TODO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Ut enim ad minima veniam,quis\n'
                        'nostrum exercitationem ullam\n'
                        'corporis suscipit laboriosam. Ut\n'
                        'enim ad minima veniam, quis',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registerpage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff2EA8A1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                     SizedBox(height: 50),
                  ],
                 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}