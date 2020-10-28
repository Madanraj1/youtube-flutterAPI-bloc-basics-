import 'package:blocApiApp/bloc/postDetailBloc.dart';
import 'package:blocApiApp/modals/postDetialModal.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  PostDetailBloc bloc;
  PostDetailScreen(this.bloc);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  // PostDetailBloc postDetailBloc = PostDetailBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: StreamBuilder(
          stream: widget.bloc.postDetailStream,
          builder: (context, AsyncSnapshot<PostDetail> snapshot) {
            return Center(
              child: ListTile(
                title: Text(
                  snapshot.data.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  snapshot.data.body,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                leading: Text("No:${snapshot.data.id.toString()}"),
              ),
            );
          }),
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   widget.bloc.dispose();
  // }
}
