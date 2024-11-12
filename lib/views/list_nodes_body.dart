import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/add_buttom_sheet.dart'; // تأكد من استيراد الملف بشكل صحيح

class ListNodesBody extends StatefulWidget {
  const ListNodesBody({super.key});

  @override
  State<ListNodesBody> createState() => _ListNodesBodyState();
}

class _ListNodesBodyState extends State<ListNodesBody> {
  bool _isChecked = false; // متغير لتخزين حالة الـ Checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // التأكد من تجنب تغطية المحتوى بالكيبورد
      body: Card(
        elevation: 4.0, // تعيين الارتفاع لإضافة ظل
        shadowColor: Colors.grey, // لون الظل
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // شكل الحواف المستديرة
        ),
        child: Container(
          margin: EdgeInsets.only(left: 5),
          width: 380,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white, // تغيير لون الـ Container إلى الأبيض
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column( // استخدمنا Column لعرض العناصر عموديًا
            crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر لليسار
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 20), // إضافة Padding للنص
                child: Row(
                  children: [
                    Text(
                      'Daily Tasks',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: kPrimaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {
                            // عند الضغط على الأيقونة، نعرض الـ BottomSheet
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, // يجعل الـ BottomSheet قابل للتمرير
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: ShowTaskButtomSheet(),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Task 31',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
