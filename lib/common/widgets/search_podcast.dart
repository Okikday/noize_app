import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/utils/device_utils.dart';

class SearchPodcast extends StatelessWidget {
  final double width;
  const SearchPodcast({super.key, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: DeviceUtils.isDarkMode(context) ? NoizeColors.lavender.withOpacity(0.2) : NoizeColors.lavender.withOpacity(0.75),
      ),
      height: 48,
      width: width,
      child: Row(
        children: [
          Constants.whiteSpaceHorizontal(16),
          Icon(Icons.search_rounded),
          Constants.whiteSpaceHorizontal(8),
          Expanded(child: Text("Search podcast...", style: TextStyle(color: Theme.of(context).colorScheme.primary),)),
        ],
      ),
    );
  }
}