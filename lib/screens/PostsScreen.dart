import 'package:blocApiApp/bloc/allpostsBloc.dart';
import 'package:blocApiApp/bloc/postDetailBloc.dart';
import 'package:blocApiApp/modals/allpostsmodal.dart';
import 'package:blocApiApp/modals/postDetialModal.dart';
import 'package:blocApiApp/screens/PostScerenDetail.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  AllPostsBloc allpostsBloc = AllPostsBloc();
  PostDetailBloc postDetailBloc = PostDetailBloc();

  @override
  Widget build(BuildContext context) {
    // allpostsBloc.aaallPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: StreamBuilder(
          stream: allpostsBloc.allPostStream,
          builder: (context, AsyncSnapshot<List<AllPosts>> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    color: Colors.blueGrey,
                    child: ListTile(
                      title: Text(
                        "${snapshot.data[index].title}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.launch_rounded,
                          color: Colors.white70,
                        ),
                        onPressed: () async {
                          print("lol");
                          await postDetailBloc
                              .postDetail(snapshot.data[index].id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PostDetailScreen(postDetailBloc)));
                        },
                      ),
                    ),
                  );
                });
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    allpostsBloc.dispose();
    postDetailBloc.dispose();
  }
}
