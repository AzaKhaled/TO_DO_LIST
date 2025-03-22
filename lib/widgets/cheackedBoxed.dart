import 'package:flutter/material.dart';

class Cheackedboxed extends StatefulWidget {
  const Cheackedboxed({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Cheackedboxed> {
  bool _isChecked = false; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CheckboxListTile(
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
