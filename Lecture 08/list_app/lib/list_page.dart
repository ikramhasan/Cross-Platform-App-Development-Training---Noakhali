import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);

  List list = [
    'Ikram',
    'Riham',
    'Diba',
    'Zahid',
    'Riadul',
    'Sharmin',
    'Arefin',
    'Shahzan',
    'Nahin',
    'Rubel',
    'Tarifa',
    'Nusrat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        key: PageStorageKey('list'),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Container(
              child: Center(
                child: Text(list[index]),
              ),
              height: 50,
            ),
          );
        },
      ),
    );
  }
}
