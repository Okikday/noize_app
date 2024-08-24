import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/utils/device_utils.dart';

class TopCategories extends StatelessWidget {
  final List list;

  const TopCategories({
    super.key,
    required this.list,

    
  });
  //TopCategories name, location, rating, asset
 
  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          Constants.whiteSpaceVertical(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Constants.wrapInPadding(
                  left: 16,
                  Text(
                    "Top Categories",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.medium),
                  ),
                ),
              Constants.wrapInPadding(
                  Text(
                    "View all >",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Constants.small),
                  ),
                  right: 12
                  ),
            ],
          ),
          Constants.whiteSpaceVertical(8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < list.length; i++) 
                  TopCategoriesBox(topic: list[i][0], podCount: list[i][1], assetName: list[i][2], first: i == 0 ? true : false, last: i == list.length-1 ? true : false,),
                ],
              ),
            ),
          Constants.whiteSpaceVertical(12)
        ],
      ),
    );
  }
}

class TopCategoriesBox extends StatelessWidget {
  final String topic;
  final String assetName;
  final int podCount;
  final bool? first;
  final bool? last;
  const TopCategoriesBox({
    super.key,
    this.topic = "",
    this.assetName = "logo.png",
    this.podCount = 0,
    this.first = false,
    this.last = false,
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.fromLTRB(first == true ? 16 : 8, 8, last == true ? 12 : 8, 8),
        child: Constants.wrapInBox(
          radius: 18,
          innerPadding: 6,
          color: Color.fromARGB(24, 247, 247, 247),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/noize/$assetName"),
                ),
              ),
            ),
            Constants.whiteSpaceVertical(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" $topic", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                //Text(rating.toString()),
              ],
            ),
            Constants.whiteSpaceVertical(4),
            Text(
              " $podCount",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.extraSmall),
            ),
            Constants.whiteSpaceVertical(8),
          ],
        ),
            ),
      );
  }
}