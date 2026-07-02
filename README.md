# Ala Seketna (على سكتنا)

Community-Based Social Ride-Sharing, Cost-Sharing & Peer-to-Peer Delivery Platform for Egypt.

## 🚀 Features

- **Dual-Feed System**: Toggle between Ride-sharing (Blue) and Package Delivery (Green)
- **Real-time Map**: Interactive map with live driver locations
- **Social Trust**: Mutual friends, community badges, dual ratings
- **Digital Wallet**: Escrow payments, fair fuel cost splitting
- **Live Tracking**: GPS tracking with photo verification
- **In-App Chat**: Real-time coordination between drivers and passengers

## 📱 Screens

1. **Unified Dual Feed & Map** - Browse rides and deliveries
2. **Social & Trust Profile** - Verified profiles with ratings
3. **Instant Match & Package Details** - Secure package handling
4. **Live Delivery Tracking & Chat** - Real-time coordination
5. **Digital Micro-Wallet** - Cashless payments with escrow

## 🛠️ Tech Stack

- **Framework**: Flutter 3.16+
- **State Management**: Provider
- **Navigation**: Go Router
- **Maps**: Google Maps Flutter
- **Backend**: Ready for Firebase/Node.js integration

## 🏗️ Building

### Prerequisites
- Flutter SDK 3.16+
- Android Studio / VS Code
- Android SDK (API 21+)

### Local Build

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/ala_seketna.git
cd ala_seketna

# Install dependencies
flutter pub get

# Run debug version
flutter run

# Build APK
flutter build apk --release

# Build App Bundle for Play Store
flutter build appbundle --release
```

### GitHub Actions CI/CD

The project includes GitHub Actions workflow that automatically builds APK and AppBundle on every push to `main` or `develop` branches.

Build artifacts are available in the Actions tab.

## 🔧 Configuration

### Google Maps API Key

1. Get API key from [Google Cloud Console](https://console.cloud.google.com/)
2. Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY"/>
```

### Firebase Setup (Optional)

1. Create Firebase project
2. Add `google-services.json` to `android/app/`
3. Enable Authentication, Firestore, and Cloud Messaging

## 📁 Project Structure

```
lib/
├── main.dart                 # Entry point
├── models/                   # Data models
│   ├── user_model.dart
│   ├── route_model.dart
│   ├── trip_model.dart
│   └── transaction_model.dart
├── providers/                # State management
│   ├── app_provider.dart
│   ├── auth_provider.dart
│   └── wallet_provider.dart
├── screens/                  # UI screens
│   ├── splash_screen.dart
│   ├── onboarding_screen.dart
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   ├── match_details_screen.dart
│   ├── package_details_screen.dart
│   ├── tracking_screen.dart
│   ├── chat_screen.dart
│   ├── wallet_screen.dart
│   └── post_route_screen.dart
├── theme/                    # Design system
│   └── app_theme.dart
├── utils/                    # Utilities
│   └── app_router.dart
└── widgets/                  # Reusable components
    ├── gradient_button.dart
    ├── route_card.dart
    └── custom_bottom_nav.dart
```

## 🎨 Design System

- **Primary Colors**: Sky Blue (#00B4DB) → Mint Green (#00D2A0)
- **Typography**: Noto Sans Arabic + Inter
- **Components**: Cards, Buttons, Inputs, Badges
- **RTL Support**: Full Arabic right-to-left layout

## 📄 License

MIT License - See LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📞 Contact

For questions or support, contact the development team.

---

**Ala Seketna** - على سكتنا - On Our Way 🚗📦
