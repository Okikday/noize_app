import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/common/widgets/continue_listening.dart';
import 'package:noize_app/common/widgets/featured_podcasts.dart';
import 'package:noize_app/common/widgets/search_podcast.dart';
import 'package:noize_app/common/widgets/top_categories.dart';
import 'package:noize_app/common/widgets/trending_podcasts.dart';
import 'package:noize_app/storage/data.dart';
import 'package:noize_app/utils/device_utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceUtils.getScreenWidth(context);
    final double screenHeight = DeviceUtils.getScreenHeight(context);

    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: NoizeColors.ultraMarine,
      child: SingleChildScrollView(
        child: SizedBox(

          child: Center(
            child: Column(
              children: [
                Constants.whiteSpaceVertical(64),
                //Logo part
                Constants.wrapInBox(
                  width: screenWidth * 0.9,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      width: screenWidth * 0.35,
                      height: screenWidth * 0.35 * 0.25,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/noize/logo_1.png"))
                      ),
                      ),
                      Constants.wrapInBox(
                    Icon( 
                      Icons.notifications_outlined,
                      size: 28,
                      color: Theme.of(context).colorScheme.primary
                    ),
                    size: 48,
                    color: DeviceUtils.isDarkMode(context) ? NoizeColors.lavender.withOpacity(0.2) : NoizeColors.lavender.withOpacity(0.75),
                    radius: 40,),
                  ],),
                ),
                Constants.whiteSpaceVertical(28),
                Center(child: SearchPodcast(width: screenWidth * 0.9, )),
                Constants.whiteSpaceVertical(24),
                Center(
                  child: FeaturedPodcasts(featuredPodcastsList: NoizeSharedPreferences.featuredPodcastsList, width: screenWidth,),
                ),
                Constants.whiteSpaceVertical(24),
                Center(child: TrendingPodcasts(trendingLists: NoizeSharedPreferences.trendingPodcasts, width: screenWidth,),),
                Constants.whiteSpaceVertical(24),
                Center(child: ContinueListening(listeningList: NoizeSharedPreferences.continueListeningList, width: screenWidth,),),
                Constants.whiteSpaceVertical(24),
                TopCategories(list: NoizeSharedPreferences.categories, ),
                Constants.whiteSpaceVertical(64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}