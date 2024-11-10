import 'package:flutter/material.dart';

class ShowTaskButtomSheet extends StatelessWidget {
  const ShowTaskButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
return Scaffold(
      body: Container(
        color: Color(0xffFEF7F7),
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
                    color: Color(0xff9CD8D2).withOpacity(0.7),
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
                    color: Color(0xff9CD8D2).withOpacity(0.7),
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
          color: Color(0xffFEF7F7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            // يمكن استخدام SingleChildScrollView للسماح بالتمرير
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 80),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.4)
                    ),
                  ),
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
                      style: TextStyle(color: Color(0xff2EA8A1))),
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
 

  