import 'dart:convert';

import 'package:http/http.dart' as http;

Future getGiveaways() async {
  var url = Uri.parse('https://www.gamerpower.com/api/giveaways');

  var result = await http.get(url);
  var data = jsonDecode(result.body);
}
