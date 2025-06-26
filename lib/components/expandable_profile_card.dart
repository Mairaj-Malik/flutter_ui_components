import 'package:flutter/material.dart';

class SmoothAnimatedCard extends StatefulWidget {
  const SmoothAnimatedCard({super.key});

  @override
  SmoothAnimatedCardState createState() => SmoothAnimatedCardState();
}

class SmoothAnimatedCardState extends State<SmoothAnimatedCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(_controller);
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expandable Profile Card',style: TextStyle(color: Colors.white70),),
        centerTitle: true,
        backgroundColor: Colors.grey.shade700,
      ),
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: Text(
                    _isExpanded ? "Tap to Close" : "Tap to Expand",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                GestureDetector(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                  child: SizedBox(
                    width: 300,
                    child: Card(
                      margin: EdgeInsets.all(16),
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/expandable_profile_card_asset/user.jpg'),
                          ),
                          Text(
                            'Mairaj Malik',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Software Engineering Student',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          SizedBox(height: 10),

                          AnimatedCrossFade(
                            firstChild: SizedBox.shrink(),
                            secondChild: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("📧 malick.mairaj22@gmai.com"),
                                  Text("📍 Rawalpindi, PK"),
                                ],
                              ),
                            ),
                            crossFadeState:
                            _isExpanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: Duration(milliseconds: 400),
                            firstCurve: Curves.easeOut,
                            secondCurve: Curves.easeIn,
                          ),
                        ],
                      ),
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
