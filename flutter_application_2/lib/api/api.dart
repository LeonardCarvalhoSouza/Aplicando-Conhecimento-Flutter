import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://swapi.dev/api/films/'));
  Map<String, dynamic> map = json.decode(response.body);
  List jsonResponse = map["results"];
  return jsonResponse.map((data) => new Album.fromJson(data)).toList();
}

class Album {
  final String title;
  final int id;

  Album({
    required this.title,
    required this.id,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(title: json['title'], id: json['episode_id']);
  }
}
