import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/route_model.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/route_card.dart';
import '../widgets/custom_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<RouteModel> _mockRoutes = [
    RouteModel(
      id: 'route_001',
      driverId: 'user_001',
      driverName: 'Omar El-Sayed',
      driverRating: 4.8,
      startLocation: 'Maadi',
      endLocation: 'Tagamoa',
      startLat: 29.9667,
      startLng: 31.2500,
      endLat: 30.0500,
      endLng: 31.4667,
      departureTime: DateTime.now().add(const Duration(minutes: 10)),
      availableSeats: 2,
      price: 25.0,
      type: 'ride',
      preferences: ['AC', 'No smoking'],
      mutualFriendsCount: 3,
    ),
    RouteModel(
      id: 'route_002',
      driverId: 'user_002',
      driverName: 'Nour Hassan',
      driverRating: 4.9,
      startLocation: 'Nasr City',
      endLocation: 'Heliopolis',
      startLat: 30.0500,
      startLng: 31.3500,
      endLat: 30.1000,
      endLng: 31.3167,
      departureTime: DateTime.now(),
      packageSize: 'small',
      price: 15.0,
      type: 'package',
      mutualFriendsCount: 1,
    ),
    RouteModel(
      id: 'route_003',
      driverId: 'user_003',
      driverName: 'Ahmed Khaled',
      driverRating: 4.7,
      startLocation: 'Downtown',
      endLocation: '6th October',
      startLat: 30.0500,
      startLng: 31.2333,
      endLat: 29.9500,
      endLng: 30.9167,
      departureTime: DateTime.now().add(const Duration(minutes: 30)),
      availableSeats: 3,
      price: 35.0,
      type: 'ride',
      mutualFriendsCount: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<AppProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surfaceWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                    onPressed: () {},
                  ),
                  const Expanded(
                    child: Text(
                      'Ala Seketna',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: AppColors.textPrimary),
                        onPressed: () {},
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications_outlined, color: AppColors.textPrimary),
                            onPressed: () {},
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.statusError,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientStart.withOpacity(0.1),
                    AppColors.gradientEnd.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.gradientStart.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.map,
                        size: 40,
                        color: AppColors.gradientStart,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Interactive Map',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Google Maps will be integrated here',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.surfaceWhite,
              child: Row(
                children: [
                  Expanded(
                    child: _buildTab(
                      'People Ride-share',
                      Icons.directions_car,
                      'ride',
                      AppColors.accentRide,
                      appProvider.selectedTab == 'ride',
                      () => appProvider.setTab('ride'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTab(
                      'Package Delivery',
                      Icons.local_shipping,
                      'package',
                      AppColors.accentPackage,
                      appProvider.selectedTab == 'package',
                      () => appProvider.setTab('package'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 100),
                itemCount: _mockRoutes.where((r) => r.type == appProvider.selectedTab).length,
                itemBuilder: (context, index) {
                  final routes = _mockRoutes.where((r) => r.type == appProvider.selectedTab).toList();
                  return RouteCard(
                    route: routes[index],
                    onRequest: () {
                      context.go('/match-details?matchId=${routes[index].id}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton.extended(
          onPressed: () => context.go('/post-route'),
          backgroundColor: AppColors.gradientStart,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            'Drive',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: appProvider.currentIndex,
        onTap: (index) {
          if (index == 0) {
            appProvider.setIndex(0);
          } else if (index == 1) {
            context.go('/chat?tripId=demo');
          } else if (index == 2) {
            context.go('/post-route');
          } else if (index == 3) {
            context.go('/wallet');
          } else if (index == 4) {
            context.go('/profile');
          }
        },
      ),
    );
  }

  Widget _buildTab(
    String label,
    IconData icon,
    String tab,
    Color color,
    bool isActive,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: isActive
              ? LinearGradient(
                  colors: [color, color.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isActive ? null : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(12),
          border: isActive
              ? null
              : Border.all(color: color.withOpacity(0.3), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? Colors.white : color,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
