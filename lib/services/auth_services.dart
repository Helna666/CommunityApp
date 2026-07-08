import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../models/professional_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // -------------------- USER REGISTER --------------------
  Future<String> registerUser({
    required String fullName,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      // Check if username already exists
      final usernameCheck = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (usernameCheck.docs.isNotEmpty) {
        return "Username already exists";
      }

      // Create Firebase Authentication account
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = credential.user!;

      UserModel userModel = UserModel(
        uid: user.uid,
        fullName: fullName,
        username: username,
        email: email,
        phone: phone,
        role: "user",
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toMap());

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Registration failed";
    } catch (e) {
      return e.toString();
    }
  }

  // -------------------- PROFESSIONAL REGISTER --------------------

  Future<String> registerProfessional({
    required String fullName,
    required String username,
    required String email,
    required String phone,
    required String profession,
    required int experience,
    required String qualification,
    required String workplace,
    required String bio,
    required String password,
  }) async {
    try {
      final usernameCheck = await _firestore
          .collection('professionals')
          .where('username', isEqualTo: username)
          .get();

      if (usernameCheck.docs.isNotEmpty) {
        return "Username already exists";
      }

      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = credential.user!;

      ProfessionalModel professional = ProfessionalModel(
        uid: user.uid,
        fullName: fullName,
        username: username,
        email: email,
        phone: phone,
        profession: profession,
        experience: experience,
        qualification: qualification,
        workplace: workplace,
        bio: bio,
        role: "professional",
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('professionals')
          .doc(user.uid)
          .set(professional.toMap());

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Registration failed";
    } catch (e) {
      return e.toString();
    }
  }

  // -------------------- LOGIN WITH EMAIL --------------------

  Future<String> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Login failed";
    } catch (e) {
      return e.toString();
    }
  }

  // -------------------- LOGIN WITH USERNAME --------------------

  Future<String> loginWithUsername({
    required String username,
    required String password,
  }) async {
    try {
      String email = "";

      final userDoc = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (userDoc.docs.isNotEmpty) {
        email = userDoc.docs.first['email'];
      } else {
        final professionalDoc = await _firestore
            .collection('professionals')
            .where('username', isEqualTo: username)
            .get();

        if (professionalDoc.docs.isNotEmpty) {
          email = professionalDoc.docs.first['email'];
        } else {
          return "Username not found";
        }
      }

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Login failed";
    } catch (e) {
      return e.toString();
    }
  }

  // -------------------- FORGOT PASSWORD --------------------

  Future<String> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "Password reset email sent";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Failed";
    } catch (e) {
      return e.toString();
    }
  }

  // -------------------- LOGOUT --------------------

  Future<void> logout() async {
    await _auth.signOut();
  }

  // -------------------- CURRENT USER --------------------

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}