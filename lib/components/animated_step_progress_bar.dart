import 'package:flutter/material.dart';

class AnimatedStepProgressBar extends StatefulWidget {
  const AnimatedStepProgressBar({super.key});

  @override
  State<AnimatedStepProgressBar> createState() =>
      _AnimatedStepProgressBarState();
}

class _AnimatedStepProgressBarState extends State<AnimatedStepProgressBar> {
  int currentStep = 0;

  final List<String> stepTitles = ['Start', 'Details', 'Payment', 'Finish'];

  final List<String> imagePath = [
    'assets/animated_step_progress_bar_assets/setting.png',
    'assets/animated_step_progress_bar_assets/file.png',
    'assets/animated_step_progress_bar_assets/payment-method.png',
    'assets/animated_step_progress_bar_assets/complete.png'
  ];

  void nextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  Color getStepColor(int index) {
    if (index < currentStep) return Color(0xff5A827E);
    if (index == currentStep) return Color(0xffB9D4AA);
    return Colors.grey[300]!;
  }

  Widget getImage(int index) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Image(
        key: ValueKey<String>(imagePath[index]), // Unique key for each image
        color: Color(0xff84AE92),
        width: 250,
        height: 400,
        image: AssetImage(imagePath[index]),
      ),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  Widget buildStep(int index) {
    bool isCompleted = index < currentStep;
    bool isActive = index == currentStep;

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: getStepColor(index),
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? Color(0xff84AE92) : Colors.grey,
              width: 3,
            ),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: isCompleted || isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          stepTitles[index],
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isCompleted || isActive ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildLine(bool isActive) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 4,
        color: isActive ? Color(0xff84AE92) : Colors.grey[300],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated Step Progress Bar',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Color(0xff84AE92),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            getImage(currentStep),
            Spacer(),
            Row(
              children: [
                for (int i = 0; i < 4; i++) ...[
                  buildStep(i),
                  if (i != 3) buildLine(i < currentStep),
                ],
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: previousStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff84AE92),
                    foregroundColor: Colors.white70
                  ),
                  child: const Text('Back'),
                ),
                ElevatedButton(onPressed: nextStep,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff84AE92),
                        foregroundColor: Colors.white70
                    ),child: const Text('Next')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
