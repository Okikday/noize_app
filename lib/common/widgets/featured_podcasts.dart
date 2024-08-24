
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/utils/device_utils.dart';

class FeaturedPodcasts extends StatelessWidget {
  final List featuredPodcastsList;
  final double width;
  const FeaturedPodcasts({super.key, required this.featuredPodcastsList, this.width = 350});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.wrapInPadding(left: 16, Text("Featured Podcasts", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.smallPlus2, fontWeight: FontWeight.bold),)),
          Constants.whiteSpaceVertical(16),
          GlowingOverscrollIndicator(
            axisDirection: AxisDirection.right,
            color: NoizeColors.ultraMarine,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Constants.whiteSpaceHorizontal(16),
                  for(int i = 0; i < featuredPodcastsList.length; i++)
                  Row(
                    children: [
                      Card(title: featuredPodcastsList[i][0], speaker: featuredPodcastsList[i][1], type: featuredPodcastsList[i][2], duration: featuredPodcastsList[i][3], assetName: featuredPodcastsList[i][4],),
                      Constants.whiteSpaceHorizontal(14)
                    ],
                  )
                ],
              ),
            ),
          )
      
        ],
      ),
    );
  }
}

//DeviceUtils.isDarkMode(context) ? NoizeColors.lavender.withOpacity(0.2) : NoizeColors.lavender.withOpacity(0.75)


class Card extends StatelessWidget {
  final String? type;
  final String? duration;
  final String? title;
  final String? speaker;
  final String assetName;
  const Card({
    super.key,
    this.type,
    this.title,
    this.duration,
    this.speaker,
    this.assetName = "logo.png"
  });

  @override
  Widget build(BuildContext context) {
    final width = DeviceUtils.getScreenWidth(context) * 0.8;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: DeviceUtils.isDarkMode(context) ? NoizeColors.lavender.withOpacity(0.2) : NoizeColors.lavender.withOpacity(0.75), blurRadius: 10, spreadRadius: 4,)]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: SizedBox(
          width: width,
          height: width * 0.6,
          child: Stack(
            children: [
               Container(
            width: width,
            height: width * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/noize/$assetName"), fit: BoxFit.cover),
              
            ), 
          ),
          
          Positioned(
            top: 8,
            left: 8,
            child: Visibility(
              visible: type != null || type != "" ? true : false,
              child: Container(
                padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: NoizeColors.white,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Text(type ?? "", style: TextStyle(color: NoizeColors.black, fontSize: Constants.superSmall + 2),),
        
              ),
            ),),
      
            Positioned(
              top: 8,
              right: 8,
              child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: NoizeColors.black.withOpacity(0.75),
                borderRadius: BorderRadius.circular(24)
              ),
              child: Text(duration ?? "", style: TextStyle(color: NoizeColors.white, fontSize: Constants.extraSmall),
      
              ))),
      
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(child: Container(height: 48, color: Color.fromARGB(54, 0, 0, 0), child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), child: SizedBox(height: 48,),),))
              ),
      
            Positioned(
              bottom: 2.5,
              left: 12,
              child: SizedBox(
                height: 48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? "", style: TextStyle(color: Colors.white, fontSize: Constants.small),),
                  Constants.whiteSpaceVertical(4),
                  Text(speaker ?? "", style: TextStyle(color: Colors.white, fontSize: Constants.extraSmall),),
                ],
                          ),
              ),),
      
            
            ],
          ),
        ),
      ),
    );
  }
}

