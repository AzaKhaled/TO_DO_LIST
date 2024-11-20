import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/firebase_options.dart';
import 'package:to_do_list/views/homepage.dart';
import 'package:to_do_list/views/list_notes.dart';
import 'package:to_do_list/views/loginpage.dart';
import 'package:to_do_list/views/registerpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final FirebaseAuth auth = FirebaseAuth.instance; // تعريف auth هنا
  runApp(ToDoList(auth: auth)); // تمرير auth إلى التطبيق
}

class ToDoList extends StatelessWidget {
  final FirebaseAuth auth;

  const ToDoList({required this.auth, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
