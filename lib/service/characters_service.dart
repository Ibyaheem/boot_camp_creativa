import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/characters.dart';

class CharacterService {
  Future<List<Character>?> fetchCharacters() async {
    List<Character> list = <Character>[];
    var response = await http.get(
      Uri.parse("https://hp-api.onrender.com/api/characters"),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      list = json.map<Character>((item) => Character.fromjson(item)).toList();
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    } else {
      return null;
    }
  }
}
