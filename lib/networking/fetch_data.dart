import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///Request
// Future<Post> featchPost() async {
//   final reponse = await http
//       .get("https://jsonplaceholder.typicode.com/posts/1")
//       .catchError(() {
//     return;
//   });

//   if (reponse.statusCode == 200) {
//     return Post.fromJson(json.decode(reponse.body));
//   } else {
//     throw Exception("Failed getting Data");
//   }
// }

///Future Builder

///Post Class
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

class NetworkFeatchDataApp extends StatelessWidget {
  // final Future<Post> post = featchPost();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Featch Data From Internet"),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            // future: featchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Post post = snapshot.data;
                String text =
                    "ID: ${post.userId} \n\nTitle: ${post.title}\n\nBody: ${post.body}";
                return Text(text);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
`