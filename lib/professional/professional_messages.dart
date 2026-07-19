import 'package:flutter/material.dart';

import '../services/chat_service.dart';
import '../utils/app_colors.dart';
import 'professional_chat.dart';
import 'professional_home.dart';

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
    final query = searchController.text.toLowerCase();

    setState(() {
      filteredUsers = users.where((user) {
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
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,

                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.heading,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ProfessionalHome(),
                          ),
                        );
                      },
                    ),

                    title: const Text(
                      "Messages",
                      style: TextStyle(
                        color: AppColors.heading,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

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
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "Search users...",
                          hintStyle: TextStyle(
                            color: AppColors.subtitle,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primary,
                          ),
                          border: InputBorder.none,
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
                    child: filteredUsers.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.search_off,
                                  size: 70,
                                  color: AppColors.subtitle,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "No users found",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        AppColors.subtitle,
                                    fontWeight:
                                        FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding:
                                const EdgeInsets.only(
                              top: 5,
                              bottom: 15,
                            ),
                            itemCount:
                                filteredUsers.length,
                            itemBuilder:
                                (context, index) {
                              final user =
                                  filteredUsers[index];

                              final lastMessage =
                                  ChatService.instance
                                      .getLastMessage(
                                user["id"]!,
                              );

                              final lastTime =
                                  ChatService.instance
                                      .getLastTime(
                                user["id"]!,
                              );

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
                                      BorderRadius.circular(
                                    25,
                                  ),
                                  border: Border.all(
                                    color: Colors.white70,
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue
                                          .withOpacity(
                                        0.10,
                                      ),
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
                                    vertical: 8,
                                  ),

                                  leading: CircleAvatar(
                                    radius: 27,
                                    backgroundColor:
                                        avatarColor(index),
                                    child: Text(
                                      user["name"]![0],
                                      style:
                                          const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  title: Text(
                                    user["name"]!,
                                    style:
                                        const TextStyle(
                                      color:
                                          AppColors.heading,
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
                                    style:
                                        const TextStyle(
                                      color:
                                          AppColors.subtitle,
                                    ),
                                  ),

                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                    children: [
                                      Text(
                                        lastTime,
                                        style:
                                            const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 6,
                                      ),

                                      if (ChatService
                                          .instance
                                          .hasMessages(
                                        user["id"]!,
                                      ))
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration:
                                              const BoxDecoration(
                                            color: Colors.green,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}