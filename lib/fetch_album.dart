import 'dart:convert';
import 'package:http/http.dart' as http;
import './Album.dart';

//http.Response class contains the data received from a successful http call
Future<Album> fetchAlbum() async{
  String url = 'https://jsonplaceholder.typicode.com/albums/1';
  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    //convert JSON map into an Album
    return Album.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load album');
  }
}