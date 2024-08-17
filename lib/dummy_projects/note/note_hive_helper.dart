import 'package:hive/hive.dart';

class NoteHiveHelper {
  static const String noteBox = "NOTE_BOX";
  static List<String> myNotes = [];

  static void addNote(String text) {
    myNotes.add(text);
    Hive.box(noteBox).put(noteBox, myNotes);
  }

  static void getNotes() {
    myNotes = Hive.box(noteBox).get(noteBox);
  }

  static void removeNote(int index) {
    myNotes.removeAt(index);
    Hive.box(noteBox).put(noteBox, myNotes);
  }

  static void removeAllNote() {
    myNotes.clear();
    Hive.box(noteBox).put(noteBox, myNotes);
  }

  static void updateNote({
    required int index,
    required String text,
  }) {
    myNotes[index] = text;
    Hive.box(noteBox).put(noteBox, myNotes);
  }

  /// (1) add
  /// (2) remove
  /// (3) remove all
  /// (4) Update
  /// (5) get
}
