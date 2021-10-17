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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State'),
      ),
      body: Center(
        child: Text(
          "$number",
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Stack(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                number = number + 1;
              });
            },
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              setState(() {
                number = number - 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
