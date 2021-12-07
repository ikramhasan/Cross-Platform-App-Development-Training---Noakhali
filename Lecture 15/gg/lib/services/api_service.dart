import 'dart:convert';

import 'package:gg/models/giveaway.dart';
import 'package:http/http.dart' as http;

Future<List<Giveaway>> getGiveaways() async {
  var url = Uri.parse('https://www.gamerpower.com/api/giveaways');

  var result = await http.get(url);
  List<Map<String, dynamic>> data = jsonDecode(result.body);

  return data.map((item) => Giveaway.fromJson(item)).toList();
}
