import 'package:flutter/material.dart';

import '../data/chat_contacts.dart';
import '../services/chat_service.dart';
import '../utils/app_colors.dart';
import 'chat.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController searchController =
      TextEditingController();

  List<ChatContact> filteredContacts =
      List.from(chatContacts);

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      filterContacts();
    });
  }

  void filterContacts() {
    final query =
        searchController.text.toLowerCase();

    setState(() {
      filteredContacts = chatContacts.where((contact) {
        return contact.name
                .toLowerCase()
                .contains(query) ||
            contact.profession
                .toLowerCase()
                .contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Color avatarColor(int index) {
    final colors = [
      AppColors.primary,
      Colors.purple,
      Colors.teal,
      Colors.orange,
      Colors.pink,
      Colors.indigo,
    ];

    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ChatService.instance,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.background1,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,

            title: const Text(
              "Messages",
              style: TextStyle(
                color: AppColors.heading,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          body: Stack(
            children: [
              Positioned(
                top: 30,
                right: 20,
                child: _bubble(
                  100,
                  Colors.white,
                ),
              ),

              Positioned(
                bottom: 80,
                left: 20,
                child: _bubble(
                  80,
                  Colors.white,
                ),
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.65),
                        borderRadius:
                            BorderRadius.circular(25),

                        border: Border.all(
                          color: Colors.white70,
                          width: 1.5,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.08),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),

                      child: TextField(
                        controller:
                            searchController,

                        decoration:
                            const InputDecoration(
                          hintText:
                              "Search professionals",

                          hintStyle: TextStyle(
                            color: AppColors.subtitle,
                          ),

                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primary,
                          ),

                          border:
                              InputBorder.none,

                          contentPadding:
                              EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Expanded(
                    child: filteredContacts.isEmpty
                        ? _emptyState()
                        : ListView.builder(
                            padding:
                                const EdgeInsets.only(
                              bottom: 15,
                              top: 5,
                            ),

                            itemCount:
                                filteredContacts.length,

                            itemBuilder:
                                (context, index) {
                              final contact =
                                  filteredContacts[index];

                              final lastMessage =
                                  ChatService.instance
                                      .getLastMessage(
                                          contact.id);

                              final lastTime =
                                  ChatService.instance
                                      .getLastTime(
                                          contact.id);

                              return Container(
                                margin:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),

                                decoration:
                                    BoxDecoration(
                                  color: Colors.white
                                      .withOpacity(0.65),

                                  borderRadius:
                                      BorderRadius
                                          .circular(25),

                                  border: Border.all(
                                    color:
                                        Colors.white70,
                                    width: 1.5,
                                  ),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue
                                          .withOpacity(
                                              0.10),

                                      blurRadius: 15,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),

                                child: ListTile(
                                  contentPadding:
                                      const EdgeInsets
                                          .symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),

                                  leading:
                                      CircleAvatar(
                                    radius: 27,

                                    backgroundColor:
                                        avatarColor(
                                            index),

                                    child: Text(
                                      contact.name[0]
                                          .toUpperCase(),

                                      style:
                                          const TextStyle(
                                        color:
                                            Colors.white,

                                        fontWeight:
                                            FontWeight.bold,

                                        fontSize: 20,
                                      ),
                                    ),
                                  ),

                                  title: Text(
                                    contact.name,

                                    style:
                                        const TextStyle(
                                      color:
                                          AppColors.heading,

                                      fontWeight:
                                          FontWeight.bold,

                                      fontSize: 16,
                                    ),
                                  ),

                                  subtitle:
                                      Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [
                                      const SizedBox(
                                          height: 3),

                                      Text(
                                        contact
                                            .profession,

                                        style:
                                            const TextStyle(
                                          color:
                                              AppColors
                                                  .subtitle,
                                        ),
                                      ),

                                      const SizedBox(
                                          height: 5),

                                      Text(
                                        lastMessage,

                                        maxLines: 1,

                                        overflow:
                                            TextOverflow
                                                .ellipsis,

                                        style:
                                            const TextStyle(
                                          color:
                                              Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),

                                  trailing:
                                      Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,

                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .end,

                                    children: [
                                      Text(
                                        lastTime,

                                        style:
                                            const TextStyle(
                                          fontSize: 11,
                                          color:
                                              AppColors
                                                  .subtitle,
                                        ),
                                      ),

                                      const SizedBox(
                                          height: 8),

                                      if (ChatService
                                          .instance
                                          .hasMessages(
                                              contact.id))
                                        Container(
                                          width: 10,
                                          height: 10,

                                          decoration:
                                              const BoxDecoration(
                                            color:
                                                Colors.green,

                                            shape:
                                                BoxShape
                                                    .circle,
                                          ),
                                        ),
                                    ],
                                  ),

                                  onTap: () {
                                    Navigator.push(
                                      context,

                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ChatPage(
                                          chatId:
                                              contact.id,

                                          name:
                                              contact.name,

                                          profession:
                                              contact
                                                  .profession,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
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

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [
          Container(
            padding:
                const EdgeInsets.all(22),

            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(0.6),

              shape: BoxShape.circle,

              boxShadow: [
                BoxShadow(
                  color: Colors.blue
                      .withOpacity(0.10),

                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: const Icon(
              Icons.chat_bubble_outline,
              size: 55,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            "No professionals found",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.heading,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "Try searching for another professional",
            style: TextStyle(
              color: AppColors.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}