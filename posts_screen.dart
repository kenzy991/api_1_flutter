import 'package:flutter/material.dart';
import 'api_model.dart';
import 'api_servics_class.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<ApiModel> posts = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    ApiServicsClass api = ApiServicsClass();
    await api.getPosts();
    setState(() {
      posts = api.posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Posts",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  posts[index].id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(posts[index].body),
            ),
          );
        },
      ),
    );
  }
}
