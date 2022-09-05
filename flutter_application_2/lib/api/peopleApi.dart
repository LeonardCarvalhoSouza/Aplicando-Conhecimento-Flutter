import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<People>> fetchPeople() async {
  final response = await http.get(Uri.parse('https://swapi.dev/api/people/'));
  Map<String, dynamic> map = json.decode(response.body);
  List jsonResponse = map["results"];
  return jsonResponse.map((data) => new People.fromJson(data)).toList();
}

class People {
  final String title;

  People({
    required this.title,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(title: json['name']);
  }
}
