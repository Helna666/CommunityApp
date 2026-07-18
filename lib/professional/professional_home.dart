import 'package:easyreach/professional/professional_chat.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'appointments/professional_appointment_category.dart';
import 'professional_messages.dart';
import 'professional_profile.dart';
import 'professional_requests.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/chat_service.dart';


class ProfessionalHome extends StatefulWidget {
  const ProfessionalHome({super.key});

  @override
  State<ProfessionalHome> createState() => _ProfessionalHomeState();
}

class _ProfessionalHomeState extends State<ProfessionalHome> {
  int currentIndex = 0;

  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, String>> users = [
    {
      "name": "Anu",
      "username": "anu123",
    },
    {
      "name": "Rahul",
      "username": "rahul123",
    },
    {
      "name": "Meera",
      "username": "meera10",
    },
    {
      "name": "Arun",
      "username": "arun09",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.background1,
                    AppColors.background3,
                  ],
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              accountName: const Text("Professional"),
              accountEmail: const Text("professional@gmail.com"),
            ),

            drawerItem(
              Icons.today,
              "Today's Appointments",
              context,
              "Today's Appointments",
            ),

            drawerItem(
              Icons.calendar_month,
              "Upcoming Appointments",
              context,
              "Upcoming Appointments",
            ),

            drawerItem(
              Icons.check_circle,
              "Accepted Appointments",
              context,
              "Accepted Appointments",
            ),

            drawerItem(
              Icons.cancel,
              "Rejected Appointments",
              context,
              "Rejected Appointments",
            ),

            drawerItem(
              Icons.done_all,
              "Completed Appointments",
              context,
              "Completed Appointments",
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: IndexedStack(
        index: currentIndex,
        children: [
                    // HOME PAGE

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.background1,
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
                    title: const Text(
                      "Professional Home",
                      style: TextStyle(
                        color: AppColors.heading,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search users...",
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.only(bottom: 15),
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
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
                              horizontal: 16,
                              vertical: 8,
                            ),

                            leading: const CircleAvatar(
                              radius: 24,
                              child: Icon(Icons.person),
                            ),

                            title: Text(
                              user["name"]!,
                              style: const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              "@${user["username"]}",
                            ),

                            trailing: Row(
                              mainAxisSize:
                                  MainAxisSize.min,
                              children: [

IconButton(
      onPressed: () async {
        final phone = user["phone"];

        if (phone != null && phone.isNotEmpty) {
          final Uri callUri = Uri(
            scheme: 'tel',
            path: phone,
          );

          if (await canLaunchUrl(callUri)) {
            await launchUrl(callUri);
          }
        }
      },
      icon: const Icon(
        Icons.call,
        color: Colors.green,
      ),
    ),


    // Chat Icon
IconButton(
  onPressed: () {

    final chatId =
        ChatService.instance.getChatId(
      "user1",
      user["id"]!,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProfessionalChat(
          chatId: chatId,
          name: user["name"]!,
        ),
      ),
    );
  },
  icon: const Icon(
    Icons.chat,
    color: AppColors.primary,
  ),
),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          const ProfessionalRequests(),

          const ProfessionalMessages(),

          const ProfessionalProfile(),
                  ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Requests",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
    IconData icon,
    String title,
    BuildContext context,
    String pageTitle,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),

      title: Text(title),

      onTap: () {
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProfessionalAppointmentCategory(
              title: pageTitle,
            ),
          ),
        );
      },
    );
  }
}
