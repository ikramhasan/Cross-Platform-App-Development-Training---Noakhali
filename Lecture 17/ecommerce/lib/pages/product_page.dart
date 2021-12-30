import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          FirebaseFirestore.instance.collection('products').doc(id).delete();
        },
      ),
    );
  }
}
