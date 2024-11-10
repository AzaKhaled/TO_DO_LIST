import 'package:flutter/material.dart';
import 'package:to_do_list/views/list_nodes_body.dart';
import 'package:to_do_list/widgets/custom_analog_clock.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // التأكد من أن الـ Scaffold يتفاعل مع الكيبورد
      body: Column(
        children: [
          Container(
            height: 300, // يأخذ ثلث ارتفاع الشاشة
            width: double.infinity,
            color: Color(0xff2EA8A1),
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
                        SizedBox(height: 10),
                        Text(
                          'Welcome Olivia Grace',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: AnalogClockDemo(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Tasks List',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Expanded(child: ListNodesBody()),  // تضمين ListNodesBody في الجزء المتبقي
        ],
      ),
    );
  }
}
