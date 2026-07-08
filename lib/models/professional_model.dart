class ProfessionalModel {
  final String uid;
  final String fullName;
  final String username;
  final String email;
  final String phone;
  final String profession;
  final int experience;
  final String qualification;
  final String workplace;
  final String bio;
  final String role;
  final DateTime createdAt;

  ProfessionalModel({
    required this.uid,
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.profession,
    required this.experience,
    required this.qualification,
    required this.workplace,
    required this.bio,
    required this.role,
    required this.createdAt,
  });

  // Convert ProfessionalModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'username': username,
      'email': email,
      'phone': phone,
      'profession': profession,
      'experience': experience,
      'qualification': qualification,
      'workplace': workplace,
      'bio': bio,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create ProfessionalModel from Firestore Map
  factory ProfessionalModel.fromMap(Map<String, dynamic> map) {
    return ProfessionalModel(
      uid: map['uid'] ?? '',
      fullName: map['fullName'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profession: map['profession'] ?? '',
      experience: map['experience'] ?? 0,
      qualification: map['qualification'] ?? '',
      workplace: map['workplace'] ?? '',
      bio: map['bio'] ?? '',
      role: map['role'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
    );
  }

  // Copy object with modified values
  ProfessionalModel copyWith({
    String? uid,
    String? fullName,
    String? username,
    String? email,
    String? phone,
    String? profession,
    int? experience,
    String? qualification,
    String? workplace,
    String? bio,
    String? role,
    DateTime? createdAt,
  }) {
    return ProfessionalModel(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profession: profession ?? this.profession,
      experience: experience ?? this.experience,
      qualification: qualification ?? this.qualification,
      workplace: workplace ?? this.workplace,
      bio: bio ?? this.bio,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}