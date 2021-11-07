import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<Map<String, dynamic>> getGameGiveaways(String query) async {
  var response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=$query&apiKey=d016eb1fbb034eecafd5e7254d870e30'));

  return jsonDecode(response.body);
}

sendEmail() {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'ikramhasan.dev@gmail.com',
    query: encodeQueryParameters(
        <String, String>{'subject': 'Example Subject & Symbols are allowed!'}),
  );

  launch(emailLaunchUri.toString());
}
