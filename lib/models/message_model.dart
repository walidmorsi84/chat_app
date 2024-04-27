import 'package:chat_app/constants.dart';

class MessagesModel {
  final String textMessage;
  final String id;

  MessagesModel(this.textMessage, this.id);

  factory MessagesModel.fromJson(jsonData) {
    return MessagesModel(jsonData[kMessage], jsonData['id']);
  }
}
