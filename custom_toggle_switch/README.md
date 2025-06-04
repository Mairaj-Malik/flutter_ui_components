# 🛠️ Developer/User Mode Toggle – Flutter Component

This Flutter screen component allows you to toggle between **Developer Mode** and **User Mode** using a custom switch in the AppBar. The layout responds with animated UI transitions and dynamic styling based on the selected mode.

## ✨ Features

- 🔁 Toggle switch in AppBar to change modes
- 💻 **Developer Mode**:
  - Dark background
  - Glowing code icon animation
  - Green accent border
  - Developer-specific labels
- 📱 **User Mode**:
  - Light background
  - Glowing mobile icon animation
  - Deep purple accent border
  - User-specific labels
- 🎨 Animated layout transitions
- 📣 Snackbar notification on toggle

## 🧠 How It Works

- A boolean `isDeveloperMode` tracks the current mode.
- When the switch is toggled, `setState()` updates the UI.
- Two separate `AnimatedContainers` show the Developer and User views.
- `FadeTransition` animates the icon glow effect.
- Border color and background update according to the mode.

## 📦 Usage

1. Add the `DeveloperUserScreen` widget to your project.
2. Use it as a standalone screen or inside your navigation flow.

```dart
import 'package:your_app/screens/developer_user_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DeveloperUserScreen(),
    );
  }
}           
```
##🛠 Customization
You can easily customize:

Colors (border, background, icons)

Icons (Icons.code, Icons.phone_android)

Text labels for each mode

Animation durations

##📁 File Structure

lib/
├── screens/
│   └── developer_user_screen.dart
└── main.dart

##📌 Ideal For
Practicing Flutter UI animations

Building apps with role-based or theme toggles

Demonstrating state-based UI updates

Made with 💚 by Mairaj Malik

## 🙋‍♂️About Me
Mairaj Malik
Software Engineering Student | Flutter Developer in Progress

🔗 LinkedIn:https://www.linkedin.com/in/mairajmalik
