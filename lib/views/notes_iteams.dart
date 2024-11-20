import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/model/todo_model.dart';
import 'package:to_do_list/services/database_service.dart';

import 'package:to_do_list/widgets/Constant.dart';

class NotesIteams extends StatefulWidget {
  const NotesIteams({super.key});

  @override
  State<NotesIteams> createState() => _NotesIteamsState();
}

class _NotesIteamsState extends State<NotesIteams> {
  bool _isChecked = false;
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
        if (snapshot.hasData) {
          List<Todo> todos = snapshot.data!;
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                Todo tode = todos[index];
                return Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Slidable(
                      key: ValueKey(tode.id),
                      // endActionPane:
                      //     ActionPane(motion: DrawerMotion(), children: [
                      //   SlidableAction(
                      //     backgroundColor: kPrimaryColor,
                      //     foregroundColor: Colors.white,
                      //     icon: Icons.done,
                      //     onPressed: (context) {
          
                      //     databaseService.updatestatustodo(tode.id, true);
                      //   }),
                      // ]),

                      
                      child: ListTile(
                        title: Text(
                          tode.title,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
