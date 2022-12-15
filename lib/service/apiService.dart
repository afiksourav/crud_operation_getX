import 'dart:convert';


import 'package:data_facthing_getx/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiService{
 // static var client = http.Client();
  Future<List<AlbumModel>> fatchPost()async{
    final  response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    if(response.statusCode==200){
      final parsed = json.decode(response.body).cast<Map<String,dynamic>>();
      return parsed.map<AlbumModel>((json)=>AlbumModel.fromJson(json)).toList();
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<AlbumModel> PostAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
  print("post data");
  print(response.statusCode);
    if(response.statusCode==201){
      return AlbumModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to update post");
    }
  }

   Future<AlbumModel> UpdateAlbum(String title, id) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  print("Update data");
  print(response.statusCode);
    if(response.statusCode==200){
      return AlbumModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to update post");
    }
  }

    Future<AlbumModel> DeleteAlbum( id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    // body: jsonEncode(<String, String>{
    //   'title': title,
    // }),
  );

  print("Delete data");
  print(response.statusCode);
    if(response.statusCode==200){
      return AlbumModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to Delete post");
    }
  }
}