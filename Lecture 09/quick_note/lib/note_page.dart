import 'package:flutter/material.dart';
import 'package:quick_note/note.dart';
import 'package:quick_note/view_note.dart';

class NotePage extends StatefulWidget {
  NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<Note> notesList = [];

  TextEditingController controller = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: imageController,
                decoration: InputDecoration(
                  labelText: 'Enter image url',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: controller,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Notes cannot be empty';
                  }
                },
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: notesList.length,
                itemBuilder: (_, i) {
                  return ListTile(
                    title: Text(
                      notesList[i].note,
                      maxLines: 3,
                    ),
                    subtitle: Text(notesList[i].imageUrl),
                    leading: Image.network(notesList[i].imageUrl),
                    trailing: Text(
                      notesList[i].date.toString().substring(0, 10),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ViewNotePage(
                            note: notesList[i],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (controller.text.isNotEmpty) {
              notesList.add(
                Note(
                  note: controller.text,
                  imageUrl: imageController.text,
                  date: DateTime.now(),
                ),
              );
            }
          });
          controller.clear();
          imageController.clear();
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
