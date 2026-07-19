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
  State<ChatPage> createState() => _ChatPageState();
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
    return AnimatedBuilder(
      animation: ChatService.instance,
      builder: (context, _) {
        final messages =
            ChatService.instance.getMessages(
          widget.chatId,
        );

        return Scaffold(
          backgroundColor: AppColors.background1,

          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.9),
            elevation: 0,

            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.heading,
                size: 20,
              ),

              onPressed: () {
                Navigator.pop(context);
              },
            ),

            titleSpacing: 0,

            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary
                            .withOpacity(0.20),
                        blurRadius: 8,
                      ),
                    ],
                  ),

                  child: const CircleAvatar(
                    radius: 21,
                    backgroundColor:
                        AppColors.background2,

                    child: Icon(
                      Icons.person,
                      color: AppColors.primary,
                    ),
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
                        fontWeight:
                            FontWeight.bold,
                        color:
                            AppColors.heading,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      widget.profession,

                      style: const TextStyle(
                        fontSize: 12,
                        color:
                            AppColors.subtitle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          body: Stack(
            children: [
              Positioned(
                top: 40,
                right: 20,
                child: _bubble(
                  100,
                  Colors.white,
                ),
              ),

              Positioned(
                bottom: 120,
                left: 15,
                child: _bubble(
                  80,
                  Colors.white,
                ),
              ),

              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller:
                          scrollController,

                      padding:
                          const EdgeInsets.fromLTRB(
                        16,
                        20,
                        16,
                        12,
                      ),

                      itemCount:
                          messages.length,

                      itemBuilder:
                          (context, index) {
                        final message =
                            messages[index];

                        return Align(
                          alignment: message.isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,

                          child: Container(
                            constraints:
                                BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(
                                          context)
                                      .size
                                      .width *
                                  0.75,
                            ),

                            margin:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 5,
                            ),

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 16,
                              vertical: 11,
                            ),

                            decoration:
                                BoxDecoration(
                              color: message.isMe
                                  ? AppColors.primary
                                  : Colors.white
                                      .withOpacity(
                                          0.85),

                              borderRadius:
                                  BorderRadius.only(
                                topLeft:
                                    const Radius
                                        .circular(
                                        20),

                                topRight:
                                    const Radius
                                        .circular(
                                        20),

                                bottomLeft:
                                    Radius.circular(
                                  message.isMe
                                      ? 20
                                      : 4,
                                ),

                                bottomRight:
                                    Radius.circular(
                                  message.isMe
                                      ? 4
                                      : 20,
                                ),
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue
                                      .withOpacity(
                                          0.08),

                                  blurRadius: 8,

                                  offset:
                                      const Offset(
                                    0,
                                    3,
                                  ),
                                ),
                              ],
                            ),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .end,

                              children: [
                                Text(
                                  message.text,

                                  style:
                                      TextStyle(
                                    fontSize: 16,

                                    color:
                                        message.isMe
                                            ? Colors
                                                .white
                                            : AppColors
                                                .heading,
                                  ),
                                ),

                                const SizedBox(
                                    height: 5),

                                Text(
                                  "${message.time.hour.toString().padLeft(2, '0')}:${message.time.minute.toString().padLeft(2, '0')}",

                                  style:
                                      TextStyle(
                                    fontSize: 10,

                                    color:
                                        message.isMe
                                            ? Colors
                                                .white70
                                            : AppColors
                                                .subtitle,
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
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),

                    decoration:
                        BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.9),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue
                              .withOpacity(0.08),

                          blurRadius: 12,

                          offset:
                              const Offset(
                            0,
                            -3,
                          ),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Container(
                          decoration:
                              BoxDecoration(
                            color:
                                AppColors.background2,

                            shape:
                                BoxShape.circle,
                          ),

                          child: IconButton(
                            icon:
                                const Icon(
                              Icons
                                  .emoji_emotions_outlined,

                              color:
                                  AppColors.primary,
                            ),

                            onPressed: () {
                              FocusScope.of(
                                      context)
                                  .unfocus();

                              setState(() {
                                showEmoji =
                                    !showEmoji;
                              });
                            },
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: Container(
                            decoration:
                                BoxDecoration(
                              color: AppColors
                                  .background2
                                  .withOpacity(
                                      0.65),

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          25),
                            ),

                            child: TextField(
                              controller:
                                  messageController,

                              minLines: 1,

                              maxLines: 5,

                              decoration:
                                  const InputDecoration(
                                hintText:
                                    "Type a message...",

                                hintStyle:
                                    TextStyle(
                                  color: AppColors
                                      .subtitle,
                                ),

                                border:
                                    InputBorder
                                        .none,

                                contentPadding:
                                    EdgeInsets
                                        .symmetric(
                                  horizontal: 18,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Container(
                          decoration:
                              const BoxDecoration(
                            color:
                                AppColors.primary,

                            shape:
                                BoxShape.circle,
                          ),

                          child: IconButton(
                            icon:
                                const Icon(
                              Icons.send_rounded,

                              color:
                                  Colors.white,
                            ),

                            onPressed:
                                sendMessage,
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
                          messageController
                              .text +=
                              emoji.emoji;

                          messageController
                              .selection =
                              TextSelection
                                  .fromPosition(
                            TextPosition(
                              offset:
                                  messageController
                                      .text
                                      .length,
                            ),
                          );
                        },

                        config: Config(
                          height: 300,

                          checkPlatformCompatibility:
                              true,

                          emojiViewConfig:
                              const EmojiViewConfig(
                            emojiSizeMax: 28,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bubble(
    double size,
    Color color,
  ) {
    return Container(
      height: size,
      width: size,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.18),
      ),
    );
  }
}