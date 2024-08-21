import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rwad_two/dummy_projects/api_list/cubit/posts_cubit.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostsCubit>();
    return BlocListener<PostsCubit, PostsState>(
      listener: (context, state) {
        if (state is PostsErrorState) {
          Get.snackbar("Error", state.msg);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if (state is PostsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostsErrorState) {
              return const Center(
                child: Text(
                  "Error",
                  style: TextStyle(fontSize: 50),
                ),
              );
            }
            return ListView.separated(
              itemCount: cubit.postsList.length,
              separatorBuilder: (c, i) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cubit.postsList[index].title ?? ""),
                  subtitle: Text(cubit.postsList[index].body ?? ""),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
