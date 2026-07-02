import 'package:go_router/go_router.dart';
import '../screens/splash_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/wallet_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/post_route_screen.dart';
import '../screens/match_details_screen.dart';
import '../screens/tracking_screen.dart';
import '../screens/package_details_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/wallet',
        builder: (context, state) => const WalletScreen(),
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) {
          final tripId = state.uri.queryParameters['tripId'] ?? '';
          return ChatScreen(tripId: tripId);
        },
      ),
      GoRoute(
        path: '/post-route',
        builder: (context, state) => const PostRouteScreen(),
      ),
      GoRoute(
        path: '/match-details',
        builder: (context, state) {
          final matchId = state.uri.queryParameters['matchId'] ?? '';
          return MatchDetailsScreen(matchId: matchId);
        },
      ),
      GoRoute(
        path: '/tracking',
        builder: (context, state) {
          final tripId = state.uri.queryParameters['tripId'] ?? '';
          return TrackingScreen(tripId: tripId);
        },
      ),
      GoRoute(
        path: '/package-details',
        builder: (context, state) {
          final tripId = state.uri.queryParameters['tripId'] ?? '';
          return PackageDetailsScreen(tripId: tripId);
        },
      ),
    ],
  );
}
