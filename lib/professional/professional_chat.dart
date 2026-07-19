import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../services/chat_service.dart';
import '../utils/app_colors.dart';

class ProfessionalChat extends StatefulWidget {
  final String chatId;
  final String name;

  const ProfessionalChat({
    super.key,
    required this.chatId,
    required this.name,
  });

  @override
  State<ProfessionalChat> createState() =>
      _ProfessionalChatState();
}

class _ProfessionalChatState
    extends State<ProfessionalChat> {
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
      isMe: false,
    );

    messageController.clear();

    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages =
        ChatService.instance.getMessages(widget.chatId);

    return AnimatedBuilder(
      animation: ChatService.instance,
      builder: (context, _) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.background1,
                  AppColors.background2,
                  AppColors.background3,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.65),
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.08),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.heading,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                        const CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: AppColors.primary,
                            size: 27,
                          ),
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
                                fontWeight: FontWeight.bold,
                                color: AppColors.heading,
                              ),
                            ),

                            const SizedBox(height: 3),

                            const Text(
                              "User",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.subtitle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.all(15),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];

                        return Align(
                          alignment: message.isMe
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context)
                                          .size
                                          .width *
                                      0.75,
                            ),
                            margin:
                                const EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 11,
                            ),
                            decoration: BoxDecoration(
                              color: message.isMe
                                  ? Colors.white.withOpacity(0.85)
                                  : AppColors.primary,
                              borderRadius:
                                  BorderRadius.only(
                                topLeft:
                                    const Radius.circular(20),
                                topRight:
                                    const Radius.circular(20),
                                bottomLeft: Radius.circular(
                                  message.isMe ? 5 : 20,
                                ),
                                bottomRight: Radius.circular(
                                  message.isMe ? 20 : 5,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue
                                      .withOpacity(0.08),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ],
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
                                        ? AppColors.heading
                                        : Colors.white,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "${message.time.hour.toString().padLeft(2, '0')}:${message.time.minute.toString().padLeft(2, '0')}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: message.isMe
                                        ? AppColors.subtitle
                                        : Colors.white70,
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
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.75),
                      border: const Border(
                        top: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: AppColors.primary,
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();

                            setState(() {
                              showEmoji = !showEmoji;
                            });
                          },
                        ),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.background2,
                              borderRadius:
                                  BorderRadius.circular(25),
                            ),
                            child: TextField(
                              controller: messageController,
                              minLines: 1,
                              maxLines: 5,
                              decoration:
                                  const InputDecoration(
                                hintText:
                                    "Type a message...",
                                hintStyle: TextStyle(
                                  color: AppColors.subtitle,
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
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
                        onEmojiSelected:
                            (category, emoji) {
                          messageController.text +=
                              emoji.emoji;

                          messageController.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                              offset: messageController
                                  .text
                                  .length,
                            ),
                          );
                        },
                        config: const Config(
                          height: 300,
                          checkPlatformCompatibility: true,
                          emojiViewConfig:
                              EmojiViewConfig(
                            emojiSizeMax: 28,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}