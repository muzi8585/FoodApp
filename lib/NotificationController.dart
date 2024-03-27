
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController{
  //When a otification is Created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification ) async{
  }
  //Detect Everytime notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayMethod(ReceivedNotification receivedNotification) async{}
  //
  @pragma("vm:entry-point")
  static Future<void> onDismissActionRecieveMethod(ReceivedNotification receivedNotification) async{}
  //detect when a user tap on notification button
  @pragma("vm:entry-point")
  static Future<void> onActionRecieveMethod(ReceivedNotification receivedNotification) async{}
}