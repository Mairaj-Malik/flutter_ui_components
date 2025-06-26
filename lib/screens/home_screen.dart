import 'package:flutter/material.dart';
import 'package:flutter_ui_components/components/animated_step_progress_bar.dart';
import 'package:flutter_ui_components/components/developer_user_screen.dart';
import 'package:flutter_ui_components/components/expandable_profile_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Text(
          'Flutter UI Components',
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SmoothAnimatedCard(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade500,
                  foregroundColor: Colors.white70,
                ),
                child: Text('Expandable Profile Card'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DeveloperUserScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade500,
                  foregroundColor: Colors.white70,
                ),
                child: Text('Custom Toggle Switch'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AnimatedStepProgressBar()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade500,
                  foregroundColor: Colors.white70,
                ),
                child: Text('Animated Step Progress Bar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
