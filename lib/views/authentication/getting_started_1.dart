import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/utils/device_utils.dart';
import 'package:noize_app/views/authentication/sign_in.dart';
import 'package:noize_app/main.dart';

class GettingStarted1 extends StatelessWidget {
  const GettingStarted1({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceUtils.getScreenWidth(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        runApp(const MyApp());
        debugPrint("Back to MainApp");
      },

      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Noize Logo
            ClipRRect(
              child: Container(
                width: 200,
                height: 0.25 * 200,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(image: AssetImage("assets/noize/logo_1.png"), 
                  )
                ),
              ),
            ),
            Constants.whiteSpaceVertical(12),
        
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(screenWidth * 0.25),
              width: screenWidth,
              decoration: BoxDecoration(
                
                gradient: DeviceUtils.isDarkMode(context) ? const LinearGradient(colors: [Colors.transparent, Colors.transparent]) : RadialGradient(colors: [NoizeColors.mountBattenPink, NoizeColors.antiFlashWhite, ], center: const Alignment(0, 0), radius: 0.55, stops: const [0.5, 1.0]),
              ),
              child: Image.asset("assets/noize/logo.png",),
            ),
              
            Constants.whiteSpaceVertical(2),
              
            SizedBox(width: screenWidth * 0.8, child: Text("Tune in to your preferred podcasts", textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.big),),),
              
            Constants.whiteSpaceVertical(12),
              
            SizedBox(width: screenWidth * 0.8, child: Text("1000+ of the most inspiring talks ever", textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),),
              
            Constants.whiteSpaceVertical(16),
              
            MaterialButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));}, color: NoizeColors.ultraMarine, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), minWidth: screenWidth * 0.9, height: 48, child: Text("Sign in", style: TextStyle(color: NoizeColors.white),),),
              
            Constants.whiteSpaceVertical(16),
              
            MaterialButton(onPressed: (){}, color: const Color.fromRGBO(245, 229, 229, 0.3),  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), minWidth: screenWidth * 0.9, height: 48, child: Text("Sign up", style: TextStyle(color: NoizeColors.ultraMarine),),)
              
          ],
        ),
      ),
    );
  }
}