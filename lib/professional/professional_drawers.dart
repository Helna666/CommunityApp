import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfessionalSettingsPage extends StatefulWidget {
  const ProfessionalSettingsPage({super.key});

  @override
  State<ProfessionalSettingsPage> createState() =>
      _ProfessionalSettingsPageState();
}

class _ProfessionalSettingsPageState
    extends State<ProfessionalSettingsPage> {
  bool notifications = true;
  bool appointmentReminders = true;
  bool messageAlerts = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _sectionTitle("Preferences"),

          _settingsCard(
            icon: Icons.notifications_none,
            title: "Notifications",
            subtitle: "Receive updates from EasyReach",
            trailing: Switch(
              value: notifications,
              activeColor: AppColors.primary,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          _settingsCard(
            icon: Icons.alarm,
            title: "Appointment Reminders",
            subtitle: "Get reminders before appointments",
            trailing: Switch(
              value: appointmentReminders,
              activeColor: AppColors.primary,
              onChanged: notifications
                  ? (value) {
                      setState(() {
                        appointmentReminders = value;
                      });
                    }
                  : null,
            ),
          ),

          _settingsCard(
            icon: Icons.chat_bubble_outline,
            title: "Message Alerts",
            subtitle: "Get notified about new messages",
            trailing: Switch(
              value: messageAlerts,
              activeColor: AppColors.primary,
              onChanged: notifications
                  ? (value) {
                      setState(() {
                        messageAlerts = value;
                      });
                    }
                  : null,
            ),
          ),

          const SizedBox(height: 25),

          _sectionTitle("Appearance"),

          _settingsCard(
            icon: Icons.dark_mode_outlined,
            title: "Dark Mode",
            subtitle: "Change the appearance of the app",
            trailing: Switch(
              value: darkMode,
              activeColor: AppColors.primary,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),

          _settingsCard(
            icon: Icons.language,
            title: "Language",
            subtitle: "English",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.subtitle,
            ),
            onTap: () {
              _showLanguageDialog(context);
            },
          ),

          const SizedBox(height: 25),

          _sectionTitle("Account"),

          _settingsCard(
            icon: Icons.lock_outline,
            title: "Change Password",
            subtitle: "Update your account password",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.subtitle,
            ),
            onTap: () {
              _showMessage(
                context,
                "Password change will be available after Firebase integration.",
              );
            },
          ),

          _settingsCard(
            icon: Icons.delete_outline,
            title: "Delete Account",
            subtitle: "Permanently remove your account",
            iconColor: Colors.red,
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.red,
            ),
            onTap: () {
              _showDeleteDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.heading,
        ),
      ),
    );
  }

  Widget _settingsCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    Color iconColor = AppColors.primary,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white70,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.08),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.12),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.heading,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.subtitle,
          ),
        ),
        trailing: trailing,
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Choose Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("English"),
                trailing: const Icon(
                  Icons.check,
                  color: AppColors.primary,
                ),
                onTap: () => Navigator.pop(context),
              ),
              const ListTile(
                title: Text("Malayalam"),
              ),
              const ListTile(
                title: Text("Hindi"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Delete Account?"),
          content: const Text(
            "This action cannot be undone.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showMessage(
                  context,
                  "Account deletion will be connected to Firebase later.",
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showMessage(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class ProfessionalDetailsPage extends StatefulWidget {
  const ProfessionalDetailsPage({super.key});

  @override
  State<ProfessionalDetailsPage> createState() =>
      _ProfessionalDetailsPageState();
}

class _ProfessionalDetailsPageState
    extends State<ProfessionalDetailsPage> {
  bool editing = false;

  final nameController =
      TextEditingController(text: "Professional Name");

  final professionController =
      TextEditingController(text: "Doctor");

  final experienceController =
      TextEditingController(text: "5 Years Experience");

  final bioController = TextEditingController(
    text:
        "Passionate professional dedicated to providing quality services to the community.",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        title: const Text("Professional Details"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
        actions: [
          IconButton(
            icon: Icon(
              editing ? Icons.check : Icons.edit,
            ),
            onPressed: () {
              setState(() {
                editing = !editing;
              });

              if (!editing) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Details saved locally."),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 58,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 65,
                    color: AppColors.primary,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.primary,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 17,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Image upload will be connected later.",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _inputField(
            "Full Name",
            nameController,
            Icons.person_outline,
          ),

          _inputField(
            "Profession",
            professionController,
            Icons.work_outline,
          ),

          _inputField(
            "Experience",
            experienceController,
            Icons.workspace_premium_outlined,
          ),

          _inputField(
            "About You",
            bioController,
            Icons.description_outlined,
            maxLines: 4,
          ),

          const SizedBox(height: 20),

          _infoCard(
            Icons.verified_outlined,
            "Verification Status",
            "Verification will be completed after document submission.",
          ),

          _infoCard(
            Icons.star_outline,
            "Professional Rating",
            "No ratings yet",
          ),

          _infoCard(
            Icons.people_outline,
            "People Reached",
            "Your professional statistics will appear here.",
          ),
        ],
      ),
    );
  }

  Widget _inputField(
    String label,
    TextEditingController controller,
    IconData icon, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        enabled: editing,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white.withOpacity(0.75),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _infoCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 28,
          ),
          const SizedBox(width: 15),
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

class ProfessionalAvailabilityPage extends StatefulWidget {
  const ProfessionalAvailabilityPage({super.key});

  @override
  State<ProfessionalAvailabilityPage> createState() =>
      _ProfessionalAvailabilityPageState();
}

class _ProfessionalAvailabilityPageState
    extends State<ProfessionalAvailabilityPage> {
  bool available = true;

  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  final Map<String, bool> selectedDays = {
    "Monday": true,
    "Tuesday": true,
    "Wednesday": true,
    "Thursday": true,
    "Friday": true,
    "Saturday": false,
    "Sunday": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        title: const Text("Availability"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: available
                      ? Colors.green.withOpacity(0.15)
                      : Colors.red.withOpacity(0.15),
                  child: Icon(
                    available
                        ? Icons.check_circle
                        : Icons.cancel,
                    color: available
                        ? Colors.green
                        : Colors.red,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Currently Available",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.heading,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Let users know when you are available.",
                        style: TextStyle(
                          color: AppColors.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: available,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      available = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Working Days",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
          ),

          const SizedBox(height: 12),

          ...days.map(
            (day) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(18),
              ),
              child: CheckboxListTile(
                title: Text(day),
                value: selectedDays[day],
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    selectedDays[day] = value ?? false;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 15),

          _timeCard(
            "Opening Time",
            "09:00 AM",
            Icons.login,
          ),

          _timeCard(
            "Closing Time",
            "05:00 PM",
            Icons.logout,
          ),

          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.primary,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Your availability helps users choose the best time to contact you.",
                    style: TextStyle(
                      color: AppColors.heading,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeCard(
    String title,
    String time,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.primary,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.heading,
          ),
        ),
        subtitle: Text(time),
        trailing: const Icon(
          Icons.edit_outlined,
          color: AppColors.primary,
        ),
        onTap: () {},
      ),
    );
  }
}

class ProfessionalHelpPage extends StatefulWidget {
  const ProfessionalHelpPage({super.key});

  @override
  State<ProfessionalHelpPage> createState() =>
      _ProfessionalHelpPageState();
}

class _ProfessionalHelpPageState
    extends State<ProfessionalHelpPage> {
  final List<Map<String, String>> faqs = [
    {
      "question": "How do I update my professional details?",
      "answer":
          "Open Professional Details from your profile menu and tap the edit button.",
    },
    {
      "question": "How do I manage my availability?",
      "answer":
          "Use the Availability section to select your working days and status.",
    },
    {
      "question": "How do appointment requests work?",
      "answer":
          "Users can request appointments. You can accept or reject them from Requests.",
    },
    {
      "question": "How can users contact me?",
      "answer":
          "Users can call or message you through your professional profile.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.background2,
                  AppColors.background3,
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.support_agent,
                  size: 60,
                  color: AppColors.heading,
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
                  "Find answers to common questions or contact our support team.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Frequently Asked Questions",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
          ),

          const SizedBox(height: 12),

          ...faqs.map(
            (faq) => Card(
              color: Colors.white.withOpacity(0.8),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: ExpansionTile(
                leading: const Icon(
                  Icons.question_mark,
                  color: AppColors.primary,
                ),
                title: Text(
                  faq["question"]!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      0,
                      20,
                      18,
                    ),
                    child: Text(
                      faq["answer"]!,
                      style: const TextStyle(
                        color: AppColors.subtitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Support chat will be connected later.",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.chat),
            label: const Text("Contact Support"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfessionalAboutPage extends StatelessWidget {
  const ProfessionalAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        title: const Text("About EasyReach"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColors.background2,
                  AppColors.background3,
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.connect_without_contact,
                    size: 45,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  "EasyReach",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Connecting communities with trusted professionals.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _aboutCard(
            Icons.public,
            "Our Mission",
            "To make professional services easier to discover, access and connect with.",
          ),

          _aboutCard(
            Icons.handshake_outlined,
            "Our Community",
            "EasyReach brings users and professionals together in one simple platform.",
          ),

          _aboutCard(
            Icons.verified_user_outlined,
            "Built Around Trust",
            "We aim to create a reliable space where users can discover genuine professionals.",
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "Version 1.0.0",
              style: TextStyle(
                color: AppColors.subtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutCard(
    IconData icon,
    String title,
    String text,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 30,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: AppColors.heading,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.subtitle,
                    height: 1.4,
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

class ProfessionalPrivacyPage extends StatelessWidget {
  const ProfessionalPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.heading,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.shield_outlined,
                  size: 65,
                  color: AppColors.primary,
                ),
                SizedBox(height: 15),
                Text(
                  "Your Privacy Matters",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "EasyReach is designed with privacy and trust at its core.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _privacyTile(
            Icons.person_outline,
            "Your Profile",
            "You control the professional information displayed on your profile.",
          ),

          _privacyTile(
            Icons.lock_outline,
            "Secure Information",
            "Your account information is intended to be protected and securely managed.",
          ),

          _privacyTile(
            Icons.visibility_outlined,
            "Information Visibility",
            "Only information intended for community discovery is shown to users.",
          ),

          _privacyTile(
            Icons.delete_outline,
            "Your Control",
            "You can manage or request changes to your account information.",
          ),

          const SizedBox(height: 20),

          const Text(
            "This privacy section will be connected to the complete application privacy policy during final integration.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.subtitle,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _privacyTile(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 30,
          ),
          const SizedBox(width: 15),
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
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.subtitle,
                    height: 1.4,
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