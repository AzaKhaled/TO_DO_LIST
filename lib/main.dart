import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list/cubit/add_note/add_note_cubit.dart';
import 'package:to_do_list/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list/models/note_model.dart';
import 'package:to_do_list/simple_bloc_obsevier.dart';
import 'package:to_do_list/views/homepage.dart';
import 'package:to_do_list/views/list_notes.dart';
import 'package:to_do_list/views/loginpage.dart';
import 'package:to_do_list/views/registerpage.dart';
import 'package:to_do_list/widgets/Constant.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObsevier();
  await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
