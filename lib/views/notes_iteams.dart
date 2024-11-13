import 'package:flutter/material.dart';
import 'package:to_do_list/models/note_model.dart';
import 'package:to_do_list/widgets/Constant.dart';

class NotesIteams extends StatefulWidget {
  final NoteModel notes;

  const NotesIteams({super.key, required this.notes});

  @override
  State<NotesIteams> createState() => _NotesIteamsState();
}

class _NotesIteamsState extends State<NotesIteams> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              focusColor: kColortext,
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            Text(
              widget.notes.text,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Color(0xff2EA8A1),
          ),
          onPressed: () {
            print('Delete icon pressed');
            // هنا يمكنك إضافة دالة لحذف العنصر من القائمة
          },
        ),
      ],
    );
  }
}
