import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../note_hive_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void removeAllNotes() {
    NoteHiveHelper.removeAllNote();
    emit(NoteRemoveAllState());
  }

  void removeNote(int i) {
    NoteHiveHelper.removeNote(i);
    emit(NoteRemoveState());
  }

  void addNote(String text) {
    NoteHiveHelper.addNote(
      text,
    );
    emit(NoteAddState());
  }

  void updateNote({
    required int index,
    required String text,
  }) {
    NoteHiveHelper.updateNote(
      index: index,
      text: text,
    );
    emit(NoteUpdateState());
  }

  void getNotes() async {
    emit(NoteLoadingState());
    await Future.delayed(Duration(seconds: 4));
    try {
      throw Exception("Exception");
      NoteHiveHelper.getNotes();
      emit(NoteSuccessState());
    } catch (e) {
      emit(NoteErrorState(e.toString()));
    }
  }
}
