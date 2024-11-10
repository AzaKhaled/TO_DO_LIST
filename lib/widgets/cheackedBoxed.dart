import 'package:flutter/material.dart';

class Cheackedboxed extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Cheackedboxed> {
  bool _isChecked = false; // متغير لتخزين حالة الـ Checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: CheckboxListTile(
         // title: Text('هل أنت موافق؟'),
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
      ),
    );
  }
}
