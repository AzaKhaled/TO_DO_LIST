import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/model/todo_model.dart';
import 'package:to_do_list/services/database_service.dart';

import 'package:to_do_list/views/notes_iteams.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'package:to_do_list/widgets/add_buttom_sheet.dart';
import 'package:to_do_list/widgets/show_task_dialog.dart';

class ListNodesBody extends StatefulWidget {
  const ListNodesBody({super.key});

  @override
  State<ListNodesBody> createState() => _ListNodesBodyState();
}

class _ListNodesBodyState extends State<ListNodesBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Card(
          elevation: 4.0,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            width: MediaQuery.of(context).size.width * 0.9, // عرض مرن
            height: 380,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 20),
                  child: Row(
                    children: [
                      const Text(
                        'Daily Tasks',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: kPrimaryColor, width: 2.0),
                        ),
                        child: IconButton(
                          onPressed: () {
                            showTaskDialog(context);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: NotesIteams(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
