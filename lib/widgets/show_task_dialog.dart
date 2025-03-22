import 'package:flutter/material.dart';
import 'package:to_do_list/model/todo_model.dart';
import 'package:to_do_list/services/database_service.dart';
import 'package:to_do_list/widgets/Constant.dart';

void showTaskDialog(BuildContext context, {Todo? todo}) {
  final TextEditingController titleController =
      TextEditingController(text: todo?.title);
  final DatabaseService databaseService = DatabaseService();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            todo == null ? "Add Task" : "Edit Task",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                if (todo == null) {
                  await databaseService.addTodoItem(titleController.text);
                } else {
                  await databaseService.updatetodo(
                      todo.id, titleController.text);
                }
                Navigator.pop(context);
              },
              child: Text(todo == null ? "Add" : "Update"),
            ),
          ],
        );
      });
}
