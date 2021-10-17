import 'package:flutter/material.dart';
import 'package:quick_note/note.dart';

class ViewNotePage extends StatelessWidget {
  ViewNotePage({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Note'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                note.imageUrl,
                height: 450,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(note.date.toString().substring(0, 10)),
              SizedBox(height: 16),
              Text(
                note.note,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
