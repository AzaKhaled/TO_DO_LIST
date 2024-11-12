import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/models/note_model.dart';
import 'package:to_do_list/widgets/Constant.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  bool isLoading = false;

  addNote(NoteModel text) async {
    emit(AddNoteLoading());
    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNoteSucces());
      await notesbox.add(text);
    } catch (e) {
      AddNoteFailure(e.toString());
    }
  }
}
