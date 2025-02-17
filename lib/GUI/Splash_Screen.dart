import 'package:flutter/material.dart';
import 'Onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Total animation duration is 5 seconds
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(2.0, -1.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start the animation after delay
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });

    // Navigate after 3 seconds from animation start
    Future.delayed(const Duration(seconds: 3), () { // 1 second initial delay + 3 seconds = 4
      if (!_hasNavigated) {
        _hasNavigated = true;
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const Onboarding(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff486C8F),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "lib/Assets/star.png",
              width: 200,
              height: 200,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SlideTransition(
              position: _animation,
              child: Image.asset(
                "lib/Assets/airplane2.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}