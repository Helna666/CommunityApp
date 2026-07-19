import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEditing = false;
  final TextEditingController editController =
    TextEditingController();
    
  final TextEditingController nameController =
      TextEditingController(text: "User");

  final TextEditingController emailController =
      TextEditingController(text: "user@gmail.com");

  final TextEditingController phoneController =
      TextEditingController(text: "+91 XXXXX XXXXX");

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    editController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.background1,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "My Profile",
          style: TextStyle(
            color: AppColors.heading,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.heading,
            ),
            onPressed: _showMoreOptions,
          ),
        ],
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              18,
              5,
              18,
              25,
            ),

            child: Column(
              children: [

                _profileCard(),

                const SizedBox(height: 18),

                _profileCompletion(),

                const SizedBox(height: 20),

                _sectionTitle(
                  "Your EasyReach Journey",
                ),

                const SizedBox(height: 10),

                Row(
                  children: [

                    Expanded(
                      child: _statCard(
                        icon: Icons.visibility_outlined,
                        value: "12",
                        label: "Profiles Viewed",
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _statCard(
                        icon: Icons.event_available_outlined,
                        value: "04",
                        label: "Appointments",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [

                    Expanded(
                      child: _statCard(
                        icon: Icons.chat_bubble_outline,
                        value: "08",
                        label: "Conversations",
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _statCard(
                        icon: Icons.favorite_border,
                        value: "06",
                        label: "Saved People",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                _sectionTitle(
                  "Your Interests",
                ),

                const SizedBox(height: 10),

                _interestsCard(),

                const SizedBox(height: 22),

                _sectionTitle(
                  "Account Overview",
                ),

                const SizedBox(height: 10),

                _overviewCard(),

                const SizedBox(height: 22),

                _editButton(),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.68),

        borderRadius: BorderRadius.circular(32),

        border: Border.all(
          color: Colors.white70,
          width: 1.5,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.10),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),

      child: Column(
        children: [

          Stack(
            alignment: Alignment.bottomRight,

            children: [

              Container(
                padding: const EdgeInsets.all(5),

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.8),
                ),

                child: const CircleAvatar(
                  radius: 48,

                  backgroundColor:
                      AppColors.background2,

                  child: Icon(
                    Icons.person,
                    size: 55,
                    color: AppColors.primary,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8),

                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),

                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ],
          ),

          const SizedBox(height: 13),

          const Text(
            "User",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.heading,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "user@gmail.com",
            style: TextStyle(
              color: AppColors.subtitle,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 7,
            ),

            decoration: BoxDecoration(
              color: AppColors.background2
                  .withOpacity(0.7),

              borderRadius: BorderRadius.circular(20),
            ),

            child: const Row(
              mainAxisSize: MainAxisSize.min,

              children: [

                Icon(
                  Icons.verified_outlined,
                  size: 17,
                  color: AppColors.primary,
                ),

                SizedBox(width: 6),

                Text(
                  "Community Member",
                  style: TextStyle(
                    color: AppColors.heading,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileCompletion() {
    return Container(
      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.55),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: Colors.white70,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              const Row(
                children: [

                  Icon(
                    Icons.auto_awesome,
                    color: AppColors.primary,
                    size: 20,
                  ),

                  SizedBox(width: 8),

                  Text(
                    "Complete your profile",
                    style: TextStyle(
                      color: AppColors.heading,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Text(
                "70%",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: const LinearProgressIndicator(
              value: 0.7,
              minHeight: 8,
              backgroundColor: Colors.white,
              valueColor:
                  AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Add your phone number to complete your profile",
            style: TextStyle(
              color: AppColors.subtitle,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 10,
      ),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.62),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: Colors.white70,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.06),
            blurRadius: 10,
          ),
        ],
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: AppColors.primary,
            size: 25,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: const TextStyle(
              color: AppColors.heading,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.subtitle,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _interestsCard() {
    final interests = [
      "Healthcare",
      "Education",
      "Technology",
      "Home Services",
    ];

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.62),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: Colors.white70,
        ),
      ),

      child: Wrap(
        spacing: 8,
        runSpacing: 8,

        children: interests.map((interest) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 8,
            ),

            decoration: BoxDecoration(
              color: AppColors.background2
                  .withOpacity(0.7),

              borderRadius: BorderRadius.circular(20),
            ),

            child: Text(
              interest,
              style: const TextStyle(
                color: AppColors.heading,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _overviewCard() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.62),

        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: Colors.white70,
        ),
      ),

      child: Column(
        children: [

          _overviewRow(
            Icons.calendar_today_outlined,
            "Member since",
            "July 2026",
          ),

          const Divider(
            height: 22,
            color: Colors.white70,
          ),

          _overviewRow(
            Icons.location_on_outlined,
            "Location",
            "Not added yet",
          ),

          const Divider(
            height: 22,
            color: Colors.white70,
          ),

          _overviewRow(
            Icons.shield_outlined,
            "Account status",
            "Active",
          ),
        ],
      ),
    );
  }

  Widget _overviewRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [

        Container(
          padding: const EdgeInsets.all(9),

          decoration: BoxDecoration(
            color: AppColors.background2
                .withOpacity(0.7),

            shape: BoxShape.circle,
          ),

          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: const TextStyle(
                  color: AppColors.subtitle,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  color: AppColors.heading,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _editButton() {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton.icon(
        onPressed: _showEditProfile,

        icon: const Icon(
          Icons.edit_outlined,
        ),

        label: const Text(
          "Edit Profile",
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,

          padding: const EdgeInsets.symmetric(
            vertical: 14,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.heading,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showEditProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom +
                20,
          ),

          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              const Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameController,

                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: const Icon(
                    Icons.person_outline,
                  ),

                  filled: true,
                  fillColor: AppColors.background1,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: emailController,

                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),

                  filled: true,
                  fillColor: AppColors.background1,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: phoneController,

                decoration: InputDecoration(
                  labelText: "Phone",
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                  ),

                  filled: true,
                  fillColor: AppColors.background1,

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primary,

                    foregroundColor:
                        Colors.white,

                    padding:
                        const EdgeInsets.symmetric(
                      vertical: 14,
                    ),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                  ),

                  child: const Text(
                    "Save Changes",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,

      backgroundColor: Colors.transparent,

      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),

          decoration: const BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              ListTile(
                leading: const Icon(
                  Icons.share_outlined,
                  color: AppColors.primary,
                ),

                title: const Text(
                  "Share Profile",
                ),

                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Profile sharing coming soon",
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.qr_code_2,
                  color: AppColors.primary,
                ),

                title: const Text(
                  "My QR Code",
                ),

                onTap: () {
                  Navigator.pop(context);

                  showDialog(
                    context: context,

                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          "My EasyReach QR",
                        ),

                        content: const SizedBox(
                          height: 180,
                          child: Center(
                            child: Icon(
                              Icons.qr_code_2,
                              size: 150,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}