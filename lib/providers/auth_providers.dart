import 'package:easyreach/services/auth_services.dart';
import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // ---------------- USER REGISTER ----------------

  Future<bool> registerUser({
    required String fullName,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    String result = await _authService.registerUser(
      fullName: fullName,
      username: username,
      email: email,
      phone: phone,
      password: password,
    );

    _isLoading = false;

    if (result == "success") {
      notifyListeners();
      return true;
    } else {
      _errorMessage = result;
      notifyListeners();
      return false;
    }
  }

  // ---------------- PROFESSIONAL REGISTER ----------------

  Future<bool> registerProfessional({
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
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    String result = await _authService.registerProfessional(
      fullName: fullName,
      username: username,
      email: email,
      phone: phone,
      profession: profession,
      experience: experience,
      qualification: qualification,
      workplace: workplace,
      bio: bio,
      password: password,
    );

    _isLoading = false;

    if (result == "success") {
      notifyListeners();
      return true;
    } else {
      _errorMessage = result;
      notifyListeners();
      return false;
    }
  }

  // ---------------- LOGIN WITH EMAIL ----------------

  Future<bool> loginWithEmail({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    String result = await _authService.loginWithEmail(
      email: email,
      password: password,
    );

    _isLoading = false;

    if (result == "success") {
      notifyListeners();
      return true;
    } else {
      _errorMessage = result;
      notifyListeners();
      return false;
    }
  }

  // ---------------- LOGIN WITH USERNAME ----------------

  Future<bool> loginWithUsername({
    required String username,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    String result = await _authService.loginWithUsername(
      username: username,
      password: password,
    );

    _isLoading = false;

    if (result == "success") {
      notifyListeners();
      return true;
    } else {
      _errorMessage = result;
      notifyListeners();
      return false;
    }
  }

  // ---------------- FORGOT PASSWORD ----------------

  Future<bool> forgotPassword(String email) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    String result = await _authService.forgotPassword(email);

    _isLoading = false;

    if (result == "Password reset email sent") {
      notifyListeners();
      return true;
    } else {
      _errorMessage = result;
      notifyListeners();
      return false;
    }
  }

  // ---------------- LOGOUT ----------------

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }
}