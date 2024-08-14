import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<String> myNotes = [];
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              myNotes.clear();
              setState(() {});
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
          await _showDialog(context);
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: myNotes.length,
            itemBuilder: (c, i) => InkWell(
                  onTap: () async {
                    await _showDialog(
                      context,
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
                            color: Colors.red.withOpacity(.2),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(myNotes[i]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            myNotes.removeAt(i);
                            setState(() {});
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context,
      {bool isUpdate = false, int? index}) async {
    await showDialog(
      context: context,
      builder: (context) {
        if (isUpdate) {
          _textController.text = myNotes[index!];
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
                    myNotes[index!] = _textController.text;
                  } else {
                    myNotes.add(_textController.text);
                  }
                  _textController.text = "";

                  setState(() {});
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
