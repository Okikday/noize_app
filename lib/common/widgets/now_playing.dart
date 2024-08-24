import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/common/widgets/back_button.dart';
import 'package:noize_app/utils/device_utils.dart';

class NowPlaying extends StatelessWidget {
  final String title;
  final String speaker;
  final String assetName;
  final int elapsedTime;
  const NowPlaying(
      {super.key,
      this.title = "The Future of Remote Work",
      this.speaker = "Jamie Smith",
      this.assetName = "logo.png",
      this.elapsedTime = 10,
    });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceUtils.getScreenWidth(context);
    final double screenHeight = DeviceUtils.getScreenHeight(context);
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Constants.whiteSpaceVertical(64),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton1(color: NoizeColors.lavender.withOpacity(0.5),),
                  Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: NoizeColors.lavender.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "Now Playing",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: Constants.smallPlus2),
                      )),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: NoizeColors.gray,

                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(NoizeColors.lavender.withOpacity(0.5)),
                      shape: WidgetStatePropertyAll(
                        CircleBorder(),
                      ),
                    ),
                    
                  ),
                ],
              ),
            ),
            Constants.whiteSpaceVertical(36),
            Container(
              width: screenWidth * 0.9,
              height: screenWidth,
              child: Stack(
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: screenWidth * 0.9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/noize/$assetName"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(36)),
                  ),
                  Positioned(
                    width: screenWidth * 0.9,
                    height: 56,
                    bottom: screenWidth * 0.04,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(36),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                          child: Container(
                            height: 56,
                            width: 200,
                            padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: NoizeColors.lavender.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.share_rounded),
                                Icon(Icons.heart_broken),
                                Icon(Icons.download_rounded)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Constants.whiteSpaceVertical(48),
            Padding(padding: EdgeInsets.only(left: 24, right: 24), child: Column(
              children: [
                Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Constants.medium, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Constants.whiteSpaceVertical(8),
            Center(child: Text(speaker, textAlign: TextAlign.center,
                style: TextStyle(fontSize: Constants.extraSmall, color: NoizeColors.gray),)),
            
            Constants.whiteSpaceVertical(48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("0:55", style: TextStyle(fontSize: Constants.extraSmall, color: NoizeColors.gray),),
              Text("45:30", style: TextStyle(fontSize: Constants.extraSmall, color: NoizeColors.gray),),
            ],),
            Constants.whiteSpaceVertical(8),
            LinearProgressIndicator(color: NoizeColors.ultraMarine, value: elapsedTime/100, borderRadius: BorderRadius.circular(16), minHeight: 8,),

            Constants.whiteSpaceVertical(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Icon(Icons.repeat_rounded),
              Icon(Icons.skip_previous_rounded),
              Icon(Icons.play_circle_filled_rounded, size: 64, color: NoizeColors.ultraMarine,),
              Icon(Icons.skip_next_rounded),
              Icon(Icons.playlist_add_check_circle)
            ],)
              ],

            ),)

          ],
        ),
      ),
    );
  }
}
