import 'package:flutter/material.dart';

import '../services/chat_service.dart';
import '../utils/app_colors.dart';
import 'professional_chat.dart';

class ProfessionalMessages extends StatefulWidget {
  const ProfessionalMessages({super.key});

  @override
  State<ProfessionalMessages> createState() =>
      _ProfessionalMessagesState();
}

class _ProfessionalMessagesState
    extends State<ProfessionalMessages> {

  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, String>> users = [

    {
      "id": "user1",
      "name": "Anavadhya",
    },

    {
      "id": "user2",
      "name": "Rahul",
    },

    {
      "id": "user3",
      "name": "Meera",
    },

    {
      "id": "user4",
      "name": "Arjun",
    },

    {
      "id": "user5",
      "name": "Sneha",
    },

  ];

  late List<Map<String, String>> filteredUsers;

  @override
  void initState() {
    super.initState();

    filteredUsers = List.from(users);

    searchController.addListener(searchUsers);
  }

  void searchUsers() {

    final query =
        searchController.text.toLowerCase();

    setState(() {

      filteredUsers =
          users.where((user) {

        return user["name"]!
            .toLowerCase()
            .contains(query);

      }).toList();

    });

  }

  Color avatarColor(int index) {

    final colors = [

      Colors.blue,

      Colors.deepPurple,

      Colors.orange,

      Colors.green,

      Colors.pink,

    ];

    return colors[index % colors.length];

  }

  @override
  void dispose() {

    searchController.dispose();

    super.dispose();

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
                        "Search users",

                    prefixIcon:
                        const Icon(Icons.search),

                    filled: true,

                    fillColor:
                        Colors.white,

                    border:
                        OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(20),

                      borderSide:
                          BorderSide.none,

                    ),

                  ),

                ),

              ),

              Expanded(

                child: ListView.builder(

                  itemCount:
                      filteredUsers.length,

                  itemBuilder:
                      (context, index) {

                    final user =
                        filteredUsers[index];

                    final lastMessage =
                        ChatService.instance
                            .getLastMessage(
                                user["id"]!);

                    final lastTime =
                        ChatService.instance
                            .getLastTime(
                                user["id"]!);
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

                          radius: 25,

                          backgroundColor:
                              avatarColor(index),

                          child: Text(

                            user["name"]![0],

                            style: const TextStyle(

                              color: Colors.white,

                              fontSize: 20,

                              fontWeight:
                                  FontWeight.bold,

                            ),

                          ),

                        ),

                        title: Text(

                          user["name"]!,

                          style: const TextStyle(

                            fontWeight:
                                FontWeight.bold,

                            fontSize: 16,

                          ),

                        ),

                        subtitle: Text(

                          lastMessage,

                          maxLines: 1,

                          overflow:
                              TextOverflow.ellipsis,

                          style: const TextStyle(

                            color: Colors.black54,

                          ),

                        ),

                        trailing: Column(

                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [

                            Text(

                              lastTime,

                              style: const TextStyle(

                                color: Colors.grey,

                                fontSize: 11,

                              ),

                            ),

                            const SizedBox(height: 6),

                            if (ChatService.instance
                                .hasMessages(
                                    user["id"]!))

                              Container(

                                width: 10,

                                height: 10,

                                decoration:
                                    const BoxDecoration(

                                  color: Colors.green,

                                  shape:
                                      BoxShape.circle,

                                ),

                              ),

                          ],

                        ),

                        onTap: () {

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) =>
                                  ProfessionalChat(

                                chatId:
                                    user["id"]!,

                                name:
                                    user["name"]!,

                              ),

                            ),

                          );

                        },

                      ),

                    );
                                      },
                ),
              ),

              if (filteredUsers.isEmpty)
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
                          "No users found",
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