import 'package:flutter/material.dart';
// import 'package:quizapp/InstructionScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:quizapp/InstructionScreen.dart';
import 'package:quizapp/main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
   // bool _isAnimate = false;

  @override
  void initState() {
    super.initState();
    // _updateSecurityProvider();
    Future.delayed(Duration(milliseconds: 500), (){
    });

  }
  
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        // Animated Splash Screen
        child: AnimatedSplashScreen(   
        duration: 3000,
        backgroundColor: Colors.green,
        // splash - is the animation.
        splash: 
        Container(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              child: Image.asset('images/quiz-game.png',)),
        ],
        ),),
        // The Navigation to the next Screen and then Transition to reach there. 
        nextScreen: const Instructionscreen(),
        splashTransition: SplashTransition.fadeTransition),
      ),    
    );
  }
}