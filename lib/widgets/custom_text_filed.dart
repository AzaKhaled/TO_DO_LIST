import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/Constant.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.controller, 
    this.validator, 
  });

  final Function(String)? onChanged;
  final String? hintText;
  final void Function(String?)? onSaved;
  final TextEditingController?
      controller; 
  final String? Function(String?)? validator; 

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    bool isPasswordField = widget.hintText == 'Enter password' ||
        widget.hintText == 'Confirm password';

    return TextFormField(
      controller: widget.controller, 
      onSaved: widget.onSaved,
      validator: widget.validator, 
      obscureText: isPasswordField ? isObscure : false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black),
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
          borderSide: const BorderSide(color: kColortext, width: 3.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: kColortext),
        ),
      ),
    );
  }
}
