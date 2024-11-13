import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/models/note_model.dart';
import 'package:to_do_list/widgets/Constant.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  // دالة لإضافة ملاحظة جديدة
  Future<void> addNote(NoteModel text) async {
    emit(AddNoteLoading()); // حالة التحميل أثناء إضافة الملاحظة
    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);

      await notesbox.add(text); // إضافة الملاحظة إلى Hive

      // بعد إضافة الملاحظة بنجاح، نقوم بإرسال الحالة المحدثة
      emit(AddNoteSucces());
    } catch (e) {
      emit(AddNoteFailure(e.toString())); // حالة فشل إذا حدث خطأ
    }
  }
}
