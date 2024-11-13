import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/Constant.dart';

class CustomTextFiled extends StatefulWidget {
  CustomTextFiled({this.hintText, this.onChanged, this.onSaved});
  
  final Function(String)? onChanged;
  final String? hintText;
  final void Function(String?)? onSaved; // تعديل صغير هنا لجعلها نهائية

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    bool isPasswordField = widget.hintText == 'Enter password' || widget.hintText == 'Confirm password';

    return TextFormField(
      onSaved: widget.onSaved, // تأكد من تمرير widget.onSaved هنا
      validator: (data) {
        if (data?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
      obscureText: isPasswordField ? isObscure : false,
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
                    isObscure = !isObscure;
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
