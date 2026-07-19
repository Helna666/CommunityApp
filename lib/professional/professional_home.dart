import 'package:easyreach/professional/professional_chat.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'professional_messages.dart';
import 'professional_profile.dart';
import 'professional_requests.dart';
import '../screens/roleselection.dart';
import 'professional_drawers.dart';
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
        backgroundColor: AppColors.background1,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 25),
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
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Professional",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.heading,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "professional@gmail.com",
                      style: TextStyle(
                        color: AppColors.subtitle,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              _drawerItem(
                context,
                Icons.badge_outlined,
                "Professional Details",
                const ProfessionalDetailsPage(),
              ),

              _drawerItem(
                context,
                Icons.access_time,
                "Availability",
                const ProfessionalAvailabilityPage(),
              ),

              _drawerItem(
                context,
                Icons.settings,
                "Settings",
                const ProfessionalSettingsPage(),
              ),

              _drawerItem(
                context,
                Icons.help_outline,
                "Help & Support",
                const ProfessionalHelpPage(),
              ),

              _drawerItem(
                context,
                Icons.info_outline,
                "About EasyReach",
                const ProfessionalAboutPage(),
              ),

              _drawerItem(
                context,
                Icons.privacy_tip_outlined,
                "Privacy Policy",
                const ProfessionalPrivacyPage(),
              ),

              const Spacer(),

              const Divider(),

              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
               onTap: () {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => const RoleSelectionScreen(),
    ),
    (route) => false,
  );
},),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),

      body: IndexedStack(
        index: currentIndex,
        children: [
          Container(
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
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    left: 25,
                    child: _bubble(
                      90,
                      Colors.white,
                    ),
                  ),

                  Positioned(
                    top: 170,
                    right: 20,
                    child: _bubble(
                      120,
                      Colors.white,
                    ),
                  ),

                  Positioned(
                    bottom: 120,
                    left: 20,
                    child: _bubble(
                      75,
                      Colors.white,
                    ),
                  ),

                  Column(
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
                          horizontal: 18,
                          vertical: 10,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.55),
                            borderRadius: BorderRadius.circular(25),
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
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                            bottom: 15,
                            top: 5,
                          ),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.65),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.white70,
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.10),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                leading: const CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors.primary,
                                    size: 28,
                                  ),
                                ),
                                title: Text(
                                  user["name"]!,
                                  style: const TextStyle(
                                    color: AppColors.heading,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  "@${user["username"]}",
                                  style: const TextStyle(
                                    color: AppColors.subtitle,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        final phone = user["phone"];

                                        if (phone != null &&
                                            phone.isNotEmpty) {
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

                                    IconButton(
                                      onPressed: () {
                                        final chatId = ChatService.instance
                                            .getChatId(
                                          "user1",
                                          user["id"]!,
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                ProfessionalChat(
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

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.heading,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: AppColors.subtitle,
      ),
      onTap: () {
        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
    );
  }
}