import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  // Mock login for development
  Future<void> login(String phone, String otp) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _currentUser = UserModel(
      id: 'user_001',
      fullName: 'Omar El-Sayed',
      phoneNumber: phone,
      email: 'omar@example.com',
      avatarUrl: null,
      isVerified: true,
      driverRating: 4.8,
      packageRating: 4.9,
      totalTrips: 127,
      badges: ['Super Driver', 'Green Commuter', 'Neighborhood Hero'],
      mutualFriends: ['friend_1', 'friend_2', 'friend_3'],
      vehicleModel: 'Hyundai Verna',
      vehicleColor: 'White',
      vehicleYear: '2019',
      joinedAt: DateTime(2024, 3, 15),
    );

    _isAuthenticated = true;
    _isLoading = false;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
