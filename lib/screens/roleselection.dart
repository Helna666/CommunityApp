import 'package:easyreach/professional/professional_login.dart';
import 'package:easyreach/user/user_login.dart';
import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  Widget bubble(
    double top,
    double left,
    double size,
    Color color,
  ) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.18),
        ),
      ),
    );
  }

  Widget roleCard({
    required String title,
    required String subtitle,
    required String image,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.35),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white70,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.10),
              blurRadius: 20,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Image.asset(
    image,
    height: 70,
    width: 70,
    fit: BoxFit.cover,
  ),
),
            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff244D7B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xff54718D),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff7E8FFF),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffD7EEFF),
              Color(0xffB8DFFF),
              Color(0xffC9D6FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              bubble(80, 30, 90, Colors.white),
              bubble(180, 300, 120, Colors.white),
              bubble(500, 40, 70, Colors.white),
              bubble(650, 280, 100, Colors.white),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    ClipRRect(
  borderRadius: BorderRadius.circular(30),
  child: Image.asset(
    'assets/images/r1.jpg',
    height: 150,
    fit: BoxFit.cover,
  ),
),
                    const SizedBox(height: 20),

                    const Text(
                      "Choose Your Role",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight:
                            FontWeight.bold,
                        color: Color(0xff244D7B),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Select how you would like to continue",
                      textAlign:
                          TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff54718D),
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 50),

                    roleCard(
                      title: "User",
                      subtitle:
                          "Find and connect with professionals.",
                      image:
                          "assets/images/u1.jpg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const UserLogin(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 25),

                    roleCard(
                      title: "Professional",
                      subtitle:
                          "Offer your services to the community.",
                      image:
                          "assets/images/pl.jpg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ProfessionalLogin(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}