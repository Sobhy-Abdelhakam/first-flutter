import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool loading = false;
  List data = [];

  getData() async {
    setState(() {
      loading = true;
    });
    var response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var responseBody = jsonDecode(response.body);
    setState(() {
      loading = false;
      data.addAll(responseBody);
    });
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
      body: ListView(
        children: [
          if(loading) const Center(child: CircularProgressIndicator(),),
          ...List.generate(
            data.length,
            (index) => Card(
              child: ListTile(
                title: Text('${data[index]['title']}'),
                subtitle: Text('${data[index]['body']}'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
