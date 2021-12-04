import 'package:flutter/material.dart';
import 'package:gg/services/api_service.dart';

class GiveawayPage extends StatelessWidget {
  const GiveawayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          getGiveaways();
        },
        child: Text('test'),
      ),
    );
  }
}
