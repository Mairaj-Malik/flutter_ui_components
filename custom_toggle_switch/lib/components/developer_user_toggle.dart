import 'package:flutter/material.dart';

class DeveloperUserToggle extends StatefulWidget {
  const DeveloperUserToggle({super.key});

  @override
  State<DeveloperUserToggle> createState() => _DeveloperUserToggleState();
}

class _DeveloperUserToggleState extends State<DeveloperUserToggle> {
  bool isDeveloperMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer-User Toggle',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => isDeveloperMode = !isDeveloperMode),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: 280,
            height: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDeveloperMode ? Colors.blueGrey[900] : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                  child: Text(
                    isDeveloperMode ? 'Developer Mode' : 'User Mode',
                    key: ValueKey(isDeveloperMode),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:
                          isDeveloperMode ? Colors.white : Colors.blueGrey[900],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                  child: Text(
                    isDeveloperMode ? 'Building Things...' : 'Using the app...',
                    key: ValueKey('desc-$isDeveloperMode'),
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          isDeveloperMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
