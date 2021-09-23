import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ID Card"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61",
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              const Text(
                "Ikramul Hasan",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text("Application Developer"),
              TextButton(
                child: Text("ikramhasan.dev@gmail.com"),
                onPressed: () {
                  print("Button pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
