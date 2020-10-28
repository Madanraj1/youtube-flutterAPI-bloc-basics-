import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:blocApiApp/modals/postDetialModal.dart';
import 'package:blocApiApp/services/getAllPosts.dart';

class PostDetailBloc {
  final _postDetailController = BehaviorSubject<PostDetail>();
  // final _postIdController = StreamController<int>();
  Stream<PostDetail> get postDetailStream => _postDetailController.stream;
  // Sink<int> get postDetailSink => _postIdController.sink;

  PostDetail data;
  // PostDetailBloc() {}

  postDetail(int id) async {
    data = await postDetailre(id);
    print(data.title);
    _postDetailController.sink.add(data);
  }

  void dispose() {
    _postDetailController.close();
    // _postIdController.close();
  }
}
