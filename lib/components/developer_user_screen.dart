import 'package:flutter/material.dart';

class DeveloperUserScreen extends StatefulWidget {
  const DeveloperUserScreen({super.key});

  @override
  State<DeveloperUserScreen> createState() => _DeveloperUserScreenState();
}

class _DeveloperUserScreenState extends State<DeveloperUserScreen>
    with SingleTickerProviderStateMixin {
  bool isDeveloperMode = true;
  late AnimationController _controller;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          isDeveloperMode ? 'Developer Mode' : 'User Mode',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Switch(
            inactiveThumbColor: Colors.greenAccent,
            value: isDeveloperMode,
            onChanged: (value) => setState((){ isDeveloperMode = value;
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    value ? 'Switched to Developer Mode' : 'Switched to User Mode',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: value ? Colors.green[400] : Colors.deepPurple[300],
                ));}),
          ),
          SizedBox(width: 16),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          _buildDeveloperView(screenHeight, isDeveloperMode, opacityAnimation),
          _buildUserView(screenHeight, isDeveloperMode, opacityAnimation),

        ],
      ),
    );
  }
}

Widget _buildDeveloperView(
  double screenHeight,
  bool isDeveloperMode,
  Animation<double> opacityAnimation,
) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 400),
    key: ValueKey('dev'),
    width: double.infinity,
    height: screenHeight / 2.2,
    decoration: BoxDecoration(
      border: isDeveloperMode
          ? Border.all(
        color: Colors.greenAccent,
        width: 3,
      )
          : null,
      color: isDeveloperMode ? const Color(0xFF121212) : Colors.grey,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
          opacity:
              isDeveloperMode ? opacityAnimation : AlwaysStoppedAnimation(1.0),
          child: Icon(
            Icons.code,
            size: 80,
            color: isDeveloperMode ? Colors.greenAccent : Colors.grey[700],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Coding in Progress...",
          style: TextStyle(
            color: isDeveloperMode ? Colors.greenAccent : Colors.grey[700],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Terminal • Debug Console • Logs",
          style: TextStyle(
            fontSize: 18,
            color: isDeveloperMode ? Colors.white70 : Colors.grey[700],
          ),
        ),
      ],
    ),
  );
}

Widget _buildUserView(
  double screenHeight,
  bool isDeveloperMode,
  Animation<double> opacityAnimation,
) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 400),
    key: ValueKey('user'),
    width: double.infinity,
    height: screenHeight / 2.3,
    decoration: BoxDecoration(
      border: isDeveloperMode
          ? null: Border.all(
        color: Colors.deepPurple,
        width: 3,
      ),
      color: isDeveloperMode ? Colors.grey : Colors.grey[300],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
          opacity:
              isDeveloperMode ? AlwaysStoppedAnimation(1.0) : opacityAnimation,
          child: Icon(
            Icons.phone_android,
            size: 80,
            color: isDeveloperMode ? Colors.grey[700] : Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Using the App...",
          style: TextStyle(
            fontSize: 28,
            color: isDeveloperMode ? Colors.grey[700] : Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "UI • Features • Interaction",
          style: TextStyle(
            fontSize: 18,
            color: isDeveloperMode ? Colors.grey[700] : Colors.black87,
          ),
        ),
      ],
    ),
  );
}
