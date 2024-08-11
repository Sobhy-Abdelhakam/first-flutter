import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  Future<List> getData() async {
    var response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlaceHolder'),
      ),
      body: Center(
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapShot){
            if (snapShot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            if (snapShot.hasError){
              return Text('${snapShot.error}');
            }
            return ListView.builder(
              itemCount: snapShot.data!.length,
              itemBuilder: (context, index){
              return Card(
                elevation: 4,
                child: ListTile(
                  title: Text('${snapShot.data![index]['title']}'),
                  subtitle: Text('${snapShot.data![index]['body']}'),
                ),
              );
            },);
          },
        ),
      )
    );
  }
}
