import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/model/todo_model.dart';
import 'package:to_do_list/services/database_service.dart';
import 'package:to_do_list/widgets/Constant.dart';

class NotesIteams extends StatefulWidget {
  const NotesIteams({super.key});

  @override
  State<NotesIteams> createState() => _NotesIteamsState();
}

class _NotesIteamsState extends State<NotesIteams> {
  User? user = FirebaseAuth.instance.currentUser;
  late String uid;
  final DatabaseService databaseService = DatabaseService();

  @override
  void initState() {
    uid = FirebaseAuth.instance.currentUser!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: databaseService.todos,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(" error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text(" NOT Found"));
        }

        List<Todo> todos = snapshot.data!;

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            Todo todo = todos[index];

            return Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: ListTile(
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (bool? value) {
                    // نعدل حالة المهمة فقط بدون حذف
                    setState(() {
                      databaseService.updatestatustodo(todo.id, value ?? false);
                      print("update   : ${todo.title} to ${value}");
                    });
                  },
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: kPrimaryColor),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(" Delete Task"),
                        content: Text(" Are you sure to delet: ${todo.title}؟"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancle"),
                          ),
                          TextButton(
                            onPressed: () {
                              databaseService.delettodotask(todo.id);
                              Navigator.pop(context);
                              print("Delete taske done: ${todo.title}");
                            },
                            child: Text("Delete"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
