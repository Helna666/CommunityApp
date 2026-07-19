import 'package:flutter/material.dart';
import 'professional_home.dart';
import '../utils/app_colors.dart';

class ProfessionalProfile extends StatefulWidget {
  const ProfessionalProfile({super.key});

  @override
  State<ProfessionalProfile> createState() =>
      _ProfessionalProfileState();
}

class _ProfessionalProfileState
    extends State<ProfessionalProfile> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileHeader(),

                const SizedBox(height: 18),

                _buildStatsCard(),

                const SizedBox(height: 8),

                _sectionCard(
                  title: "Availability",
                  icon: Icons.circle,
                  child: Row(
                    children: [
                      Container(
                        height: 11,
                        width: 11,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isAvailable
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          isAvailable
                              ? "Currently Available"
                              : "Currently Unavailable",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.heading,
                          ),
                        ),
                      ),

                      Switch(
                        value: isAvailable,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            isAvailable = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                _sectionCard(
                  title: "Professional Information",
                  icon: Icons.work_outline,
                  child: Column(
                    children: [
                      _infoRow(
                        Icons.badge_outlined,
                        "Profession",
                        "Doctor",
                      ),
                      _infoRow(
                        Icons.school_outlined,
                        "Qualification",
                        "MBBS, MD",
                      ),
                      _infoRow(
                        Icons.work_history_outlined,
                        "Experience",
                        "5+ Years",
                      ),
                      _infoRow(
                        Icons.location_on_outlined,
                        "Location",
                        "Kerala, India",
                      ),
                      _infoRow(
                        Icons.verified_outlined,
                        "Professional ID",
                        "ER-PRO-1024",
                      ),
                    ],
                  ),
                ),

                _sectionCard(
                  title: "About Me",
                  icon: Icons.person_outline,
                  child: const Text(
                    "A dedicated professional committed to providing reliable services and helping people in the community. Passionate about delivering quality assistance and building meaningful connections.",
                    style: TextStyle(
                      color: AppColors.text,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ),

                _sectionCard(
                  title: "Specializations",
                  icon: Icons.auto_awesome_outlined,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _tag("General Consultation"),
                      _tag("Healthcare"),
                      _tag("Patient Care"),
                      _tag("Health Guidance"),
                    ],
                  ),
                ),

                _sectionCard(
                  title: "Working Hours",
                  icon: Icons.access_time,
                  child: Column(
                    children: [
                      _timeRow(
                        "Monday - Friday",
                        "9:00 AM - 5:00 PM",
                      ),
                      _timeRow(
                        "Saturday",
                        "10:00 AM - 2:00 PM",
                      ),
                      _timeRow(
                        "Sunday",
                        "Unavailable",
                      ),
                    ],
                  ),
                ),

                _sectionCard(
                  title: "Quick Actions",
                  icon: Icons.bolt_outlined,
                  child: Column(
                    children: [
                      _actionTile(
                        Icons.edit_outlined,
                        "Edit Profile",
                        () {
                          _showEditProfileDialog(context);
                        },
                      ),

                      _actionTile(
                        Icons.lock_outline,
                        "Change Password",
                        () {
                          _showChangePasswordDialog(context);
                        },
                      ),

                      _actionTile(
                        Icons.star_outline,
                        "My Reviews",
                        () {
                          _showReviewsSheet(context);
                        },
                      ),

                      _actionTile(
                        Icons.verified_user_outlined,
                        "Documents & Verification",
                        () {
                          _showVerificationSheet(context);
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
  return Stack(
    children: [
      Container(
        height: 215,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.background1,
              AppColors.background3,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
      ),

      // BACK BUTTON
      Positioned(
        top: 10,
        left: 10,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.heading,
            size: 28,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfessionalHome(),
              ),
            );
          },
        ),
      ),

      Positioned(
        top: 28,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const CircleAvatar(
                radius: 52,
                backgroundColor: AppColors.background2,
                child: Icon(
                  Icons.person,
                  size: 65,
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Dr. Anavadhya",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.heading,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "Medical Professional",
              style: TextStyle(
                color: AppColors.subtitle,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
  Widget _buildStatsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white70,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.08),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _stat(
            "4.8",
            "Rating",
            Icons.star,
          ),
          _divider(),
          _stat(
            "5+",
            "Experience",
            Icons.work_outline,
          ),
          _divider(),
          _stat(
            "120",
            "Clients",
            Icons.people_outline,
          ),
        ],
      ),
    );
  }

  Widget _stat(
    String value,
    String label,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 21,
        ),

        const SizedBox(height: 5),

        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.heading,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.subtitle,
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(
      height: 42,
      width: 1,
      color: Colors.grey.withOpacity(0.3),
    );
  }

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 7,
      ),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.72),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white70,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.06),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.primary,
                size: 21,
              ),

              const SizedBox(width: 9),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          child,
        ],
      ),
    );
  }

  Widget _infoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 13,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 21,
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.subtitle,
              ),
            ),
          ),

          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.heading,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.background2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.heading,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _timeRow(
    String day,
    String time,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 11,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.access_time,
            size: 20,
            color: AppColors.primary,
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Text(
              day,
              style: const TextStyle(
                color: AppColors.text,
              ),
            ),
          ),

          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionTile(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: AppColors.background2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
          size: 21,
        ),
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

      onTap: onTap,
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    final nameController =
        TextEditingController(
      text: "Dr. Anavadhya",
    );

    final professionController =
        TextEditingController(
      text: "Doctor",
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.background1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              color: AppColors.heading,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppColors.primary,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: professionController,
                decoration: InputDecoration(
                  labelText: "Profession",
                  prefixIcon: const Icon(
                    Icons.work_outline,
                    color: AppColors.primary,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Profile updated successfully",
                    ),
                  ),
                );
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.background1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: const Text(
            "Change Password",
            style: TextStyle(
              color: AppColors.heading,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _passwordField(
                "Current Password",
              ),

              const SizedBox(height: 12),

              _passwordField(
                "New Password",
              ),

              const SizedBox(height: 12),

              _passwordField(
                "Confirm Password",
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Password updated successfully",
                    ),
                  ),
                );
              },
              child: const Text(
                "Update Password",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _passwordField(String label) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _showReviewsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(22),
          decoration: const BoxDecoration(
            color: AppColors.background1,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                "My Reviews",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 18),

              _reviewTile(
                "Anu",
                "Very helpful and professional.",
                "★★★★★",
              ),

              _reviewTile(
                "Rahul",
                "Excellent service and guidance.",
                "★★★★☆",
              ),

              _reviewTile(
                "Meera",
                "Really friendly and reliable.",
                "★★★★★",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _reviewTile(
    String name,
    String review,
    String rating,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                AppColors.background2,
            child: Text(
              name[0],
              style: const TextStyle(
                color: AppColors.heading,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.heading,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  review,
                  style: const TextStyle(
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),

          Text(
            rating,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _showVerificationSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(22),
          decoration: const BoxDecoration(
            color: AppColors.background1,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.verified,
                size: 55,
                color: Colors.green,
              ),

              const SizedBox(height: 10),

              const Text(
                "Professional Verification",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 18),

              _verificationRow(
                Icons.badge_outlined,
                "Professional ID",
                "ER-PRO-1024",
              ),

              _verificationRow(
                Icons.description_outlined,
                "License",
                "Verified",
              ),

              _verificationRow(
                Icons.check_circle_outline,
                "Account Status",
                "Verified",
              ),

              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Widget _verificationRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
          ),

          const SizedBox(width: 12),

          Text(
            title,
            style: const TextStyle(
              color: AppColors.subtitle,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
          ),
        ],
      ),
    );
  }
}