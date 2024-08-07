class ChatModel {
  String? image;
  String? name;
  String? msg;
  MessageType? messageType;
  String? createdAt;

  ChatModel(
      {this.messageType, this.createdAt, this.name, this.image, this.msg});

  ChatModel.fromJson(Map json) {
    image = json["image"];
    name = json["name"];
    msg = json["message"];
    createdAt = json["created_at"];
    switch (json["message_type"]) {
      case "text":
        messageType = MessageType.TEXT;

      case "video":
        messageType = MessageType.VIDEO;

      default:
        messageType = MessageType.GIF;
    }
  }
}

enum MessageType {
  VIDEO,
  GIF,
  TEXT,
}
