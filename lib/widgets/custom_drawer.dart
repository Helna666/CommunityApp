import 'package:easyreach/user/appointments.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final VoidCallback onLogout;

  const CustomDrawer({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background1,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
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
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 38,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.heading,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.subtitle,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      role,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.heading,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _drawerItem(
                    context,
                    Icons.favorite_outline,
                    "Favorites",
                    const FavoritesDrawerPage(),
                  ),

                  _drawerItem(
                    context,
                    Icons.calendar_month_outlined,
                    "My Appointments",
                    const Appointments(),
                  ),

                  _drawerItem(
                    context,
                    Icons.history,
                    "Recently Viewed",
                    const RecentlyViewedDrawerPage(),
                  ),

                  _drawerItem(
                    context,
                    Icons.notifications_none,
                    "Notifications",
                    const NotificationsDrawerPage(),
                  ),

                  _drawerItem(
                    context,
                    Icons.settings_outlined,
                    "Settings",
                    const SettingsDrawerPage(),
                  ),

                  _drawerItem(
                    context,
                    Icons.help_outline,
                    "Help & Support",
                    const HelpSupportDrawerPage(),
                  ),
                   _drawerItem(
                           context,
                           Icons.privacy_tip_outlined,
                           "Privacy Policy",
                            const PrivacyPolicyDrawerPage(),
                   ),
                  _drawerItem(
                    context,
                    Icons.info_outline,
                    "About EasyReach",
                    const AboutDrawerPage(),
                  ),
                ],
              ),
            ),

            const Divider(
              indent: 20,
              endIndent: 20,
            ),

            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: onLogout,
            ),

            const SizedBox(height: 5),
          ],
        ),
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
        size: 14,
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
class FavoritesDrawerPage extends StatelessWidget {
  const FavoritesDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContentPage(
      title: "Favorites",
      icon: Icons.favorite,
      message: "Your favorite professionals will appear here.",
    );
  }
}
class RecentlyViewedDrawerPage extends StatelessWidget {
  const RecentlyViewedDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContentPage(
      title: "Recently Viewed",
      icon: Icons.history,
      message: "Recently viewed professionals will appear here.",
    );
  }
}
class NotificationsDrawerPage extends StatelessWidget {
  const NotificationsDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerContentPage(
      title: "Notifications",
      icon: Icons.notifications,
      message: "You have no new notifications.",
    );
  }
}
class SettingsDrawerPage extends StatefulWidget {
  const SettingsDrawerPage({super.key});

  @override
  State<SettingsDrawerPage> createState() =>
      _SettingsDrawerPageState();
}

class _SettingsDrawerPageState
    extends State<SettingsDrawerPage> {
  bool notificationsEnabled = true;
  bool locationEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
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
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            const Center(
              child: Icon(
                Icons.tune_rounded,
                size: 70,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                "Personalize Your Experience",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),
            ),

            const SizedBox(height: 25),

            _sectionTitle(
              Icons.palette_outlined,
              "Preferences",
            ),

            const SizedBox(height: 10),

            _settingCard(
              icon: Icons.notifications_active_outlined,
              title: "Notifications",
              subtitle: "Receive updates and reminders",
              trailing: Switch(
                value: notificationsEnabled,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),

            _settingCard(
              icon: Icons.location_on_outlined,
              title: "Location Services",
              subtitle: "Find professionals near you",
              trailing: Switch(
                value: locationEnabled,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    locationEnabled = value;
                  });
                },
              ),
            ),

            _settingCard(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              subtitle: "Change the appearance of the app",
              trailing: Switch(
                value: darkModeEnabled,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    darkModeEnabled = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 25),

            _sectionTitle(
              Icons.manage_accounts_outlined,
              "Account",
            ),

            const SizedBox(height: 10),

            _actionCard(
              Icons.lock_outline_rounded,
              "Change Password",
              "Update your account password",
            ),

            _actionCard(
              Icons.delete_outline_rounded,
              "Delete Account",
              "Permanently remove your account",
              isDanger: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(
    IconData icon,
    String title,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 22,
        ),

        const SizedBox(width: 8),

        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.heading,
          ),
        ),
      ],
    );
  }

  Widget _settingCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.72),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white70,
        ),
      ),
      child: Row(
        children: [
          _iconContainer(icon),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          trailing,
        ],
      ),
    );
  }

  Widget _actionCard(
    IconData icon,
    String title,
    String subtitle, {
    bool isDanger = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.72),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _iconContainer(
            icon,
            isDanger: isDanger,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDanger
                        ? Colors.red
                        : AppColors.heading,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: AppColors.subtitle,
          ),
        ],
      ),
    );
  }

  Widget _iconContainer(
    IconData icon, {
    bool isDanger = false,
  }) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: isDanger
            ? Colors.red.withOpacity(0.10)
            : AppColors.primary.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: isDanger
            ? Colors.red
            : AppColors.primary,
      ),
    );
  }
}
class HelpSupportDrawerPage extends StatelessWidget {
  const HelpSupportDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
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
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.65),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.support_agent_rounded,
                    size: 70,
                    color: AppColors.primary,
                  ),

                  SizedBox(height: 12),

                  Text(
                    "How can we help?",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppColors.heading,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "We're here to make your EasyReach experience easier.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.subtitle,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            _helpCard(
              Icons.question_mark_rounded,
              "Frequently Asked Questions",
              "Find quick answers to common questions.",
            ),

            _helpCard(
              Icons.search_rounded,
              "Finding a Professional",
              "Learn how to search and connect with professionals.",
            ),

            _helpCard(
              Icons.calendar_month_rounded,
              "Appointments",
              "Learn how to book and manage appointments.",
            ),

            _helpCard(
              Icons.report_problem_outlined,
              "Report a Problem",
              "Tell us about an issue you're facing.",
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.72),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: AppColors.primary,
                    size: 30,
                  ),

                  SizedBox(width: 14),

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Support",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.heading,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "support@easyreach.com",
                        style: TextStyle(
                          color: AppColors.subtitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.72),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white70,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: AppColors.subtitle,
          ),
        ],
      ),
    );
  }
}
class PrivacyPolicyDrawerPage extends StatelessWidget {
  const PrivacyPolicyDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const Icon(
                Icons.shield_outlined,
                size: 75,
                color: AppColors.primary,
              ),

              const SizedBox(height: 12),

              const Text(
                "Your Privacy Matters",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "We are committed to protecting your information.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.subtitle,
                ),
              ),

              const SizedBox(height: 25),

              _policySection(
                Icons.storage_outlined,
                "Information We Collect",
                "EasyReach may collect information such as your name, email address, contact details, account information, and information required to connect you with professionals.",
              ),

              _policySection(
                Icons.settings_outlined,
                "How We Use Your Information",
                "Your information may be used to provide app features, connect users and professionals, manage appointments, improve the application, and communicate important updates.",
              ),

              _policySection(
                Icons.people_outline,
                "Information Sharing",
                "We do not sell your personal information. Information may be shared with other users or professionals when required for communication and services requested through the application.",
              ),

              _policySection(
                Icons.lock_outline,
                "Data Security",
                "We take reasonable measures to protect your information. However, no digital platform can guarantee complete security of information transmitted over the internet.",
              ),

              _policySection(
                Icons.tune_outlined,
                "Your Choices",
                "You may update your account information and manage certain app permissions through the application settings.",
              ),

              _policySection(
                Icons.email_outlined,
                "Contact Us",
                "If you have questions about this Privacy Policy, please contact us at support@easyreach.com.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _policySection(
    IconData icon,
    String title,
    String content,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.72),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class AboutDrawerPage extends StatelessWidget {
  const AboutDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About EasyReach"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
      ),
      body: Container(
        width: double.infinity,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.hub_rounded,
                  size: 70,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                "EasyReach",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Connecting people with the right professionals.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.subtitle,
                ),
              ),

              const SizedBox(height: 30),

              _aboutCard(
                Icons.flag_outlined,
                "Our Mission",
                "EasyReach aims to make it simple for people to discover, connect with, and communicate with trusted professionals in their community.",
              ),

              _aboutCard(
                Icons.people_outline_rounded,
                "What We Do",
                "Users can search for professionals, view their details, communicate with them, and manage appointments through one convenient platform.",
              ),

              _aboutCard(
                Icons.visibility_outlined,
                "Our Vision",
                "To create a connected community where help and professional services are easily accessible to everyone.",
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    size: 16,
                    color: Colors.pinkAccent,
                  ),

                  SizedBox(width: 6),

                  Text(
                    "Made for a connected community",
                    style: TextStyle(
                      color: AppColors.subtitle,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: AppColors.subtitle,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _aboutCard(
    IconData icon,
    String title,
    String content,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.72),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  content,
                  style: const TextStyle(
                    color: AppColors.subtitle,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class DrawerContentPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const DrawerContentPage({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
      ),
      body: Container(
        width: double.infinity,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 70,
                color: AppColors.primary,
              ),

              const SizedBox(height: 20),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.subtitle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}