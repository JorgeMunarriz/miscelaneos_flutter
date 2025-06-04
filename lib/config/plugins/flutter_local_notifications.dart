// ignore_for_file: avoid_print
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_app_badger/flutter_app_badger.dart';

// class AppBadgePlugin {
//   static Future<bool> get isBadgeSupported {
//     return FlutterAppBadger.isAppBadgeSupported();
//   }

//   static void updateBadgeCount(int count) async {
//     if (!await isBadgeSupported) {
//       print('Badge no soportado');
//       return;
//     }

//     FlutterAppBadger.updateBadgeCount(count);

//     if (count == 0) removeBadge();
//   }

//   static void removeBadge() async {
//     if (!await isBadgeSupported) {
//       print('Badge no soportado');
//       return;
//     }

//     FlutterAppBadger.removeBadge();
//   }
// }

class FlutterLocalNotifications {
  static final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  static Future<void> showBadgeNotification(int count) async {
    final androidDetails = AndroidNotificationDetails(
      'badge_channel',
      'Badge Notifications',
      channelDescription: 'Channel for badge updates',
      importance: Importance.high,
      priority: Priority.high,
      channelShowBadge: true,
      number: count,
      playSound: false,
      enableVibration: false,
    );

    const iosDetails = DarwinNotificationDetails(badgeNumber: 1);

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Badge actualizado',
      'Tienes $count notificaciones pendientes',
      notificationDetails,
    );
  }

  static Future<void> removeBadge() async {
    // Cancelamos la notificación para eliminar el badge en Android
    await _flutterLocalNotificationsPlugin.cancel(0);

    // En iOS ponemos badge en 0 para remover
    // await _flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         IOSFlutterLocalNotificationsPlugin>()
    //     ?.setBadgeCount(0);
  }
}
