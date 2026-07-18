import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
  });
}


class ChatService extends ChangeNotifier {

  ChatService._();

  static final ChatService instance = ChatService._();


  final Map<String, List<ChatMessage>> _conversations = {};


  // Creates a unique chat ID between two people
  String getChatId(
    String userId,
    String professionalId,
  ) {

    List<String> ids = [
      userId,
      professionalId,
    ];

    ids.sort();

    return ids.join("_");
  }



  List<ChatMessage> getMessages(String chatId) {

    if (!_conversations.containsKey(chatId)) {

      _conversations[chatId] = [];

    }

    return _conversations[chatId]!;

  }



  void sendMessage({

    required String chatId,

    required String text,

    required bool isMe,

  }) {


    if (text.trim().isEmpty) return;


    if (!_conversations.containsKey(chatId)) {

      _conversations[chatId] = [];

    }


    _conversations[chatId]!.add(

      ChatMessage(

        text: text.trim(),

        isMe: isMe,

        time: DateTime.now(),

      ),

    );


    notifyListeners();

  }




  String getLastMessage(String chatId) {

    final list = getMessages(chatId);


    if (list.isEmpty) {

      return "Tap to start chatting";

    }


    return list.last.text;

  }




  String getLastTime(String chatId) {

    final list = getMessages(chatId);


    if (list.isEmpty) {

      return "";

    }


    final time = list.last.time;


    String hour =
        time.hour.toString().padLeft(2, '0');


    String minute =
        time.minute.toString().padLeft(2, '0');


    return "$hour:$minute";

  }





  bool hasMessages(String chatId) {

    return getMessages(chatId).isNotEmpty;

  }





  void clearChat(String chatId) {

    _conversations[chatId]?.clear();

    notifyListeners();

  }

}