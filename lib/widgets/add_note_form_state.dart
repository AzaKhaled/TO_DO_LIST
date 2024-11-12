import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/add_buttom_sheet.dart';
import 'package:to_do_list/widgets/custom_buttom.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  String? text;
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 80),
          CustomTextFiled(
            onSaved: (value) {
              text = value;
            },
            hintText: 'Enter your task',
          ),
          SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () {
          //     String taskText = controller.text;
          //     if (taskText.isNotEmpty) {
          //       print("Task Added: $taskText");
          //       Navigator.pop(
          //           context); // إغلاق الـ BottomSheet بعد إضافة المهمة
          //     } else {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(content: Text('Please enter a task')),
          //       );
          //     }
          //   },
          //   child: Text('Add Task', style: TextStyle(color: kPrimaryColor)),
          // ),
          CustomButton(
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                Navigator.pop(context);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
