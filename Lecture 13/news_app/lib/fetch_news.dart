import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api_response.dart';
import 'package:url_launcher/url_launcher.dart';

Future<ApiResponse> fetchNews(String query) async {
  var url = Uri.parse(
      'https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=d016eb1fbb034eecafd5e7254d870e30');
  var response = await http.get(url);

  var data = jsonDecode(response.body);
  return ApiResponse.fromJson(data);
}

sendMail() {
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
