import 'package:flutter/material.dart';
import 'package:remaining_tasks/another_page.dart';
import 'package:remaining_tasks/new_page.dart';

class TabPage extends StatefulWidget {
  TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int index = 0;

  final pages = [
    NewPage(),
    AnotherPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remaining Tasks'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text('This is a drawer header'),
              ),
            ),
            Text('Drawer'),
          ],
        ),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'New Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Another Page',
          ),
        ],
      ),
    );
  }
}
