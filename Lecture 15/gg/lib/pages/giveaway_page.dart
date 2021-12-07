import 'package:flutter/material.dart';
import 'package:gg/models/giveaway.dart';
import 'package:gg/services/api_service.dart';

class GiveawayPage extends StatelessWidget {
  const GiveawayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Giveaway>>(
        future: getGiveaways(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final giveaway = snapshot.data![index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF22252B),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Image.network(giveaway.image),
                      Text(giveaway.title),
                      Text(giveaway.description),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
