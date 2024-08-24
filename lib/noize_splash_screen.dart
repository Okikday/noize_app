import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/views/authentication/getting_started_1.dart';
import 'package:noize_app/main.dart';

class NoizeSplashScreen extends StatefulWidget {
  const NoizeSplashScreen({super.key});

  @override
  State<NoizeSplashScreen> createState() => _NoizeSplashScreenState();
}

class _NoizeSplashScreenState extends State<NoizeSplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> progress;
  late Animation<double> scale;
  late bool isPassed;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    progress = Tween<double>(begin: 0, end: 1).animate(controller);
    scale = Tween<double>(begin: 0.5, end: 1).animate(controller);
    isPassed = false;
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    controller.forward();

    Future.delayed(const Duration(milliseconds: 2000), (){
       if(isPassed == false){
      // ignore: use_build_context_synchronously
       Navigator.push(context, MaterialPageRoute(builder: (context) => const GettingStarted1()));
     }
      isPassed = true;
    });
    

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        runApp(const MyApp());
        debugPrint("Back to MainApp");
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: scale,
                child: Image.asset("assets/noize/logo_1.png", width: 250, height: 250 * 0.25,)),
              Constants.whiteSpaceVertical(24),
              RotationTransition(
                turns: scale,
                child: FadeTransition(
                  opacity: scale,
                  child: ScaleTransition(
                    scale: scale,
                    child: AnimatedIcon(icon: AnimatedIcons.pause_play, progress: progress, color: NoizeColors.ultraMarine, size: 200,)),
                ),
              ),
              ],
          ),
        ),
      ),
    );
  }
}