import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/cubit/notes_cubit.dart';
import 'package:to_do_list/models/note_model.dart';
import 'package:to_do_list/views/notes_iteams.dart';
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
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset:
            true, // التأكد من تجنب تغطية المحتوى بالكيبورد
        body: Card(
          elevation: 4.0, // تعيين الارتفاع لإضافة ظل
          shadowColor: Colors.grey, // لون الظل
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // شكل الحواف المستديرة
          ),
          child: Container(
            margin: EdgeInsets.only(left: 5),
            width: 380,
            height: 380, // تأكد من تحديد ارتفاع مناسب
            decoration: BoxDecoration(
              color: Colors.white, // تغيير لون الـ Container إلى الأبيض
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              // استخدمنا Column لعرض العناصر عموديًا
              crossAxisAlignment:
                  CrossAxisAlignment.start, // محاذاة العناصر لليسار
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18, left: 20), // إضافة Padding للنص
                  child: Row(
                    children: [
                      Text(
                        'Daily Tasks',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: kPrimaryColor, width: 2.0),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: () {
                              // عند الضغط على الأيقونة، نعرض الـ BottomSheet
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled:
                                    true, // يجعل الـ BottomSheet قابل للتمرير
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
                Expanded(
                  // استخدمنا Expanded لجعل ListView يتمدد بشكل صحيح
                  child: BlocBuilder<NotesCubit, NotesState>(
                    builder: (context, state) {
                      List<NoteModel> notes =
                          BlocProvider.of <NotesCubit>(context).notes ?? [];
                      return ListView.builder(
                        itemCount: notes.length, // عدد المهام
                        itemBuilder: (context, index) {
                          return NotesIteams(notes: notes[index]);

                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
