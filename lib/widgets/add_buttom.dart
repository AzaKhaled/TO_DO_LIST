import 'package:flutter/material.dart';

class AddButtom extends StatelessWidget {
  const AddButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
               return Container();
              });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        backgroundColor: const Color(0xff9CD8D2),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      //  body: const NotesViewBody(),
    );
  }
}
