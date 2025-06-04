import 'package:custom_toggle_switch/components/developer_user_toggle.dart';
import 'package:custom_toggle_switch/screens/developer_user_screen.dart';
import 'package:custom_toggle_switch/screens/developer_user_screen_2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Custom Toggle Switch',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeveloperUserScreen(),
                    ),
                  ),
              child: Text('Developer-User Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
