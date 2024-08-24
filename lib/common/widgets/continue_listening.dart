import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/common/styles/constants.dart';
import 'package:noize_app/common/widgets/now_playing.dart';
import 'package:noize_app/utils/device_utils.dart';

class ContinueListening extends StatelessWidget {
  final double width;
  final List listeningList;
  const ContinueListening({super.key, this.width = 350, required this.listeningList});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Constants.wrapInPadding(left: 16, Text("Continue Listening", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.smallPlus2, fontWeight: FontWeight.bold),),),
                Constants.wrapInPadding(right: 16, Text("View all", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.small, fontWeight: FontWeight.bold),),)
              ],
            ),
            Constants.whiteSpaceVertical(16),
            for(int i = 0; i < listeningList.length; i++)
            Column(
              children: [
                SimListTile1(topic: listeningList[i][0], speaker: listeningList[i][1], assetName: listeningList[i][2], elapsedTime: listeningList[i][3],),
                Constants.whiteSpaceVertical(16)
              ],
            )
          ]
        ),
      ),
    );
  }
}


class SimListTile1 extends StatefulWidget {
  final String topic;
  final String speaker;
  final String assetName;
  final int elapsedTime;
  const SimListTile1({
    super.key,
    this.topic = "",
    this.speaker = "",
    this.assetName = "logo.png",
    this.elapsedTime = 50
    
  });

  @override
  State<SimListTile1> createState() => _SimListTile1State();
}

class _SimListTile1State extends State<SimListTile1> {
  IconData icon = Icons.play_arrow_rounded;
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScreenWidth(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: EdgeInsets.all(0),
        splashColor: NoizeColors.lavenderBlush,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NowPlaying(title: widget.topic, assetName: widget.assetName, speaker: widget.speaker, elapsedTime: widget.elapsedTime,)));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: NoizeColors.lavender.withOpacity(0.4)),
          child: Row(
            children: [
              //Picture
              Container(width: 81, height: 81,
               decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/noize/${widget.assetName}"), fit: BoxFit.cover), borderRadius: BorderRadius.circular(24)),),
              Constants.whiteSpaceHorizontal(12),
              //Expanded part
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: screenWidth * 0.5, child: Text(widget.topic, style: TextStyle(color: Theme.of(context).colorScheme.primary,),),),
                  Constants.whiteSpaceVertical(12),
                  Text(widget.speaker, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.extraSmall),),
                  Constants.whiteSpaceVertical(12),
                  LinearProgressIndicator(color: NoizeColors.bitterSweet, value: widget.elapsedTime/100, borderRadius: BorderRadius.circular(16),)
                ],
              )),
              Constants.whiteSpaceHorizontal(8),
              //play button
              SizedBox(
                width: 64,
                child: IconButton(
                onPressed: (){
                  if(icon == Icons.play_arrow_rounded){
                    setState(() => icon = Icons.pause_rounded);
                  }else if(icon == Icons.pause_rounded){
                    setState(() => icon = Icons.play_arrow_rounded);
                  }
                }, icon: Icon(icon, color: NoizeColors.black), padding: const EdgeInsets.all(6), style: ButtonStyle(shape: const WidgetStatePropertyAll(CircleBorder()), backgroundColor: WidgetStatePropertyAll(NoizeColors.lavender)),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}