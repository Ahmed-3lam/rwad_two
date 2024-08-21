part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoadingState extends PostsState {}

final class PostsSuccessState extends PostsState {}

final class PostsErrorState extends PostsState {
  final String msg;
  PostsErrorState(this.msg);
}
