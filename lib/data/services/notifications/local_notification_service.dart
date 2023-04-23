import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService{

  final _service = FlutterLocalNotificationsPlugin();


  Future<void> initialize() async{
    debugPrint('@NOTIFICATIONS initialize STARTING...');
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@drawable/ic_stat_whitsle');
    const InitializationSettings settings = InitializationSettings(android: androidSettings);
    bool? isInit = await _service.initialize(settings,);
    debugPrint('@NOTIFICATIONS initialized $isInit');
  }

  Future<NotificationDetails> _notificationsDetails(String icon) async{
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'my_channel_id',
      'my_channel_name',
      channelDescription: 'my_description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: false,
      enableVibration: false,
      icon: icon,
    );
    return NotificationDetails(android: androidNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String icon,
  }) async{
    debugPrint('@NOTIFICATIONS showNotification STARTING...');
    final details = await _notificationsDetails(icon);
    await _service.show(id, title, body, details);
  }

  void onDidReceiveLocalNotification({int? id, String? title, String? body, String? payload}){
    debugPrint('@NOTIFICATIONS $id');
  }
}