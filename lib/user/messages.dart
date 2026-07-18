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
      Colors.blue,
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
          backgroundColor:
              AppColors.background1,

          appBar: AppBar(
            backgroundColor:
                Colors.transparent,

            elevation: 0,

            centerTitle: true,

            title: const Text(
              "Messages",
              style: TextStyle(
                color: AppColors.heading,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          body: Column(
            children: [

              Padding(
                padding:
                    const EdgeInsets.all(15),

                child: TextField(
                  controller:
                      searchController,

                  decoration:
                      InputDecoration(

                    hintText:
                        "Search professionals",

                    prefixIcon:
                        const Icon(
                      Icons.search,
                    ),

                    filled: true,

                    fillColor:
                        Colors.white,

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                              20),
                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(

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
                                                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 6,
                      ),
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),

                        leading: CircleAvatar(
                          radius: 26,
                          backgroundColor:
                              avatarColor(index),
                          child: Text(
                            contact.name[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        title: Text(
                          contact.name,
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        subtitle: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 3),

                            Text(
                              contact.profession,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              lastMessage,
                              maxLines: 1,
                              overflow:
                                  TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),

                          ],
                        ),

                        trailing: Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [

                            Text(
                              lastTime,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 8),

                            if (ChatService.instance
                                .hasMessages(
                                    contact.id))
                              Container(
                                width: 10,
                                height: 10,
                                decoration:
                                    const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),

                          ],
                        ),

                        onTap: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatPage(
                                chatId: contact.id,
                                name: contact.name,
                                profession:
                                    contact.profession,
                              ),
                            ),
                          );

                        },

                      ),
                    );
                                      },
                ),
              ),

              if (filteredContacts.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: const [

                        Icon(
                          Icons.search_off,
                          size: 70,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 15),

                        Text(
                          "No professionals found",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),

                      ],
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