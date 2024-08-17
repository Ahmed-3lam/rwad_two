import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rwad_two/dummy_projects/note/cubit/note_cubit.dart';
import 'package:rwad_two/dummy_projects/note/note_hive_helper.dart';

class NoteScreen extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    return BlocListener<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is NoteSuccessState) {
          Get.snackbar(
            "Success",
            "Data is fetched Succeffuly",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
        if (state is NoteErrorState) {
          Get.snackbar("Error", state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Note App",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                cubit.removeAllNotes();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Clear All",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _showDialog(context, cubit);
          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              if (state is NoteLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NoteErrorState) {
                return Center(
                  child: Text(
                    "Error",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: NoteHiveHelper.myNotes.length,
                  itemBuilder: (c, i) => InkWell(
                        onTap: () async {
                          await _showDialog(
                            context,
                            cubit,
                            index: i,
                            isUpdate: true,
                          );
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: i == 0
                                      ? Colors.red.withOpacity(.2)
                                      : i % 2 == 0
                                          ? Colors.green.withOpacity(.2)
                                          : Colors.yellow.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(NoteHiveHelper.myNotes[i]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  cubit.removeNote(i);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, NoteCubit cubit,
      {bool isUpdate = false, int? index}) async {
    await showDialog(
      context: context,
      builder: (context) {
        if (isUpdate) {
          _textController.text = NoteHiveHelper.myNotes[index!];
        }
        return AlertDialog(
          title: const Text('Add a new Note'),
          content: TextField(
            controller: _textController,
            autofocus: true,
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(isUpdate ? 'Update' : "Add"),
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  if (isUpdate) {
                    cubit.updateNote(index: index!, text: _textController.text);
                  } else {
                    cubit.addNote(_textController.text);
                  }
                  _textController.text = "";

                  Navigator.pop(
                    context,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

/// (1) add note
/// (2) remove note
/// (3) remove all notes
/// (4) Update note
/// (5) get notes
