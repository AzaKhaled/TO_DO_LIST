import 'package:flutter/material.dart';
import 'package:to_do_list/services/auth_service.dart';
import 'package:to_do_list/views/list_nodes_body.dart';
import 'package:to_do_list/views/loginpage.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/custom_analog_clock.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, 
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300, // يأخذ ثلث ارتفاع الشاشة
                width: double.infinity,
                color: const Color(0xff2EA8A1),
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
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/imgs/smile.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Welcome Olivia Grace',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: AnalogClockDemo(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Tasks List',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          const Expanded(
            child: ListNodesBody(),
          ), 
        ],
      ),
    );
  }
}
