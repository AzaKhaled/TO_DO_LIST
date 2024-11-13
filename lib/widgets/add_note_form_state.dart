import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/add_note/add_note_cubit.dart';
import 'package:to_do_list/models/note_model.dart';
import 'package:to_do_list/widgets/add_buttom_sheet.dart';
import 'package:to_do_list/widgets/custom_buttom.dart';
import 'package:to_do_list/widgets/custom_text_filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? text;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 80),
          CustomTextFiled(
            onSaved: (value) {
              text = value;
            },
            hintText: 'Enter your task',
          ),
          SizedBox(height: 20),
          CustomButton(
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                var noteModel = NoteModel(text: text!);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
