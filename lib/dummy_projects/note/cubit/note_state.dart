part of 'note_cubit.dart';

@immutable
class NoteState {}

class NoteInitial extends NoteState {}

class NoteAddState extends NoteState {}

class NoteRemoveState extends NoteState {}

class NoteRemoveAllState extends NoteState {}

class NoteUpdateState extends NoteState {}

class NoteLoadingState extends NoteState {}

class NoteSuccessState extends NoteState {}

class NoteErrorState extends NoteState {
  final String error;
  NoteErrorState(this.error);
}
