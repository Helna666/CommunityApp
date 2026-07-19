import 'package:easyreach/user/messages.dart';
import 'package:easyreach/user/profile.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/category_chip.dart';
import '../widgets/professional_card.dart';
import 'package:easyreach/user/appointment.dart';
import 'favorites.dart';
import '../utils/app_colors.dart';
import '../utils/call_helper.dart';
import 'chat.dart';


class Userhome extends StatefulWidget {
  const Userhome({super.key});

  @override
  State<Userhome> createState() => _UserhomeState();
}

class _UserhomeState extends State<Userhome> {
  int currentIndex = 0;

  String selectedCategory = "All";

  final searchController = TextEditingController();

  final List<String> categories = [
    "All",
    "Doctor",
    "Lawyer",
    "Teacher",
    "Electrician",
    "Mechanic",
    "Trainer",
    "Designer",
  ];

  final List<Map<String, String>> professionals = [
    {
      "id": "pro1",
      "name": "Dr. Arun",
      "profession": "Doctor",
      "experience": "5 years",
      "rating": "4.8",
    },
    {
      "id": "pro2",
      "name": "John Mathew",
      "profession": "Lawyer",
      "experience": "8 years",
      "rating": "4.7",
    },
    {
      "id": "pro3",
      "name": "Akansha Choudhary",
      "profession": "Teacher",
      "experience": "6 years",
      "rating": "4.9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        name: "User",
        email: "user@gmail.com",
        role: "User",
        onLogout: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/roleselection",
            (route) => false,
          );
        },
      ),

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

                    title: const Text(
                      "Find Professionals",
                      style: TextStyle(
                        color: AppColors.heading,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),

                    iconTheme: const IconThemeData(
                      color: AppColors.heading,
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

                        decoration:
                            const InputDecoration(
                          hintText:
                              "Search professionals...",

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

                  SizedBox(
                    height: 50,

                    child: ListView.builder(
                      scrollDirection:
                          Axis.horizontal,

                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      itemCount:
                          categories.length,

                      itemBuilder:
                          (context, index) {
                        return CategoryChip(
                          title:
                              categories[index],

                          selected:
                              selectedCategory ==
                                  categories[index],

                          onTap: () {
                            setState(() {
                              selectedCategory =
                                  categories[index];
                            });
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.only(
                        bottom: 15,
                        top: 5,
                      ),

                      itemCount:
                          professionals.length,

                      itemBuilder:
                          (context, index) {
                        final pro =
                            professionals[index];

                        if (selectedCategory !=
                                "All" &&
                            pro["profession"] !=
                                selectedCategory) {
                          return const SizedBox();
                        }

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
                                    25),

                            border: Border.all(
                              color: Colors.white70,
                              width: 1.5,
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue
                                    .withOpacity(0.10),

                                blurRadius: 15,
                                spreadRadius: 2,
                              ),
                            ],
                          ),

                          child: ProfessionalCard(
                            name: pro["name"]!,
                            profession:
                                pro["profession"]!,
                            experience:
                                pro["experience"]!,
                            rating:
                                pro["rating"]!,

                            onCall: () {
                              CallHelper.makeCall(
                                "********",
                              );
                            },

                            onMessage: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ChatPage(
                                    chatId:
                                        pro["id"]!,
                                    name:
                                        pro["name"]!,
                                    profession:
                                        pro["profession"]!,
                                  ),
                                ),
                              );
                            },

                            onAppointment: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AppointmentPage(
                                    professionalName:
                                        pro["name"]!,
                                    profession:
                                        pro["profession"]!,
                                  ),
                                ),
                              );
                            },

                            onFavorite: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const Favorites(),
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
        ),
      ),

      bottomNavigationBar:
          CustomBottomNav(
        currentIndex: currentIndex,

        onTap: (index) {
          if (index == 0) {
            setState(() {
              currentIndex = 0;
            });
          }

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    const MessagesPage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    const Profile(),
              ),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
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
}