import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../services/chat_service.dart';
import '../utils/app_colors.dart';

class ChatPage extends StatefulWidget {
  final String chatId;
  final String name;
  final String profession;

  const ChatPage({
    super.key,
    required this.chatId,
    required this.name,
    required this.profession,
  });

  @override
  State<ChatPage> createState() =>
      _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController =
      TextEditingController();

  final ScrollController scrollController =
      ScrollController();

  bool showEmoji = false;

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) {
      return;
    }

    ChatService.instance.sendMessage(
      chatId: widget.chatId,
      text: messageController.text,
      isMe: true,
    );

    messageController.clear();

    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration:
                const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages =
        ChatService.instance.getMessages(
      widget.chatId,
    );

    return AnimatedBuilder(
      animation: ChatService.instance,
      builder: (context, _) {
        return Scaffold(
          backgroundColor:
              AppColors.background1,

          appBar: AppBar(
            backgroundColor: Colors.white,

            elevation: 1,

            leading: IconButton(
              icon:
                  const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            title: Row(
              children: [

                const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),

                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            AppColors.heading,
                      ),
                    ),

                    Text(
                      widget.profession,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          body: Column(
            children: [
                            Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];

                    return Align(
                      alignment: message.isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth:
                              MediaQuery.of(context)
                                      .size
                                      .width *
                                  0.75,
                        ),

                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),

                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          color: message.isMe
                              ? AppColors.primary
                              : Colors.white,
                          borderRadius:
                              BorderRadius.only(
                            topLeft:
                                const Radius.circular(18),
                            topRight:
                                const Radius.circular(18),
                            bottomLeft:
                                Radius.circular(
                                    message.isMe
                                        ? 18
                                        : 0),
                            bottomRight:
                                Radius.circular(
                                    message.isMe
                                        ? 0
                                        : 18),
                          ),
                        ),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.end,
                          children: [

                            Text(
                              message.text,
                              style: TextStyle(
                                fontSize: 16,
                                color: message.isMe
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "${message.time.hour.toString().padLeft(2, '0')}:${message.time.minute.toString().padLeft(2, '0')}",
                              style: TextStyle(
                                fontSize: 10,
                                color: message.isMe
                                    ? Colors.white70
                                    : Colors.grey,
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                color: Colors.white,
                child: Row(
                  children: [

                    IconButton(
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        FocusScope.of(context)
                            .unfocus();

                        setState(() {
                          showEmoji = !showEmoji;
                        });
                      },
                    ),

                    Expanded(
                      child: TextField(
                        controller: messageController,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          filled: true,
                          fillColor:
                              AppColors.background2,
                          border:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(
                                    25),
                            borderSide:
                                BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    CircleAvatar(
                      backgroundColor:
                          AppColors.primary,
                      child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onPressed: sendMessage,
                      ),
                    ),

                  ],
                ),
              ),
                            if (showEmoji)
                SizedBox(
                  height: 300,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      messageController.text += emoji.emoji;

                      messageController.selection =
                          TextSelection.fromPosition(
                        TextPosition(
                          offset:
                              messageController.text.length,
                        ),
                      );
                    },

                    config: Config(
                      height: 300,
                      checkPlatformCompatibility: true,
                      emojiViewConfig:
                          const EmojiViewConfig(
                        emojiSizeMax: 28,
                      ),
                    ),
                  ),
                ),

            ],
          ),
        );
      },
    );
  }
}