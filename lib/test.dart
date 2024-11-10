import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/imgs/smile.png',
        width: 100, // عرض الصورة داخل الدائرة
        height: 100, // ارتفاع الصورة داخل الدائرة
        fit: BoxFit.cover, // لتغطية المساحة كاملة داخل الدائرة
      ),
    );
  }
}
