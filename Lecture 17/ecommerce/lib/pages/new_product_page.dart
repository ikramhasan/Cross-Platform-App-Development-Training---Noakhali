import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewProductPage extends StatelessWidget {
  NewProductPage({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a title',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a description',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: imageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter an image url',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a price',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isNotEmpty &&
              priceController.text.isNotEmpty &&
              imageController.text.isNotEmpty) {
            // Add product here
            FirebaseFirestore.instance.collection('products').add({
              'title': titleController.text,
              'description': descriptionController.text,
              'imageUrl': imageController.text,
              'price': priceController.text,
            });
            Navigator.of(context).pop();
          } else {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Cannot add an empty product'),
              ),
            );
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
