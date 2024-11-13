import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/models/note_model.dart';
import '../../widgets/Constant.dart';

part 'notes_state.dart';
class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() async {
    var notesbox = Hive.box<NoteModel>(kNotesBox);
    notes = notesbox.values.toList();
    emit(NotesLoaded(notes!));
  }

  addNote(NoteModel newNote) async {
    var notesbox = Hive.box<NoteModel>(kNotesBox);
    await notesbox.add(newNote);
    fetchAllNotes(); // إعادة تحميل الملاحظات بعد الإضافة
  }
}
