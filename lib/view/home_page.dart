import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/post_model.dart';
import 'package:flutter_rest_api/services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<PostModel>? posts;
  
  var isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async{
   posts =  await RemoteService().getPosts();
   if(posts != null) {
    setState(() {
      isLoaded = true;
    });
   }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Api'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text(posts![index].id.toString()),
                title: Text(posts![index].title),
                subtitle: Text(posts![index].body),
              ),
            );
          }),  
      ),
    );
  }
  
}