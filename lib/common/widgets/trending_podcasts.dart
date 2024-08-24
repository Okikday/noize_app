import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/common/styles/constants.dart';

class TrendingPodcasts extends StatelessWidget{
  final List trendingLists;
  final double width;
  const TrendingPodcasts({
    super.key,
    required this.trendingLists,
    this.width = 350,
  });
  
   @override
   Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Constants.wrapInPadding(left: 16, Text("Trending Podcasts", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.smallPlus2, fontWeight: FontWeight.bold),),),
              Constants.wrapInPadding(right: 16, Text("View all", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.small, fontWeight: FontWeight.bold),),)
            ],
          ),
          Constants.whiteSpaceVertical(16),
          for(int i = 0; i < trendingLists.length; i++)
          Column(
            children: [
              PodcastList(topic: trendingLists[i][0], speaker: trendingLists[i][1], duration: trendingLists[i][2], assetName: trendingLists[i][3],),
              Constants.whiteSpaceVertical(12),
            ],
          )
        ]
      ),
    );
   }
}

class PodcastList extends StatefulWidget {
  final String? assetName;
  final String? topic;
  final String? speaker;
  final String? duration;

  const PodcastList({
    super.key,
    this.assetName = "logo.png",
    this.topic = "",
    this.speaker = "",
    this.duration = "",

  });

  

  @override
  State<PodcastList> createState() => _PodcastListState();
}

class _PodcastListState extends State<PodcastList> {
  IconData icon = Icons.play_arrow_rounded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListTile(
        leading: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/noize/${widget.assetName}"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      
        title: Text("${widget.topic}", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.extraSmall + 1),),
      
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.whiteSpaceVertical(12),
            Text("${widget.speaker}", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.extraSmall),),
            Constants.whiteSpaceVertical(8),
            Text("${widget.duration}", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.extraSmall)),
          ],
        ),
      
        //Play button
        trailing: IconButton(
          onPressed: (){
            if(icon == Icons.play_arrow_rounded){
              setState(() => icon = Icons.pause_rounded);
            }else if(icon == Icons.pause_rounded){
              setState(() => icon = Icons.play_arrow_rounded);
            }
          }, icon: Icon(icon, color: NoizeColors.black), padding: const EdgeInsets.all(6), style: ButtonStyle(shape: const WidgetStatePropertyAll(CircleBorder()), backgroundColor: WidgetStatePropertyAll(NoizeColors.lavender)),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onTap: (){},
        tileColor: NoizeColors.lavender.withOpacity(0.25),
      ),
    );
  }
}