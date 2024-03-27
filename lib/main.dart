
import 'package:awesome_notifications/awesome_notifications.dart';


import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';


import 'Splash_Screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(channelGroupKey:"Basic channel Group",channelKey:"Basic Channel" , channelName:"Basic Notification" , channelDescription: "Test channel")
    ],channelGroups:[
      NotificationChannelGroup(channelGroupKey: "Basic Channel group", channelGroupName: "Basic Group")
  ]
  );bool isAllowedsendNoti=await AwesomeNotifications().isNotificationAllowed();
  if(!isAllowedsendNoti){
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),

    );
  }
}
