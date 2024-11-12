import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';

class ShowTaskButtomSheet extends StatelessWidget {
  const ShowTaskButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
return Scaffold(
      body: Container(
        color:kPrimarybacground,
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
                    color: kColortext.withOpacity(0.7),
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
                    color: kColortext.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: 20,
                right: 20,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Container(
        height: 300,
        decoration: BoxDecoration(
          color: kPrimarybacground,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            // يمكن استخدام SingleChildScrollView للسماح بالتمرير
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 80),
                CustomTextFiled(
                  hintText: 'Enter your task',
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String taskText = _controller.text;
                    if (taskText.isNotEmpty) {
                      print("Task Added: $taskText");
                      Navigator.pop(
                          context); // إغلاق الـ BottomSheet بعد إضافة المهمة
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a task')),
                      );
                    }
                  },
                  child: Text('Add Task',
                      style: TextStyle(color: kPrimaryColor)),

                ),
              ],
            ),
          ),
        ),
      ),
    
                  ]),
              ),
             ],
          ),
        ),
      ),
    );
  
 }
}
 

  