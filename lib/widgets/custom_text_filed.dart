import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/Constant.dart';

class CustomTextFiled extends StatefulWidget {
  CustomTextFiled({this.hintText, this.onChanged});
  
  final Function(String)? onChanged;
  final String? hintText;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isObscure = true; // القيمة الأولية للحقل تكون مخفية

  @override
  Widget build(BuildContext context) {
    bool isPasswordField = widget.hintText == 'Enter password' || widget.hintText == 'Confirm password';

    return TextFormField(
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Field is required';
        }
        return null; // إرجاع null يعني أنه لا يوجد خطأ في التحقق
      },
      obscureText: isPasswordField ? isObscure : false, // التأكد من منطق الإخفاء الصحيح
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black),
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure; // عكس القيمة لتبديل حالة الإخفاء
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: kColortext, width: 3.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: kColortext),
        ),
      ),
    );
  }
}
