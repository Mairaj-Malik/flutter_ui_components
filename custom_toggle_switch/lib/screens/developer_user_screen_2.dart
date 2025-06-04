import 'package:flutter/material.dart';

class DeveloperUserScreen extends StatefulWidget {
  const DeveloperUserScreen({super.key});

  @override
  State<DeveloperUserScreen> createState() => _DeveloperUserScreenState();
}

class _DeveloperUserScreenState extends State<DeveloperUserScreen> {
  bool isDeveloperMode = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
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
            onChanged: (value) => setState(() => isDeveloperMode = value),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
      children: [
        Container(
          key: ValueKey('dev'),
          width: double.infinity,
          height: screenHeight / 2.2,
          decoration: BoxDecoration(color: isDeveloperMode ? const Color(0xFF121212): Colors.grey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.code, size: 80, color: isDeveloperMode ? Colors.greenAccent: Colors.grey[700]),
              const SizedBox(height: 20),
              Text(
                "Coding in Progress...",
                style: TextStyle(color: isDeveloperMode ? Colors.greenAccent: Colors.grey[700]),
              ),
              const SizedBox(height: 10),
              Text(
                "Terminal • Debug Console • Logs",
                style: TextStyle(fontSize: 18, color: isDeveloperMode ? Colors.white70: Colors.grey[700]),
              ),
            ],
          ),
        ),
        Container(
          key: ValueKey('user'),
          width: double.infinity,
          height: screenHeight / 2.3,
          decoration: BoxDecoration(color: isDeveloperMode ? Colors.grey: Colors.grey[300]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_android, size: 80, color: isDeveloperMode ? Colors.grey[700]: Colors.deepPurple),
              const SizedBox(height: 20),
              Text("Using the App...",
                  style: TextStyle(fontSize: 28, color: isDeveloperMode ? Colors.grey[700]: Colors.deepPurple)),
              const SizedBox(height: 10),
              Text("UI • Features • Interaction",
                  style: TextStyle(fontSize: 18, color: isDeveloperMode ? Colors.grey[700]: Colors.black87)),
            ],
          ),
        ),
      ],
              ),
    );
  }
}
