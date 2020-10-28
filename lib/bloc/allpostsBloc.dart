import 'dart:async';
import 'package:blocApiApp/modals/allpostsmodal.dart';
import 'package:blocApiApp/services/getAllPosts.dart';

class AllPostsBloc {
  final _allPostsController = StreamController<List<AllPosts>>();

  Stream<List<AllPosts>> get allPostStream => _allPostsController.stream;
  // Sink<List<AllPosts>> get allPostSink => _allPostsController.sink;
  var _posts = <AllPosts>[];
  List<AllPosts> data;

  AllPostsBloc() {
    print("hello");
    posts();
  }

  posts() async {
    data = await getAllPosts();
    print(data);
    _allPostsController.sink.add(data);
  }

  void dispose() {
    _allPostsController.close();
  }
}
