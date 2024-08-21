class PostsModel {
  String? title;
  String? body;
  PostsModel({this.title, this.body});

  PostsModel.fromJson(Map json) {
    title = json["title"];
    body = json["body"];
  }
}
