import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:to_do_list/widgets/Constant.dart';

class AnalogClockDemo extends StatelessWidget {
  const AnalogClockDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/dial01.webp')),
      ),
      child: Center( // استخدام Center لوضع الساعة في منتصف الشاشة
        child: Container(
          width: 200, // تحديد العرض الكبير للـ Container (أكبر بـ 2 سم من حجم الساعة)
          height: 200, // تحديد الارتفاع الكبير للـ Container
          decoration: BoxDecoration(
            color: Colors.white, // لون الخلفية للكارد
            borderRadius: BorderRadius.circular(100), // لتحديد الزوايا الدائرية
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // لون الظل
                blurRadius: 10, // مدى ضبابية الظل
                offset: Offset(-5, 5), // الظل في أسفل يسار فقط
              ),
            ],
          ),
          child: ClipOval(
            child: AnalogClock(
              dateTime: DateTime.now(),
              isKeepTime: true,
              dialColor: Colors.white, // تغيير لون قرص الساعة
              hourNumberColor: kPrimaryColor, // تغيير لون الأرقام
              centerPointColor: kPrimaryColor, // تغيير لون النقطة في المركز
              markingColor: Colors.white, // تغيير لون النقاط الصغيرة إلى اللون الأبيض
              hourNumbers: [
                '12', '', '', '3', '', '', '6', '', '', '9', '', '', // وضع الأرقام 12، 3، 6، 9 فقط
              ],
              hourHandColor: kPrimaryColor, // تغيير لون عقرب الساعة
              minuteHandColor: kPrimaryColor, // تغيير لون عقرب الدقائق
              secondHandColor:  Color.fromARGB(255, 191, 138, 138), // تغيير لون عقرب الثواني
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
