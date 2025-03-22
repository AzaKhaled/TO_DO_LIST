import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:to_do_list/widgets/Constant.dart';

class AnalogClockDemo extends StatelessWidget {
  const AnalogClockDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(image: AssetImage('assets/dial01.webp')),
      // ),
      child: Center(
        child: Container(
          width:
              200, 
          height: 200, 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100), 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), 
                blurRadius: 10, 
                offset: const Offset(-5, 5), 
              ),
            ],
          ),
          child: ClipOval(
            child: AnalogClock(
              dateTime: DateTime.now(),
              isKeepTime: true,
              dialColor: Colors.white, 
              hourNumberColor: kPrimaryColor, 
              centerPointColor: kPrimaryColor, 
              markingColor:
                  Colors.white, 
              hourNumbers: const [
                '12', '', '', '3', '', '', '6', '', '', '9', '',
                '', // وضع الأرقام 12، 3، 6، 9 فقط
              ],
              hourHandColor: kPrimaryColor, 
              minuteHandColor: kPrimaryColor, 
              secondHandColor: const Color.fromARGB(
                  255, 191, 138, 138), 
              child: const Align(
                alignment: FractionalOffset(0.5, 0.75),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
