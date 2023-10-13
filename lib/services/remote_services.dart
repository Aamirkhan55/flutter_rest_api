import 'package:flutter_rest_api/model/post_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<PostModel>?> getPosts() async{
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri); 
    if(response.statusCode ==  200) {
      var json = response.body;
      return postApiFromJson(json);
    }
    return null;
  } 
}