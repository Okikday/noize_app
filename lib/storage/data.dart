//import 'package:shared_preferences/shared_preferences.dart';

class NoizeSharedPreferences{

  // static late SharedPreferences preferences;
  // static Future initSharedPref () async => preferences = await SharedPreferences.getInstance();

  //Will be ignoring Shared prefs for a while


  //topic, speaker, type, duration, assetName
  static List featuredPodcastsList = [
    ["Unlocking Creative potential in the...", "Alex Johnson", "Originals", "1:06:18", "podcast_16.jpg"],
    ["The Future of Remote Work", "Jamie Smith", "Originals", "54:53", "podcast_15.jpg"],
    ["Building Resilience in Times of Chan...", "Taylor Brown", "Originals", "48:12", "podcast_6.jpg"],
    ["The Power of Effective Communicati...", "Morgan Lee", null, "2:05:57", "podcast_7.jpg"],
    ["Strategies of Lifelong Learning", "Casey Green", null, "1:07:45", "podcast_10.jpg"],

  ];

  //topic, speaker, duration, assetName
  static List trendingPodcasts = [
    ["Mastering Remote Collaboration", "Jordan Lee", "45:42", "podcast_10.jpg"],
    ["The Art of Mindful Living", "Taylor Swift", "58:30", "podcast_6.jpg"],
    ["Breaking into Tech careers", "Casey Green", "1:20:45", "podcast_5.jpg"],
    ["Healthy Eating Habits", "Morgan Brown", "30:10", "podcast_8.jpg"],
    ["Strategies for Lifelong Learning", "Bruno Mars", "45:54", "podcast_8.jpg"],
    ["The Future of Remote Work", "Jamie Smith", "1:07:30", "podcast_7.jpg"],
  ];

  //name, available
  static List categories = [
    ["Travel", 40, "podcast_5.jpg"],
    ["Health & Wellness", 50, "podcast_6.jpg"],
    ["Education", 35, "podcast_7.jpg"],
    ["Business", 10, "podcast_8.jpg"],
    ["Technology", 59, "podcast_9.jpg"],
    ["Travel", 40, "podcast_10.jpg"],
    ["Entertainment", 75, "podcast_11.jpg"],
    ["Relaxation", 47, "podcast_12.jpg"],
    ["Health Tips", 24, "podcast_13.jpg"],
    ["Flutter things 😉", 28, "podcast_14.jpg"],
  ];

  //
  static List continueListeningList = [
    ["Breaking into Tech Careers", "Jamie Smith", "podcast_5.jpg", 20],
    ["The Art of Mindful Living", "Taylor Smith", "podcast_13.jpg", 30],
    ["Mastering Remote Collaboration", "Jordan Lee", "podcast_14.jpg", 45],
    ["Healthy Eating Habits", "Morgan Brown", "podcast_15.jpg", 60],
    ["Strategies for Lifelong Learning", "Casey Green", "podcast_16.jpg", 25],
    
  ];


  
}