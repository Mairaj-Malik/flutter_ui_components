import 'package:flutter/material.dart';

class DevUserToggleScreen extends StatefulWidget {
  const DevUserToggleScreen({super.key});

  @override
  State<DevUserToggleScreen> createState() => _DevUserToggleScreenState();
}

class _DevUserToggleScreenState extends State<DevUserToggleScreen> {
  bool isDeveloperMode = true;

  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF121212),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 28, color: Colors.greenAccent),
        bodyMedium: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );

    final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.grey[100],
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 28, color: Colors.deepPurple),
        bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );

    return Theme(
      data: isDeveloperMode ? darkTheme : lightTheme,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDeveloperMode ? Colors.black : Colors.deepPurple,
          title: Text(
            isDeveloperMode ? "Developer Mode" : "User Mode",
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            Switch(
              value: isDeveloperMode,
              activeColor: Colors.greenAccent,
              onChanged: (value) {
                setState(() {
                  isDeveloperMode = value;
                });
              },
            )
          ],
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: isDeveloperMode ? _buildDevView() : _buildUserView(),
        ),
      ),
    );
  }

  Widget _buildDevView() {
    return Center(
      key: const ValueKey("dev"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.code, size: 80, color: Colors.greenAccent),
          const SizedBox(height: 20),
          Text("Coding in Progress...",
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text("Terminal • Debug Console • Logs",
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildUserView() {
    return Center(
      key: const ValueKey("user"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.phone_android, size: 80, color: Colors.deepPurple),
          const SizedBox(height: 20),
          Text("Using the App...",
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text("UI • Features • Interaction",
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
