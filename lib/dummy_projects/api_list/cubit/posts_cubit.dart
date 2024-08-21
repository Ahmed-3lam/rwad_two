import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rwad_two/dummy_projects/api_list/api_helper.dart';
import 'package:rwad_two/dummy_projects/api_list/model/posts_model.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  List<PostsModel> postsList = [];

  void getPosts() async {
    emit(PostsLoadingState());
    try {
      final response = await ApiHelper.getData();
      List tempList = response.data;
      postsList = tempList.map((e) => PostsModel.fromJson(e)).toList();
      emit(PostsSuccessState());
    } catch (e) {
      emit(PostsErrorState("Internet is bad"));
    }
  }
}
